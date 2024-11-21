from django.http import HttpResponseNotFound
from django.shortcuts import render, redirect
from .models import Formulario, feedback, Usuario, CursoCalendario, Cursos
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
from django.contrib import messages
import os
import re
from django.db import connection
from django.core.files.storage import FileSystemStorage

loginRealizado = True

def home(request):
    global loginRealizado
    return render(request, 'cursos/home.html', {'loginRealizado': loginRealizado})

def sobre(request):
    return render(request, 'cursos/sobre.html')

def login(request):
    return render(request, 'cursos/login.html')

def questionario(request):
    return render(request, 'cursos/questionario.html')

def perfilCurso(request):
    return render(request, 'cursos/perfilCurso.html')

def calendario(request):
    global loginRealizado
    return render(request, 'cursos/calendario.html', {'loginRealizado': loginRealizado})
def historia(request):
    global loginRealizado
    return render(request, 'cursos/historia.html',{'loginRealizado': loginRealizado})

def Termos(request):
    return render(request, 'cursos/Termos.html')

def Logout(request):
    global loginRealizado
    loginRealizado = False
    return render(request, 'cursos/home.html')

def validar_contato(telefoneForm, emailForm):
    padrao_email = r'^[\w\.-]+@[\w\.-]+\.\w{2,3}$'
    padrao_telefone = r'^\(\d{2}\) \d{4,5}-\d{4}$'

    if not re.match(padrao_email, emailForm) or not re.match(padrao_telefone, telefoneForm):
        return False
    return True

def incrementar_cliques(curso_id):
    with connection.cursor() as cursor:
        cursor.execute("UPDATE Cursos SET cliques_cursos = cliques_cursos + 1 WHERE id_curso = %s", [curso_id])

def mostrar_perfil_curso(request, curso_id):
    try:
        incrementar_cliques(curso_id)

        # Consulta as tags de cursos
        query_tags = 'SELECT tipo FROM TiposCursos'
        with connection.cursor() as cursor:
            cursor.execute(query_tags)
            tags = [tag[0] for tag in cursor.fetchall()]

        # Consulta as informações do curso
        with connection.cursor() as cursor:
            query = """
                SELECT id_curso, nome_curso, tipo_curso, descricao_curso, 
                       horas_curso, cliques_cursos, imagem_curso, statusPag_curso, dias_curso, resumo_curso, tags_cursos, status_curso
                FROM Cursos WHERE id_curso = %s;
            """
            cursor.execute(query, [curso_id])
            curso = cursor.fetchone()

            if curso:
                curso_dict = {
                    'id_curso': curso[0],            # ID do curso
                    'nome_curso': curso[1],          # Nome do curso
                    'tipo_curso': curso[2],          # Tipo do curso
                    'descricao_curso': curso[3],     # Descrição do curso
                    'horas_curso': curso[4],         # Horas do curso
                    'cliques': curso[5],             # Cliques no curso
                    'imagem_curso': curso[6],        # URL da imagem do curso
                    'statusPag_curso': curso[7],     # Status de pagamento do curso
                    'dias_curso': curso[8],          # Dias do curso
                    'resumo_curso': curso[9],        # Resumo do curso
                    'tags_curso': curso[10],         # Tags do curso
                    'status_curso': curso[11]        # Status do curso (1 ou 0)
                }
                return render(request, 'cursos/perfilCurso.html', {
                    'curso': curso_dict,
                    'estadoPagina': 'mostrar',
                    'tags': tags,
                    'loginRealizado': loginRealizado
                })

        return HttpResponseNotFound('<h1>Curso não encontrado</h1>')

    except Exception as e:
        print(f"Erro ao buscar curso: {e}")
        return HttpResponseNotFound('<h1>Curso não encontrado</h1>')

def cursos(request, filtro=None):
    # Query para buscar cursos
    query_cursos = '''
        SELECT id_curso, nome_curso, tipo_curso, cliques_cursos, tags_cursos, imagem_curso
        FROM Cursos where status_curso = 1
    '''
    if filtro == 'populares':
        query_cursos += ' ORDER BY cliques_cursos DESC'

    with connection.cursor() as cursor:
        cursor.execute(query_cursos)
        cursos = cursor.fetchall()

    # Monta lista de cursos
    cursos_lista = [
        {
            'id_curso': curso[0],
            'nome_curso': curso[1],
            'tipo_curso': curso[2],
            'cliques': curso[3],
            'tags_cursos': curso[4],
            'imagem_curso': curso[5]
        }
        for curso in cursos
    ]

    # Query para buscar tags
    query_tags = 'SELECT tag FROM TagsCursos'
    with connection.cursor() as cursor:
        cursor.execute(query_tags)
        tags = [tag[0] for tag in cursor.fetchall()]  # Extrai apenas o valor da tag

    # Renderiza cursos e tags no template
    return render(request, 'cursos/cursos.html', {
        'cursos': cursos_lista,
        'tags': tags,
        'loginRealizado':loginRealizado
    })


def  adicionar_curso(request):
    if request.method == 'POST':
        try:
            nome_curso = request.POST.get('nome_curso')
            resumo_curso = request.POST.get('resumo_curso')
            tipo_curso = request.POST.get('tipo_curso')
            horas_curso = request.POST.get('horas_curso')
            status_curso = request.POST.get('status_curso') == '1'  # Status como booleano
            descricao_curso = request.POST.get('descricao_curso')
            dias_selecionados = request.POST.get('dias_selecionados', '')
            dias_lista = [dia.strip() for dia in dias_selecionados.split(',') if dia.strip()]
            tags_selecionadas = request.POST.get('tags_selecionadas', '')
            tags_lista = [tag.strip() for tag in tags_selecionadas.split(',') if tag.strip()]
            imagem_curso = request.FILES.get('imagem_curso')

            fs = FileSystemStorage(location=os.path.join('cursos', 'static', 'assets', 'cursos'))

            if not resumo_curso or not tipo_curso or not horas_curso:
                return JsonResponse({'status': 'error', 'message': 'Todos os campos são obrigatórios.'})

            uploaded_file_url = None
            if imagem_curso:
                nome_curso_limpo = re.sub(r'[^a-zA-Z0-9_-]', '', nome_curso.replace(' ', '_'))
                extension = os.path.splitext(imagem_curso.name)[1]
                new_filename = f"{nome_curso_limpo}{extension}"
                filename = fs.save(new_filename, imagem_curso)
                uploaded_file_url = fs.url(filename)

            # Usando o ORM do Django para criar o novo curso
            curso = Cursos.objects.create(
                nome_curso=nome_curso,
                resumo_curso=resumo_curso,
                tipo_curso=tipo_curso,
                horas_curso=horas_curso,
                descricao_curso=descricao_curso,
                dias_curso=dias_lista,
                tags_cursos=tags_lista,
                imagem_curso=uploaded_file_url,
                statusPag_curso=status_curso
            )

            return mostrar_perfil_curso(request, curso.id_curso)

        except Exception as e:
            print(f"Erro ao processar formulário: {e}")
            return JsonResponse({'status': 'error', 'message': str(e)})

    query_tags = 'SELECT tipo FROM tiposcursos'
    with connection.cursor() as cursor:
        cursor.execute(query_tags)
        tipos = [tag[0] for tag in cursor.fetchall()]
    return render(request, 'cursos/perfilCurso.html', {
        'estadoPagina': 'adicionar',
        'tags': tipos,
        'loginRealizado': loginRealizado
        })


def apagar_curso(request, idCurso):
    try:
        with connection.cursor() as cursor:
            cursor.execute("""
                UPDATE Cursos
                SET status_curso = 0
                WHERE id_curso = %s
            """, [
                idCurso
            ])
        return redirect('cursos')
    except Exception as e:
        print(f"Erro ao desativar curso: {e}")
        return JsonResponse({"message": "Erro ao desativar curso"}, status=500)

def carregar_eventos(request):
    query = "SELECT idCalen, titulo, dia, mes, ano, statusCalen FROM cursos_calendario where statusCalen=1"
    eventos = CursoCalendario.objects.raw(query)

    eventos_dict = {}
    for evento in eventos:
        data = f"{evento.ano}-{str(evento.mes).zfill(2)}-{str(evento.dia).zfill(2)}"
        eventos_dict[data] = eventos_dict.get(data, []) + [{
            'title': evento.titulo,
            'id': evento.idCalen,
        }]

    return JsonResponse({'events': eventos_dict})

def editarCurso(request, idCurso):
    with connection.cursor() as cursor:
        query = f"""
            SELECT id_curso, nome_curso, tipo_curso, descricao_curso, 
                   horas_curso, cliques_cursos, imagem_curso, statusPag_curso, dias_curso, resumo_curso, tags_cursos, status_curso
            FROM Cursos WHERE id_curso = {idCurso};
        """
        cursor.execute(query)
        curso = cursor.fetchone()

    if curso:
        curso_dict = {
            'id_curso': curso[0],
            'nome_curso': curso[1],
            'tipo_curso': curso[2],
            'descricao_curso': curso[3],
            'horas_curso': curso[4],
            'cliques': curso[5],
            'imagem_curso': curso[6],
            'statusPag_curso': curso[7],
            'dias_curso': curso[8],
            'resumo_curso': curso[9],
            'tags_curso': curso[10],
            'status_curso': curso[11]
        }

        # Se a requisição for POST, isso indica que o formulário foi submetido
        if request.method == 'POST':
            # Obtém os dados enviados pelo formulário
            nome_curso = request.POST.get('edit_nome_curso')
            resumo_curso = request.POST.get('resumo_curso')
            tipo_curso = request.POST.get('tipo_curso')
            horas_curso = request.POST.get('horas_curso')
            status_curso = request.POST.get('status_curso')
            descricao_curso = request.POST.get('descricao_curso')
            dias_selecionados = request.POST.get('dias_selecionados', '')
            dias_lista = [dia.strip() for dia in dias_selecionados.split(',') if dia.strip()]
            tags_selecionadas = request.POST.get('tags_selecionadas', '')
            tags_lista = [tag.strip() for tag in tags_selecionadas.split(',') if tag.strip()]
            imagem_curso = request.FILES.get('imagem_curso')

            fs = FileSystemStorage(location=os.path.join('cursos', 'static', 'assets', 'cursos'))
            uploaded_file_url = None
            if imagem_curso:
                nome_curso_limpo = re.sub(r'[^a-zA-Z0-9_-]', '', nome_curso.replace(' ', '_'))
                extension = os.path.splitext(imagem_curso.name)[1]
                new_filename = f"{nome_curso_limpo}{extension}"
                filename = fs.save(new_filename, imagem_curso)
                uploaded_file_url = fs.url(filename)

            tags_lista_json = ', '.join(tags_lista)
            dias_lista_json = ', '.join(dias_lista)

            # Atualiza os dados no banco
            if uploaded_file_url == None:
                uploaded_file_url = curso[6]
            with connection.cursor() as cursor:
                cursor.execute("""
                    UPDATE Cursos
                    SET
                        nome_curso = %s,
                        resumo_curso = %s,
                        dias_curso = %s,
                        horas_curso = %s,
                        tipo_curso = %s,
                        statusPag_curso = %s,
                        descricao_curso = %s,
                        tags_cursos = %s,
                        imagem_curso = %s
                    WHERE id_curso = %s
                """, [
                    nome_curso,
                    resumo_curso,
                    dias_lista_json,
                    horas_curso,
                    tipo_curso,
                    status_curso,
                    descricao_curso,
                    tags_lista_json,
                    uploaded_file_url,
                    idCurso
                ])

            # Redireciona para a view de perfil do curso após a edição
            return redirect('perfilCurso', curso_id=idCurso)

        # Se a requisição não for POST, exibe a tela de edição
        query_tags = 'SELECT tipo FROM tiposcursos'
        with connection.cursor() as cursor:
            cursor.execute(query_tags)
            tipos = [tag[0] for tag in cursor.fetchall()]

        return render(request, 'cursos/perfilCurso.html', {
            'estadoPagina': 'editar',
            'tags': tipos,
            'curso': curso_dict,
            'loginRealizado': loginRealizado
        })

    return HttpResponseNotFound('<h1>Curso não encontrado</h1>')

@csrf_exempt
def salvar_evento(request, event_id=None):
    if request.method in ['POST', 'PUT']:
        try:
            data = json.loads(request.body)

            titulo = data.get('titulo', '').strip()
            dia = data.get('dia')
            mes = data.get('mes')
            ano = data.get('ano')

            if not titulo or dia is None or mes is None or ano is None:
                return JsonResponse({'success': False, 'error': 'Dados inválidos.'}, status=400)

            with connection.cursor() as cursor:
                if request.method == 'PUT' and event_id:  # Editar evento existente
                    cursor.execute(
                        "UPDATE cursos_calendario SET titulo = %s, dia = %s, mes = %s, ano = %s, statusCalen = %s WHERE idCalen = %s",
                        [titulo, dia, mes, ano, data.get('statusCalen', 1), event_id]
                    )
                    response = {'success': True}
                elif request.method == 'POST':  # Criar novo evento
                    cursor.execute(
                        "INSERT INTO cursos_calendario (titulo, dia, mes, ano, statusCalen) VALUES (%s, %s, %s, %s, %s)",
                        [titulo, dia, mes, ano, data.get('statusCalen', 1)]
                    )
                    new_event_id = cursor.lastrowid
                    response = {'success': True, 'idCalen': new_event_id}
                else:
                    return JsonResponse({'success': False, 'error': 'Requisição inválida.'}, status=400)

            return JsonResponse(response)
        except Exception as e:
            print(f"Erro ao salvar evento: {e}")  # Exibe o erro no terminal para depuração
            return JsonResponse({'success': False, 'error': 'Erro ao salvar o evento.'}, status=500)
    else:
        return JsonResponse({'success': False, 'error': 'Método não permitido.'}, status=405)


@csrf_exempt
def excluir_evento(request, event_id):
    if request.method in ['POST', 'PUT']:
        with connection.cursor() as cursor:
            if event_id:
                cursor.execute("UPDATE cursos_calendario SET statusCalen = 0 WHERE idCalen = %s", [event_id])
                response = {'success': True}
            else:
                response = {'success': False, 'error': 'Evento não encontrado.'}

            return JsonResponse(response)
    else:
        return JsonResponse({'success': False, 'error': 'Método não permitido.'}, status=405)


def listar_eventos(request):
    query = "SELECT idCalen, titulo, dia, mes, ano, statusCalen FROM cursos_calendario"
    eventos = CursoCalendario.objects.raw(query)

    eventos_list = [{
        'idCalen': evento.idCalen,
        'titulo': evento.titulo,
        'dia': evento.dia,
        'mes': evento.mes,
        'ano': evento.ano,
        'statusCalen': evento.statusCalen,
    } for evento in eventos]

    return JsonResponse(eventos_list, safe=False)


def enviar_formulario(request):
    with connection.cursor() as cursor:
        cursor.execute('SELECT nome_curso FROM cursos')
        cursos = cursor.fetchall()

    cursos_lista = [{'nome_curso': curso[0]} for curso in cursos]

    popUp = False
    mensagem_erro = 'False'

    if request.method == 'POST':
        nomeForm = request.POST.get('nomeForm')
        emailForm = request.POST.get('emailForm')
        telefoneForm = request.POST.get('telefoneForm')
        nomeCurso = request.POST.get('nomeCurso')

        if nomeCurso == 'outros':
            nomeCurso = request.POST.get('outroInput')

        validar = validar_contato(telefoneForm, emailForm)

        if nomeForm and emailForm and telefoneForm and nomeCurso and validar:
            Formulario.objects.create(
                nomeForm=nomeForm,
                emailForm=emailForm,
                telefone=telefoneForm,
                nomeCurso=nomeCurso
            )
            popUp = True
        else:
            mensagem_erro = 'True'

    return render(request, 'cursos/questionario.html', {
        'cursos': cursos_lista,
        'popUp': popUp,
        'mensagem_erro': mensagem_erro  # Passa a mensagem de erro ao template
    })




def avaliar(request):
    if request.method == 'POST':
        num_estrelas = request.POST.get('numestrela')
        if num_estrelas:
            AValiacao = feedback(numestrela=num_estrelas)
            AValiacao.save()
            return redirect('home')
    return render(request, 'cursos/home.html')

def login_view(request):
    global loginRealizado
    popUpLogin = False
    mensagem = 'False'
    if request.method == 'POST':
        username = request.POST.get('nome')
        password = request.POST.get('senha')


        with connection.cursor() as cursor:
            cursor.execute("SELECT senha FROM usuario WHERE usuario = %s", [username])
            result = cursor.fetchone()

        if result:
            senhaofc = result[0]
            if password == senhaofc:
                loginRealizado = True
                messages.success(request, "Login bem sucedido!")
                popUpLogin = True


            else:
                mensagem = 'True'
                messages.error(request, "Senha incorreta!")
        else:
            mensagem = 'True'
            messages.error(request, 'Usuário inexistente ou senha inválida')

    return render(request, 'cursos/login.html', {
        'loginRealizado':loginRealizado,
        'popUpLogin':popUpLogin,
        'mensagem': mensagem
    })

def trilhas(request, filtro=None):
    query_Trilhas = '''
            SELECT imageTri,nomeTri,explicaTri,cargaMinTri,cargaMaxTri, idTrilha
            FROM trilha
        '''

    with connection.cursor() as cursor:
        cursor.execute(query_Trilhas)
        Trilhas = cursor.fetchall()

    Trilha_lista = [
        {
            'imageTri': trilha[0],
            'nomeTri': trilha[1],
            'explicaTri': trilha[2],
            'cargaMinTri': trilha[3],
            'cargaMaxTri': trilha[4],
            'idTrilha': trilha[5]

        }
        for trilha in Trilhas
    ]

    return render(request, 'cursos/trilhas.html', {'trilhas': Trilha_lista})

from django.shortcuts import render
from django.http import HttpResponseNotFound
from django.db import connection
import json

def cursosTrilha(request, idTrilha):
    try:
        # Consulta a trilha com o id especificado
        with connection.cursor() as cursor:
            query = """
                SELECT nomeTri, explicaTri, cargaMinTri, cargaMaxTri, etapas, imageTri
                FROM Trilha WHERE idTrilha = %s;
            """
            cursor.execute(query, [idTrilha])
            trilha = cursor.fetchone()

            if not trilha:
                return HttpResponseNotFound('<h1>Trilha não encontrada</h1>')

            # Carrega as informações da trilha
            nome_trilha = trilha[0]
            descricao_trilha = trilha[1]
            carga_minima = trilha[2]
            carga_maxima = trilha[3]
            etapas_json = json.loads(trilha[4])  # As etapas em formato JSON
            imagem_trilha = trilha[5]

            # Lista para armazenar os cursos e trilhas que serão exibidos
            etapas_lista = []

            # Variáveis para cursos e trilhas
            cursos = []
            trilhas = []

            # Itera pelas etapas
            for etapa in etapas_json:
                cursos_da_etapa = []
                trilhas_da_etapa = []

                # Itera pelos cursos da etapa
                for curso_id in etapa.get("cursos", []):
                    with connection.cursor() as cursor:
                        query_curso = """
                            SELECT id_curso, nome_curso, descricao_curso, imagem_curso, horas_curso,statusPag_curso
                            FROM Cursos WHERE id_curso = %s;
                        """
                        cursor.execute(query_curso, [curso_id])
                        curso = cursor.fetchone()

                        if curso:
                            curso_dict = {
                                'id_curso': curso[0],
                                'nome_curso': curso[1],
                                'descricao_curso': curso[2],
                                'imagem_curso': curso[3],
                                'horas_curso': curso[4],
                                'statusPag_curso': curso[5]
                            }
                            cursos_da_etapa.append(curso_dict)
                            # Adiciona os cursos da etapa à lista de cursos gerais
                            cursos.append(curso_dict)

                # Itera pelas trilhas da etapa
                for trilha_id in etapa.get("trilhas", []):
                    with connection.cursor() as cursor:
                        query_trilha = """
                            SELECT idTrilha, nomeTri, cargaMinTri, cargaMaxTri, imageTri
                            FROM Trilha WHERE idTrilha = %s;
                        """
                        cursor.execute(query_trilha, [trilha_id])
                        trilha = cursor.fetchone()

                        if trilha:
                            trilha_dict = {
                                'id_trilha': trilha[0],
                                'nome_trilha': trilha[1],
                                'cargaMinTri': trilha[2],
                                'cargaMaxTri': trilha[3],
                                'imageTri': trilha[4],
                            }
                            trilhas_da_etapa.append(trilha_dict)
                            # Adiciona as trilhas da etapa à lista de trilhas gerais
                            trilhas.append(trilha_dict)

                etapas_lista.append({
                    'etapa': etapa["etapa"],
                    'cursos': cursos_da_etapa,
                    'trilhas': trilhas_da_etapa
                })

            return render(request, 'cursos/CursosTrilha.html', {
                'nome_trilha': nome_trilha,
                'descricao_trilha': descricao_trilha,
                'carga_minima': carga_minima,
                'carga_maxima': carga_maxima,
                'etapas_lista': etapas_lista,
                'imagem_trilha': imagem_trilha,
                'cursos': cursos,  # Todos os cursos da trilha
                'trilhas': trilhas  # Todas as trilhas da trilha
            })

    except Exception as e:
        print(f"Erro ao buscar a trilha: {e}")
        return HttpResponseNotFound('<h1>Erro ao carregar a trilha</h1>')



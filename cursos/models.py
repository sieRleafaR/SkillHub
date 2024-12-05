from django.db import models


class Cursos(models.Model):
    id_curso = models.AutoField(primary_key=True)
    nome_curso = models.CharField(max_length=100)
    statusPag_curso = models.CharField(max_length=20)
    dias_curso = models.TextField()
    horas_curso = models.IntegerField()
    cliques_cursos = models.IntegerField(default=0)
    resumo_curso = models.TextField()
    descricao_curso = models.TextField()
    tags_cursos = models.TextField()
    tipo_curso = models.TextField()
    imagem_curso = models.TextField()
    status_curso = models.BooleanField(default=True)

    class Meta:
        db_table = 'cursos'

    def __str__(self):
        return self.nome_curso


class Formulario(models.Model):
    nomeForm = models.CharField(max_length=100)
    emailForm = models.CharField(max_length=100)
    telefone = models.CharField(max_length=100)
    nomeCurso = models.CharField(max_length=100)

    class Meta:
        db_table = 'formulario'

    def __str__(self):
        return self.nomeForm


class Feedback(models.Model):
    numestrela = models.IntegerField()

    class Meta:
        db_table = 'feedback'


class Usuario(models.Model):
    usuario = models.CharField(max_length=100)
    senha = models.CharField(max_length=100)

    class Meta:
        db_table = 'usuario'

    def __str__(self):
        return self.usuario


class CursoCalendario(models.Model):
    idCalen = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    dia = models.IntegerField()
    mes = models.IntegerField()
    ano = models.IntegerField()
    statusCalen = models.IntegerField()

    class Meta:
        db_table = 'calendario'

    def __str__(self):
        return self.titulo


class Trilha(models.Model):
    idTrilha = models.AutoField(primary_key=True)
    nomeTri = models.CharField(max_length=255)  # Nome da trilha
    explicaTri = models.TextField()  # Descrição da trilha
    cargaMinTri = models.IntegerField()  # Carga horária mínima
    cargaMaxTri = models.IntegerField()  # Carga horária máxima
    etapas = models.JSONField()  # Etapas da trilha (armazenadas como JSON)
    imageTri = models.CharField(max_length=255)  # Caminho da imagem da trilha

    class Meta:
        db_table = 'trilha'

    def __str__(self):
        return self.nomeTri

class TagsCursos(models.Model):
    id_tag = models.AutoField(primary_key=True)  # Campo id_tag como chave primária
    tag = models.CharField(max_length=100, unique=True)  # Campo tag com valores únicos

    class Meta:
        db_table = 'tagscursos'  # Nome da tabela no banco de dados

    def __str__(self):
        return self.tag


class TiposCursos(models.Model):
    id_tipo = models.AutoField(primary_key=True)  # Campo id_tipo como chave primária
    tipo = models.CharField(max_length=100, unique=True)  # Campo tipo com valores únicos

    class Meta:
        db_table = 'tiposcursos'  # Nome da tabela no banco de dados

    def __str__(self):
        return self.tipo

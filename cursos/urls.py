from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('cursos/', views.cursos, name='cursos'),
    path('cursos/<str:filtro>/', views.cursos, name='cursos_filtrados'),
    path('login/', views.login, name='login'),
    path('formulario/', views.enviar_formulario, name='formulario'),
    path('trilhas/', views.trilhas, name='trilhas'),
    path('perfilCurso/<int:curso_id>/', views.mostrar_perfil_curso, name='perfilCurso'),
    path('calendario/', views.calendario, name='calendario'),
    path('avaliar/', views.avaliar, name='avaliar'),
    path('historia/', views.historia, name='historia'),
    path('login_view/', views.login_view, name='login_view'),
    path('home/', views.Logout, name='Logout'),
    path('carregar-eventos/', views.carregar_eventos, name='carregar_eventos'),
    path('criar-evento/', views.salvar_evento, name='criar_evento'),
    path('editar-evento/<int:event_id>/', views.salvar_evento, name='editar_evento'),
    path('excluir-evento/<int:event_id>/', views.excluir_evento, name='excluir_evento'),
    path('listar-eventos/', views.listar_eventos, name='listar_eventos'),
    path('validar_contato/', views.validar_contato, name='validar_contato'),
    path('Termos/', views.Termos, name='Termos'),
    path('curso/<int:curso_id>/', views.mostrar_perfil_curso, name='perfilCurso'),
    path('curso/adicionar/', views.adicionar_curso, name='adicionarCurso'),
    path('apagado/<int:idCurso>/', views.apagar_curso, name='apagarCursos'),
    path('editarCurso/<int:idCurso>/', views.editarCurso, name='editarCurso'),
    path('cursosTrilha/<int:idTrilha>/', views.cursosTrilha, name='cursosTrilha'),
]

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
        db_table = 'Cursos'

    def __str__(self):
        return self.nome_curso


class Formulario(models.Model):
    nomeForm = models.CharField(max_length=100)
    emailForm = models.CharField(max_length=100)
    telefone = models.CharField(max_length=100)
    nomeCurso = models.CharField(max_length=100)

    def __str__(self):
        return self.nomeForm

class feedback(models.Model):
    numestrela = models.IntegerField()

class Usuario(models.Model):
    usuario = models.CharField(max_length=50)
    senha = models.CharField(max_length=128)

    def __str__(self):
        return self.usuario


class CursoCalendario(models.Model):
    idCalen = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    dia = models.IntegerField()
    mes = models.IntegerField()
    ano = models.IntegerField()
    statusCalen = models.IntegerField()

    def __str__(self):
        return self.titulo
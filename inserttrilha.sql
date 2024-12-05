TRUNCATE TABLE Trilha;

INSERT INTO Trilha (
    nomeTri,
    explicaTri,
    cargaMinTri,
    cargaMaxTri,
    etapas,
    imageTri
) VALUES (
    'Trilha de computação em Nuvem',
    'Explore os conceitos da computação em nuvem.',
    40,
    152,
    '[{"etapa": 1, "cursos": [1]}, {"etapa": 2, "cursos": [2,3,4,5]},{"etapa": 3, "cursos": [6,7,8,9,10]},{"etapa": 4, "cursos": [11]}]', 
    'https://osait.com.br/wp-content/uploads/2023/06/Cloud_Computing.jpg'
),(
    'Trilha de Desenvolvimento',
    'Uma trilha avançada que integra conhecimentos ligados a codigos e desenvolvimento.',
    40,
    240,
    '[{"etapa": 1, "cursos": [12]}, {"etapa": 2, "cursos": [13]}, {"etapa": 3, "cursos": [14,15,16]}, {"etapa": 4, "cursos": [17,18,19]}]', 
    'https://blog.xpeducacao.com.br/wp-content/uploads/2022/07/analise-e-desenvolvimento-de-sistemas-o-que-faz.jpg'
),(
	'Trilha de Segurança e Infraestrutura',
    'Explore os princípios da Cybersegurança.',
    48,
    216,
    '[{"etapa": 1, "cursos": [20], "trilhas":[1,2]}, {"etapa": 2, "cursos": [21,22,23]}]',
    'https://magma3.com.br/wp-content/uploads/2016/08/blog-post-segurancadainfraestruturadeti_01-1280x854-1.jpg'
),(
    'Trilha de Cursos Automobilística',
    'Aprofunde-se nas áreas de mecânica e eletrônica automotiva.',
    168,
    448,
    '[{"etapa": 1, "cursos": [24, 25]}, {"etapa": 2, "cursos": [24, 26, 27, 29, 31]}, {"etapa": 3, "cursos": [24, 27, 26, 30, 31]}, {"etapa": 4, "cursos": [24, 28]}]',
    'https://www.oficinabrasil.com.br/uploads/images/pitstop/senai-sebrae.jpg'
),(
    'Trilha de Cursos Eletricidade Eletroeletrônica',
    'Aprofunde seus conhecimentos em eletricidade e sistemas eletroeletrônicos.',
    100,
    440,
    '[{"etapa": 1, "cursos": [32, 33, 40]}, {"etapa": 2, "cursos": [32, 34, 41, 42]}, {"etapa": 3, "cursos": [32, 35 ]}, {"etapa": 4, "cursos": [32, 36 ]}, {"etapa": 5, "cursos": [32, 37, 43, 46]}, {"etapa": 6, "cursos": [32, 38, 45]}, {"etapa": 7, "cursos": [32, 39]}]',
    'https://i.ytimg.com/vi/OH4tzNJL9AM/maxresdefault.jpg'
);

SELECT * FROM skillhub.Trilha;
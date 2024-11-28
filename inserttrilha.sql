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
    '[{"etapa": 1, "cursos": [1]}, {"etapa": 2, "cursos": [2,3,4,5]},{"etapa": 3, "cursos": [6,7,8,9,10]},{"etapa": 4, "cursos": [11]}]',  -- JSON representando etapas com cursos
    '/computacao_nuvem.jpg'
),(
    'Trilha de Desenvolvimento',
    'Uma trilha avançada que integra conhecimentos ligados a codigos e desenvolvimento,',
    40,
    240,
    '[{"etapa": 1, "cursos": [12]}, {"etapa": 2, "cursos": [13]}, {"etapa": 3, "cursos": [14,15,16]}, {"etapa": 4, "cursos": [17,18,19]}]',  -- JSON com cursos e trilhas
    '/ajustador.png'
),(
	'Trilha de Segurança e Infraestrutura',
    'Explore os princípios da Cybersegurança',
    48,
    216,
    '[{"etapa": 1, "cursos": [20], "trilhas":[1,2]}, {"etapa": 2, "cursos": [21,22,23]}]',
    '/ajustador.png'
);

SELECT * FROM skillhub.Trilha;
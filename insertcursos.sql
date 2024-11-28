INSERT INTO Cursos (
    nome_curso,
    statusPag_curso,
    dias_curso,
    horas_curso,
    cliques_cursos,
    resumo_curso,
    descricao_curso,
    tags_cursos,
    tipo_curso,
    imagem_curso,
    status_curso
) VALUES
(
    'AWS CLOUD PRATICIONER',                                  -- nome_curso
    'Gratuito',                                             -- statusPag_curso
    'Sábado',                                     -- dias_curso
    40,                                                     -- horas_curso
    0,                                                     -- cliques_cursos
    'Curso introdutório sobre aws',           -- resumo_curso
    'Capacita os participantes a compreender os conceitos básicos da aws.', -- descricao_curso
    'Computação',                               -- tags_cursos
    'curso livre',                                          -- tipo_curso
    '/aws_certo.jpg',                              -- imagem_curso
    TRUE                                                    -- status_curso
),
(
    'GOOGLE CLOUD Foundations',                                  -- nome_curso
    'Gratuito',                                                 -- statusPag_curso
    'Terça, Quinta',                                       -- dias_curso
    40,                                                     -- horas_curso
    0,                                                     -- cliques_cursos
    'Curso voltado para introdução da nuvem do google.', -- resumo_curso
    'Os alunos receberão conhecimento e pratica sobre a nuvem do google', -- descricao_curso
    'Computação',                                   -- tags_cursos
    'curso técnico',                                        -- tipo_curso
    '/google_foundations.jpg',                              -- imagem_curso
    TRUE                                                    -- status_curso
),
(
    'GOOGLE CLOUD Fundamentos de ciencia de dados',                                  -- nome_curso
    'Gratuito',                                                 -- statusPag_curso
    'Terça, Quinta',                                       -- dias_curso
    20,                                                     -- horas_curso
    0,                                                     -- cliques_cursos
    'Curso voltado para introdução de fundamento de dados.', -- resumo_curso
    'Os alunos receberão conhecimento e pratica sobre ciencia de dados', -- descricao_curso
    'Computação',                                   -- tags_cursos
    'curso técnico',                                        -- tipo_curso
    '/google_senai.jpg',                              -- imagem_curso
    TRUE                                                 -- status_curso
),
(
    'GOOGLE CLOUD AI Fundamentals',                                  -- nome_curso
    'Gratuito',                                                 -- statusPag_curso
    'Terça, Quinta',                                       -- dias_curso
    40,                                                     -- horas_curso
    0,                                                     -- cliques_cursos
    'Curso voltado para introdução de AI.', -- resumo_curso
    'Os alunos receberão conhecimento e pratica sobre AI', -- descricao_curso
    'Computação',                                   -- tags_cursos
    'curso técnico',                                        -- tipo_curso
    '/inteligencia_al.jpg',                              -- imagem_curso
    TRUE                                                 -- status_curso
),
(
    'GOOGLE CLOUD Inteligencia artificial generativa',                                  -- nome_curso
    'Gratuito',                                                 -- statusPag_curso
    'Terça, Quinta',                                       -- dias_curso
    40,                                                     -- horas_curso
    0,                                                     -- cliques_cursos
    'Curso voltado para introdução de inteligencia artificial generativa.', -- resumo_curso
    'Os alunos receberão conhecimento e pratica sobre IA generativa', -- descricao_curso
    'Computação',                                   -- tags_cursos
    'curso técnico',                                        -- tipo_curso
    '/google_senai.jpg',                              -- imagem_curso
    TRUE                                                 -- status_curso
),(
	'Microsoft AZ-900',                                  -- nome_curso
    'Gratuito',                                                 -- statusPag_curso
    'Terça, Quinta',                                       -- dias_curso
    40,                                                     -- horas_curso
    0,                                                     -- cliques_cursos
    'Curso voltado para introdução de Banco de dados', -- resumo_curso
    'Os alunos receberão conhecimento e pratica sobre Banco de dados', -- descricao_curso
    'Computação',                                   -- tags_cursos
    'curso técnico',                                        -- tipo_curso
    '/Curso_completo_Azure.jpg',                              -- imagem_curso
    TRUE                                                 -- status_curso
    
),(
	'Microsoft AI-900',                                  -- nome_curso
    'Gratuito',                                                 -- statusPag_curso
    'Terça, Quinta',                                       -- dias_curso
    40,                                                     -- horas_curso
    0,                                                     -- cliques_cursos
    'Curso voltado para introdução de Banco de dados', -- resumo_curso
    'Os alunos receberão conhecimento e pratica sobre Banco de dados', -- descricao_curso
    'Computação',                                   -- tags_cursos
    'curso técnico',                                        -- tipo_curso
    '/Curso_completo_Azure.jpg',                              -- imagem_curso
    TRUE                                                 -- status_curso
),(
	'Microsoft PL-900',
	' Gratuito',
	' Terça, Quinta',
	 40,
     0,
	' Curso voltado para introdução ao Power Platform.',
	' Os alunos aprenderão os fundamentos da plataforma Microsoft Power Platform.',
	' Computação',
	'curso técnico',
	' /Curso_completo_Azure.jpg',
    TRUE
),(
	'Microsoft DP-900',
	'Gratuito',
	'Segunda, Quarta',
	40,
    0,
	'Curso introdutório sobre fundamentos de dados na nuvem.',
	'Capacita os participantes nos conceitos iniciais de bancos de dados e armazenamento na nuvem.',
	'Computação',
	'curso técnico',
	'Curso_completo_Azure.jpg',
    TRUE
),(
	'Microsoft SC-900',
	'Gratuito',
	'Quarta, Sexta',
	40,
    0,
	'Curso de introdução a segurança, conformidade e identidade.',
	'Os alunos receberão uma visão geral sobre segurança digital e compliance no ecossistema Microsoft.',
	'Computação',
	'curso técnico',
	'/Curso_completo_Azure.jpg',
    TRUE
),(
	'power BI',
	'Gratuito',
	'Quarta, Sexta',
	32,
    0,
	'Curso ao power BI.',
	'Os alunos receberão uma visão geral sobre o power BI',
	'Computação',
	'curso técnico',
	'/Power_Bi.jpg',
    TRUE
),(
	'Soluções integradas IOT',
	'Gratuito',
	'Quarta, Sexta',
	40,
    0,
	'Curso de introdução a soluções integradas iot',
	'Os alunos receberão uma visão geral sobre IOT',
	'Computação',
	'curso técnico',
	'/microsoft.jpg',
    TRUE
),(
	'Desenvolvimento de jogos Digitais',
	'Gratuito',
	'Quarta, Sexta',
	40,
    0,
	'Curso de introdução e expecialização em desenvolvimento de jogos',
	'Os alunos receberão uma visão geral sobre desenvolvimento de jogos.',
	'Computação',
	'curso técnico',
	'/microsoft.jpg',
    TRUE
),(
	'Java Fundamentals',
	'Gratuito',
	'Segunda, Quarta',
	80,
    0,
	'Curso introdutório sobre conceitos básicos de Java.',
	'Capacita os alunos com fundamentos da linguagem Java.',
	'Desenvolvimento',
	'curso técnico',
	' /java.jpg',
    TRUE
),(
	'Java Foundations',
	'Gratuito',
	'Segunda, Quarta',
	80,
    0,
	'Curso de fundamentos avançados em Java.',
	'Aprofunda os conhecimentos sobre estruturas e funcionalidades da linguagem Java.',
	'Desenvolvimento',
	'curso técnico',
	'/java.jpg',
    TRUE
),(
	'Java Programming',
	'Gratuito',
	'Segunda, Quarta',
	80,
    0,
	'Curso de programação prática com Java.',
	'Ensina a criar programas e soluções utilizando Java.',
	'Desenvolvimento',
	'curso técnico',
	'/java.jpg',
    TRUE
),(
	'Python Fundamentos',
	'Gratuito',
	'Segunda,quarta',
	30,
    0,
	'Curso introdutório sobre Python.',
	'Os alunos aprenderão os fundamentos da linguagem Python.',
	'Desenvolvimento',
	'curso técnico',
	'/python.jpg',
    True
),(
    'Python Programação',                                -- nome_curso
    'Gratuito',                                          -- statusPag_curso
    'Terça, Quinta',                                     -- dias_curso
    60,                                                 -- horas_curso
    0,                                                  -- cliques_cursos
    'Curso de programação avançada com Python.',         -- resumo_curso
    'Capacita os alunos para desenvolvimento de sistemas e automações com Python.', -- descricao_curso
    'Desenvolvimento',                                  -- tags_cursos
    'curso técnico',                                    -- tipo_curso
    '/python.jpg',										-- imagem_curso
    TRUE                                                -- status_curso
),
(
	'Python Data Science',
	'Gratuito',
	'Sexta',
	40,
    0,
	'Curso focado em ciência de dados com Python.',
	'Os alunos aprenderão conceitos e práticas de análise e visualização de dados.',
	'Desenvolvimento',
	'curso técnico',
	'/python.jpg',
    True
),(
	'Princípios de Cibersegurança',
	'Gratuito',
	'Segunda, Sexta',
	48,
    0,
	'Curso introdutório em cibersegurança',
	'Introduz aos princípios e práticas de segurança digital.',
	'Segurança',
	'curso técnico',
	'/seguranca.jpg',
    True
),(
	'Introduction to Networks',
	'Gratuito',
	'Terça, Quinta',
	72,
    0,
	'Curso introdutório de redes de computadores.',
	'Os alunos aprenderão os fundamentos de redes e conectividade.',
	'Redes, Segurança',
	'curso técnico',
	'/cisco.jpg',
    True
),(
	 'Switching, Routing, and Wireless Essentials',
	'Gratuito',
	'Terça, Quinta',
	72,
    0,
	'Curso de roteamento e redes sem fio.',
	'Capacita os participantes em configuração de roteadores e redes wireless.',
	'Redes, Segurança',
	'curso técnico',
	'/cisco.jpg',
    True
),(
	'Enterprise Networking, Security, and Automation',
	'Gratuito',
	'Segunda, Sexta',
	72,
    0,
	'Curso avançado de segurança e automação em redes.',
	'Ensina práticas de segurança em redes empresariais e automação de tarefas.',
	'Redes, Segurança',
	'curso técnico',
	'/cisco.jpg',
    True
);

select * from cursos;
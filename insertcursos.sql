TRUNCATE TABLE Cursos;


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
    'https://i.ytimg.com/vi/lX7ZAVHoZ5w/maxresdefault.jpg',                              -- imagem_curso
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
    'https://miro.medium.com/v2/resize:fit:1400/1*WE-EQFubMHMnMv-bPIW5SA.png',                              -- imagem_curso
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
    'https://storage.googleapis.com/gweb-cloudblog-publish/images/cloudfy-skills_v6.max-2500x2500.png',                              -- imagem_curso
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
    'https://santodigital.com.br/wp-content/uploads/2023/11/Google-Cloud-AI-1.png',                              -- imagem_curso
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
	' https://media.licdn.com/dms/image/v2/D4D12AQEXeLQIdxbNLA/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1712329946627?e=2147483647&v=beta&t=0g3IOPmdLFKgWPDIsuilhLeF3tPJ3Fh3HqAk1E6SBRs',
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
	'https://img-c.udemycdn.com/course/750x422/5871270_fe62.jpg',
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
	'https://www.ituser.es/files/202409/eset-iot.jpg',
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
	'https://media.licdn.com/dms/image/C4D33AQHrhEc78u9KoQ/productpage-image_1128_635/0/1616180866159/tecsystemti_desenvolvimento_de_games_image?e=2147483647&v=beta&t=T5JOuddGOHJq4fsCbZ1YnVtGhHai_BJRpsEXJw7GMIw',
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
	'https://www.professorisidro.com.br/wp-content/uploads/2019/04/java-logo.jpg',
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
	'https://brm-workforce.oracle.com/pdf/certview/images/JAVA8OJA.png',
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
	'https://apexensino.com.br/wp-content/uploads/2017/03/java-monadic-blog-post-image@2x.png',
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
	'https://sempreupdate.com.br/wp-content/plugins/seox-image-magick/imagick_convert.php?width=904&height=508&format=.jpg&quality=91&imagick=/wp-content/uploads/2023/03/pacote-python-malicioso-escapa-da-deteccao-e-roubar-dados-1024x576.jpg',
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
    'https://files.cercomp.ufg.br/weby/up/1197/o/1_RJMxLdTHqVBSijKmOO5MAg.jpeg?1631307009',										-- imagem_curso
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
	'https://infycletechnologies.com/wp-content/uploads/2023/07/Python-Data-Science.webp',
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
	'https://thinktankabes.org.br/wp-content/uploads/2023/10/politica-de-ciberseguranca-eficaz.jpg.webp',
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
	'https://www.stationx.net/wp-content/uploads/2024/02/Introduction-to-Networking.png',
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
	'https://usedbooks.lk/wp-content/uploads/2023/10/A1030-00-18-16-A103000181621-A103000181621-Lrg-313x234.jpeg',
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
	'https://m.media-amazon.com/images/I/61ZX8iFRyvL._AC_UF1000,1000_QL80_.jpg',
    True
),
(
    'Mecânico de Suspensão, Direção e Freios',               -- nome_curso
    'Pago',                                                  -- statusPag_curso
    'Segunda, Quarta',                                       -- dias_curso
    80,                                                      -- horas_curso
    0,                                                       -- cliques_cursos
    'Curso sobre manutenção de suspensão, direção e freios.',-- resumo_curso
    'Capacita os alunos a realizar manutenção preventiva e corretiva nos sistemas de suspensão, direção e freios.', -- descricao_curso
    'Automotivo',                                            -- tags_cursos
    'curso técnico',                                         -- tipo_curso
    'https://static.wixstatic.com/media/310b08_a37a65f382f94e5ab3415cc7b353f97f~mv2.png/v1/crop/x_0,y_0,w_827,h_591/fill/w_588,h_416,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/suspens%C3%A3o.png',                               -- imagem_curso
    TRUE                                                     -- status_curso
),
(
    'Mecânico de Motor Ciclo Diesel',                        -- nome_curso
    'Pago',                                                  -- statusPag_curso
    'Terça, Quinta',                                         -- dias_curso
    100,                                                     -- horas_curso
    0,                                                       -- cliques_cursos
    'Curso sobre motores ciclo diesel.',                     -- resumo_curso
    'Forma profissionais para diagnóstico e reparo de motores ciclo diesel em veículos pesados e máquinas.', -- descricao_curso
    'Automotivo',                                            -- tags_cursos
    'curso técnico',                                         -- tipo_curso
    'https://cdn.prod.website-files.com/58517252b0244b51063c3702/587fe21bc784b9cd7eec777a_mecanica_diesel.jpg',                            -- imagem_curso
    TRUE                                                     -- status_curso
),
(
    'Mecânico de Motor Ciclo Otto',                          -- nome_curso
    'Pago',                                                  -- statusPag_curso
    'Segunda, Sexta',                                        -- dias_curso
    120,                                                     -- horas_curso
    0,                                                       -- cliques_cursos
    'Curso sobre motores ciclo otto.',                       -- resumo_curso
    'Ensina técnicas de manutenção e reparo de motores ciclo otto em veículos leves.', -- descricao_curso
    'Automotivo',                                            -- tags_cursos
    'curso técnico',                                         -- tipo_curso
    'https://static.wixstatic.com/media/310b08_a10fe5ffbd024734a231607d7d013f4c~mv2.png/v1/crop/x_0,y_0,w_811,h_591/fill/w_594,h_396,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/ciclo%20otto.png',                              -- imagem_curso
    TRUE                                                     -- status_curso
),
(
    'Eletricista Automotivo',                                -- nome_curso
    'Pago',                                                  -- statusPag_curso
    'Terça, Quinta',                                         -- dias_curso
    60,                                                      -- horas_curso
    0,                                                       -- cliques_cursos
    'Curso de elétrica automotiva.',                         -- resumo_curso
    'Capacita os alunos a trabalhar com sistemas elétricos e eletrônicos automotivos.', -- descricao_curso
    'Automotivo',                                            -- tags_cursos
    'curso técnico',                                         -- tipo_curso
    'https://arquivos.sfiec.org.br/sfiec/files/images/WhatsApp%20Image%202021-02-10%20at%2015_39_02(1).jpeg',                           -- imagem_curso
    TRUE                                                     -- status_curso
),
(
    'Mecânico de Injeção Eletrônica Diesel',                 -- nome_curso
    'Pago',                                                  -- statusPag_curso
    'Sábado',                                                -- dias_curso
    90,                                                      -- horas_curso
    0,                                                       -- cliques_cursos
    'Curso de injeção eletrônica diesel.',                   -- resumo_curso
    'Ensina diagnóstico e reparo de sistemas de injeção eletrônica em motores diesel.', -- descricao_curso
    'Automotivo',                                            -- tags_cursos
    'curso técnico',                                         -- tipo_curso
    'https://i.ytimg.com/vi/3qFRYUE9oKQ/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLD36f5AAkicO6Neo9-pam69iGAOfg',                        -- imagem_curso
    TRUE                                                     -- status_curso
),
(
    'Mecânico de Injeção Eletrônica de Veículos Leves',       -- nome_curso
    'Pago',                                                  -- statusPag_curso
    'Quarta, Sexta',                                         -- dias_curso
    80,                                                      -- horas_curso
    0,                                                       -- cliques_cursos
    'Curso de injeção eletrônica para veículos leves.',      -- resumo_curso
    'Forma profissionais para manutenção e reparo de sistemas de injeção eletrônica em veículos leves.', -- descricao_curso
    'Automotivo',                                            -- tags_cursos
    'curso técnico',                                         -- tipo_curso
    'https://pneus.pneuslinense.com.br/blog/doutor/uploads/0/blog/2024/08/blog-importancia-do-mecanico-de-automoveis-leves-fb36b4fe0a.png',                         -- imagem_curso
    TRUE                                                     -- status_curso
),
(
    'Manutenção e Diagnóstico de Sistemas de Climatização de Veículos Leves', -- nome_curso
    'Pago',                                                  -- statusPag_curso
    'Segunda, Quinta',                                       -- dias_curso
    70,                                                      -- horas_curso
    0,                                                       -- cliques_cursos
    'Curso de manutenção de climatização de veículos leves.',-- resumo_curso
    'Capacita os alunos para instalar, diagnosticar e reparar sistemas de climatização automotiva.', -- descricao_curso
    'Automotivo',                                            -- tags_cursos
    'curso técnico',                                         -- tipo_curso
    '/climatizacao_leves.jpg',                               -- imagem_curso
    TRUE                                                     -- status_curso
),
(
    'Inspetor de Qualidade',
    'Pago',
    'Segunda, Quarta, Sexta',
    168,
    0,
    'Curso de inspeção de qualidade.',
    'Capacita os alunos a inspecionar e assegurar a qualidade em processos industriais.',
    'Qualidade',
    'curso técnico',
    '/inspetor_qualidade.jpg',
    TRUE
),
(
    'Ajustador Mecânico',
    'Pago',
    'Segunda, Quarta',
    100,
    0,
    'Curso de ajustagem mecânica.',
    'Ensina os princípios de ajustagem de peças e dispositivos mecânicos.',
    'Mecânica',
    'curso técnico',
    '/ajustador_mecanico.jpg',
    TRUE
),
(
    'Fresador Mecânico',
    'Pago',
    'Terça, Quinta',
    100,
    0,
    'Curso de fresagem mecânica.',
    'Prepara o aluno para operar máquinas-ferramentas fresadoras.',
    'Mecânica',
    'curso técnico',
    '/fresador_mecanico.jpg',
    TRUE
),
(
    'Torneiro Mecânico',
    'Pago',
    'Segunda, Sexta',
    100,
    0,
    'Curso de tornearia mecânica.',
    'Capacita o aluno para operar tornos mecânicos em processos industriais.',
    'Mecânica',
    'curso técnico',
    '/torneiro_mecanico.jpg',
    TRUE
),
(
    'SolidWorks CAD 2D/3D Inventor',
    'Pago',
    'Segunda a Sexta',
    120,
    0,
    'Curso de modelagem CAD 2D e 3D.',
    'Ensina a utilizar ferramentas de modelagem no SolidWorks e no Inventor.',
    'CAD',
    'curso técnico',
    '/solidworks.jpg',
    TRUE
),
(
    'Programação e Operação de Torno CNC',
    'Pago',
    'Terça, Quinta',
    150,
    0,
    'Curso de operação de torno CNC.',
    'Capacita os alunos a programar e operar tornos CNC em processos industriais.',
    'CNC',
    'curso técnico',
    '/torno_cnc.jpg',
    TRUE
),
(
    'Programação e Operação de Centro de Usinagem CNC',
    'Pago',
    'Segunda, Quarta',
    150,
    0,
    'Curso de operação de centros de usinagem CNC.',
    'Ensina a programar e operar centros de usinagem CNC com precisão.',
    'CNC',
    'curso técnico',
    '/usinagem_cnc.jpg',
    TRUE
),
(
    'Usinagem CNC de Precisão e em Alta Performance',
    'Pago',
    'Segunda, Sexta',
    200,
    0,
    'Curso avançado de usinagem CNC.',
    'Capacita os alunos a realizar usinagem de alta precisão e desempenho em máquinas CNC.',
    'CNC',
    'curso técnico',
    '/usinagem_cnc_alta_performance.jpg',
    TRUE
),
(
    'Eletricista Instalador',
    'Pago',
    'Segunda, Quarta, Sexta',
    120,
    0,
    'Curso de formação em instalações elétricas.',
    'Capacita profissionais para realizar instalações elétricas residenciais e comerciais.',
    'Elétrica',
    'curso técnico',
    '/eletricista_instalador.jpg',
    TRUE
),
(
    'Eletrônica Analógica',
    'Pago',
    'Terça, Quinta',
    80,
    0,
    'Curso básico de eletrônica analógica.',
    'Ensina os fundamentos e aplicações de circuitos analógicos.',
    'Eletrônica',
    'curso técnico',
    '/eletronica_analogica.jpg',
    TRUE
),
(
    'Comandos Elétricos',
    'Pago',
    'Segunda, Quarta',
    100,
    0,
    'Curso de comandos elétricos.',
    'Capacita o aluno para projetar e instalar sistemas de comandos elétricos.',
    'Elétrica',
    'curso técnico',
    '/comandos_eletricos.jpg',
    TRUE
),
(
    'Automação de Iluminação com Dispositivos Inteligentes',
    'Pago',
    'Sábado',
    60,
    0,
    'Curso prático de automação de iluminação.',
    'Ensina o uso de dispositivos inteligentes para automação de sistemas de iluminação.',
    'Automação',
    'curso livre',
    '/automacao_iluminacao.jpg',
    TRUE
),
(
    'Automação Residencial - Tecnologia e Aplicações de Dispositivos de Segurança e Conforto',
    'Pago',
    'Terça, Quinta',
    80,
    0,
    'Curso de automação residencial.',
    'Ensina tecnologias e aplicações de dispositivos de segurança e conforto em residências.',
    'Automação',
    'curso técnico',
    '/automacao_residencial.jpg',
    TRUE
),
(
    'Energia Solar Fotovoltaica - Tecnologias e Aplicações',
    'Pago',
    'Segunda, Sexta',
    100,
    0,
    'Curso sobre energia solar fotovoltaica.',
    'Capacita os alunos para trabalhar com tecnologias e aplicações de sistemas fotovoltaicos.',
    'Energia',
    'curso técnico',
    '/energia_solar.jpg',
    TRUE
),
(
    'Manutenção em Condicionador de Ar Tipo Split',
    'Pago',
    'Segunda, Quarta',
    80,
    0,
    'Curso de manutenção de ar-condicionado split.',
    'Ensina técnicas de manutenção e instalação de sistemas de ar-condicionado tipo split.',
    'Climatização',
    'curso técnico',
    '/manutencao_split.jpg',
    TRUE
),
(
    'Arduino',
    'Pago',
    'Sábado',
    60,
    0,
    'Curso introdutório ao Arduino.',
    'Ensina os fundamentos e aplicações do Arduino em projetos de automação.',
    'Eletrônica',
    'curso técnico',
    '/arduino.jpg',
    TRUE
),
(
    'Eletrônica Digital',
    'Pago',
    'Segunda, Sexta',
    80,
    0,
    'Curso de eletrônica digital.',
    'Capacita os alunos nos fundamentos e aplicações de circuitos digitais.',
    'Eletrônica',
    'curso técnico',
    '/eletronica_digital.jpg',
    TRUE
),
(
    'CLP',
    'Pago',
    'Terça, Quinta',
    100,
    0,
    'Curso de programação em CLP.',
    'Ensina a programação e operação de controladores lógicos programáveis.',
    'Automação',
    'curso técnico',
    '/clp.jpg',
    TRUE
),
(
    'Inversores',
    'Pago',
    'Segunda, Quarta',
    100,
    0,
    'Curso de instalação e operação de inversores.',
    'Capacita os alunos para trabalhar com inversores em sistemas elétricos e industriais.',
    'Elétrica',
    'curso técnico',
    '/inversores.jpg',
    TRUE
),
(
    'Instalação de Sistemas para Microgeração Fotovoltaica Conectados à Rede',
    'Pago',
    'Segunda, Sexta',
    120,
    0,
    'Curso de instalação de sistemas fotovoltaicos.',
    'Ensina a instalar sistemas para microgeração de energia fotovoltaica conectados à rede.',
    'Energia',
    'curso técnico',
    '/microgeracao_fotovoltaica.jpg',
    TRUE
),
(
    'Técnicas de brasagem em tubulação de cobre',
    'Gratuito',
    'Segunda, Quarta, Sexta',
    40,
    0,
    'Curso voltado para aprender as técnicas de brasagem em tubulação de cobre.',
    'Os alunos aprenderão os procedimentos e as técnicas corretas para a brasagem em tubulações de cobre, importante para instalações e manutenção.',
    'Eletroeletrônica',
    'curso técnico',
    '/brasagem_tubulacao.jpg',
    TRUE
),
(
    'Manutenção em Condicionador de Ar Tipo Split Inverter',
    'Pago',
    'Sábado',
    80,
    0,
    'Curso de manutenção de ar-condicionado split inverter.',
    'Capacita os alunos na manutenção e instalação de sistemas split inverter.',
    'Climatização',
    'curso técnico',
    '/split_inverter.jpg',
    TRUE
),
(
    'Projetos de Sistemas para Microgeração Fotovoltaica Conectados à Rede',
    'Pago',
    'Segunda, Quarta, Sexta',
    150,
    0,
    'Curso de projetos fotovoltaicos.',
    'Ensina a projetar sistemas para microgeração de energia fotovoltaica conectados à rede.',
    'Energia',
    'curso técnico',
    '/projetos_microgeracao.jpg',
    TRUE
);



select * from cursos;
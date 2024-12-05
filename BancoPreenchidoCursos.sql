drop database if exists skillhub;
create database skillhub;
use skillhub;

DELIMITER //

CREATE TRIGGER insereTagsCursos
AFTER INSERT ON Cursos
FOR EACH ROW
BEGIN
    DECLARE tag_atual VARCHAR(100);
    DECLARE pos INT DEFAULT 1;
    DECLARE total INT;

    SET total = LENGTH(NEW.tags_cursos) - LENGTH(REPLACE(NEW.tags_cursos, ',', '')) + 1;

    WHILE pos <= total DO
        SET tag_atual = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(NEW.tags_cursos, ',', pos), ',', -1));
        
        INSERT IGNORE INTO TagsCursos (tag) VALUES (tag_atual);
        SET pos = pos + 1;
    END WHILE;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER insereTiposCursos
AFTER INSERT ON Cursos
FOR EACH ROW
BEGIN
    INSERT IGNORE INTO TiposCursos (tipo) 
    VALUES (NEW.tipo_curso);
END //

DELIMITER ;

insert into Usuario(usuario,senha) values
('Adm', 'Adm@801'),
('1', '1');

insert into Calendario(titulo,dia, mes, ano, statusCalen) values
('Apresentação do TCC de Desenvolvimento de Sistemas - Primeiro Dia', '10', '12', '2024', '1'),
('Apresentação do TCC de Desenvolvimento de Sistemas - Segundo Dia', '12', '12', '2024', '1');
CREATE DATABASE BLACKFY;
USE BLACKFY;

-- CREATE

CREATE TABLE artista(
idartista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100)
);

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(45),
senha VARCHAR(45),
cpf VARCHAR(11),
telefone VARCHAR(15),
fkArtista INT,
FOREIGN KEY (fkArtista) REFERENCES artista(idartista)
);


CREATE TABLE postagem(
idpostagem INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(250),
dtpost DATE,
fkusuario INT,
FOREIGN KEY (fkusuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE musica(
idmusica INT PRIMARY KEY AUTO_INCREMENT,
nomeMusica VARCHAR(100),
artista VARCHAR(100),
genero VARCHAR(45),
fkuser INT,
FOREIGN KEY (fkuser) REFERENCES usuario(idUsuario)
);

CREATE TABLE playlist(
fkUsuarioPlay INT,
FOREIGN KEY (fkUsuarioPlay) REFERENCES usuario(idUsuario),
fkmusicaPlay INT,
FOREIGN KEY (fkmusicaPlay) REFERENCES musica(idmusica),
PRIMARY KEY (fkUsuarioPlay, fkmusicaPlay),
nomePlay VARCHAR(100)
);

-- Insert 

INSERT INTO artista(nome) value
('Drake'),
('Kendrick Lamar'),
('Tyler,the creator'),
('Froid'),
('Mano brown');

INSERT INTO usuario(nome,email,senha,cpf,telefone,fkartista) VALUE
('Guilherme','guilherme@email.com','1234','46724186099',985672212,4),
('Rafael','rafael@email.com','123','59022211100',985691212,4),
('Fernando','Fernando@email.com','12345','77788899911',992691276,5);

INSERT INTO postagem(descricao,dtpost,fkusuario) VALUE
('Eu amo os hip hop dos anos 90','2022-01-03',1),
('Muito bom ouvir rap de domingo','2021-12-12',2),
('Esse ano vou pro show do racionais','2022-03-02',3);

INSERT INTO musica(nomemusica,artista,genero,fkuser) VALUE
('Peita de dar rolê','Froid','Hip Hop',1),
('Jesus chorou','Racionais','Hip Hop',2),
('Um bom lugar','Sabotage','Rap',3);

INSERT INTO Playlist VALUE
(1,1,'Pra ouvir no trem'),
(2,2,'Melhores'),
(3,3,'Depois de um feedback');

-- SELECT 

SELECT * FROM usuario;
SELECT * FROM postagem;
SELECT * FROM musica;
SELECT * FROM playlist;

SELECT * FROM musica JOIN usuario ON idusuario = fkuser;

SELECT descricao AS 'Descrição',nome AS 'Usuário' FROM postagem JOIN usuario ON idusuario = fkusuario;

SELECT count(fkusuarioplay) AS 'Soma dos usuarios',count(fkmusicaPlay) AS 'Soma das musicas' FROM playlist JOIN usuario ON usuario.idusuario = playlist.fkusuarioplay 
JOIN musica ON musica.idmusica = playlist.fkmusicaplay;
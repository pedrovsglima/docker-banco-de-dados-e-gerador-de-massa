INSERT INTO TITULACAO (NOME_TITULACAO, DESCRICAO_TITULACAO) VALUES ('Jedi Master', 'Aquele que dominou a forca');
INSERT INTO TITULACAO (NOME_TITULACAO, DESCRICAO_TITULACAO) VALUES ('Doutor', 'Aquele que fez doutorado');
INSERT INTO TITULACAO (NOME_TITULACAO, DESCRICAO_TITULACAO) VALUES ('Mestre', 'Quem obteve esse grau por concluir um mestrado: mestre em Letras.');
INSERT INTO TITULACAO (NOME_TITULACAO, DESCRICAO_TITULACAO) VALUES ('Especialista', 'Que se dedica exclusivamente ao estudo ou à prática de uma ciência.');
INSERT INTO TITULACAO (NOME_TITULACAO, DESCRICAO_TITULACAO) VALUES ('Bacharel', 'Aquele obteve um diploma num curso de bacharelado.');
INSERT INTO TITULACAO (NOME_TITULACAO, DESCRICAO_TITULACAO) VALUES ('TecnólLLogo', 'Especialista em tecnologia.');

UPDATE TITULACAO SET NOME_TITULACAO = 'Tecnologo' where CODIGO_TITULACAO = 6;

DELETE FROM TITULACAO WHERE NOME_TITULACAO = 'Jedi Master';

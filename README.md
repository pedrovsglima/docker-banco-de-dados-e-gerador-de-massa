# Docker, banco de dados e gerador de massa

Atividade proposta durante a participação na trilha de Engenharia de Dados do Programa de Formação em Dados Encantech, realizado durante os meses de Março, Abril e Maio de 2022, em uma parceria entre as Lojas Renner S.A. e a CESAR School. 

Consiste na criação de um docker a partir de uma imagem do SGBD MariaDB. 

É preciso criar um script gerador de massa considerando o seguinte modelo:

-- add imagem --


## Diferentes formas de rodar os scripts SQL no docker criado

### ALTERNATIVA 1: CRIAR DOCKER E RODAR ARQUIVO .SQL SEM PRECISAR ENTRAR

1. criar arquivo .yml

	ver arquivo 'docker-compose.yml'

2. criar docker a partir do arquivo

	docker-compose -f ./docker-compose.yml up -d

3. executar docker

	docker exec -i <NOME-DO-DOCKER> mysql -u root -p<SENHA> < <NOME-DO-ARQUIVO>.sql

	docker exec -i mariadb-renner mysql -u root -pcesar < scripts_sql/DDL_init.sql

*OBS: rodar os scripts de fora do container evita de "superlotar" o conteúdo interno*


### ALTERNATIVA 2: CRIAR E ENTRAR NO DOCKER PARA RODAR ARQUIVO .SQL

1. criar arquivo .yml

	ver arquivo 'docker-compose.yml'

2. criar docker a partir do arquivo

	docker-compose -f ./docker-compose.yml up -d

3. executar docker

	docker exec -it <NOME-DO-DOCKER> bash

	docker exec -it mariadb-renner bash

4. rodar scripts DDL e DML (sem acessar console do SGBD) - usar caminho do arquivo .yml em 'volumes'

	mysql -u root -pcesar FACULDADE < /var/lib/mysql/DDL_init.sql

	mysql -u root -pcesar FACULDADE < /var/lib/mysql/DML_TITULACAO.sql

	mysql -u root -pcesar FACULDADE < /var/lib/mysql/DML_FUNCIONARIO_PROFESSOR.sql


### ALTERNATIVA 3: CRIAR DOCKER E ENTRAR NO CONSOLE DO SGBD PARA RODAR ARQUIVO .SQL 

1. criar arquivo .yml

	ver arquivo 'docker-compose.yml'
	
2. criar docker a partir do arquivo

	docker-compose -f ./docker-compose.yml up -d

3. executar docker

	docker exec -it <NOME-DO-DOCKER> bash

	docker exec -it mariadb-renner bash

4. acessar o console do SGBD (vai pedir senha)

	mysql -u root -p

5. criar database e tabelas - usar caminho do arquivo .yml em 'volumes'

	source /var/lib/mysql/DDL_init.sql

6. popular a partir do script .sql - usar caminho do arquivo .yml em 'volumes'

	source /var/lib/mysql/DML_TITULACAO.sql

	source /var/lib/mysql/DML_FUNCIONARIO_PROFESSOR.sql


### OBS: MOVER ARQUIVO PARA O CONTAINER (RODAR ANTES DE ENTRAR NO CONTAINER)

docker cp <src> nomecontainer:<dst>

ex:
docker cp ./create-script.sql <NOME-DO-DOCKER>:/var/lib/mysql


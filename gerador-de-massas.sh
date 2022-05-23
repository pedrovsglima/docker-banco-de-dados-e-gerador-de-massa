#!/bin/bash

nome_file="./suporte/NOMES.txt"
data_file="./suporte/DATAS.txt"
sql_file="./scripts_sql/DML_FUNCIONARIO_PROFESSOR.sql"

totalRecords=0

##### gerar massa de dados para a tabela FUNCIONARIO

while IFS=$'\t' read -r nome data
do
	echo "INSERT INTO FUNCIONARIO (NOME_FUNCIONARIO, DATA_ADMISSAO) VALUES ('"$nome"', STR_TO_DATE('"$data"', '%d/%m/%Y'));" >> $sql_file
	((totalRecords++))
done < <(paste ${nome_file} ${data_file})

##### gerar massa de dados para a tabela PROFESSOR (especialização da tabela FUNCIONARIO)

quantidadeProfessor=100

# definindo aleatoriamente quem da tabela FUNCIONARIO vai ser considerado como PROFESSOR
funcionarioEprofessor=$(seq 1 ${totalRecords} | shuf | head -n ${quantidadeProfessor})
# gerando números aleatórios e únicos dentro do intervalo [1, 99999] para servir como MATRICULA_PROFESSOR 
gerarMatriculaProfessor=$(seq 1 99999 | shuf | head -n ${quantidadeProfessor})

while read codigoEmatricula;
do
	# escolhendo um CODIGO_TITULACAO a cada iteração (dentro do intervalo [2, 6])
	codigoTitulacao=$(echo $(( $RANDOM % 5 + 2 )))
	echo "INSERT INTO PROFESSOR (CODIGO_FUNCIONARIO, MATRICULA_PROFESSOR, CODIGO_TITULACAO) VALUES ("${codigoEmatricula}","${codigoTitulacao}");" >> $sql_file
done < <(paste -d,  <(echo "${funcionarioEprofessor}") <(echo "${gerarMatriculaProfessor}")) 

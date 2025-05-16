# AdventureWorks22
Tarefas utilizando linguagem SQL no SQL Serve Management + vscode para produtitividade.
(Todos os comandos feitos para estudo ou apresentação estão disponíveis em adventureworksprojeto1.sql)

Caso queira treinar, você pode baixar pelo link: https://learn.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

#TAREFA 1

Na primeira tarefas, foi solicitado: O meu supervisor solicitou que realizasse uma consulta no banco de dados AdventureWorks para obter informações sobre os produtos mais vendidos da categoria Mountain Bikes


- As linhas de código estão publicas na pasta adventureworksprojeto1.sql
- Para obter os resultados foi necessário utilizar os comandos INNER JOIN e LIKE para juntar as colunas das diferente tabelas que contem uma relação em ProductID e filtrar a palabra 'Mountain%'
- % A porcentagem indica o nome que eu quero que seja filtrado, então, todos os nomes que contem ou começem com M ou Moutain serão exibidos.
resultado da coleta no banco de dados final:

![image](https://github.com/user-attachments/assets/698b6a45-96e7-4f29-ab79-893b656d3764)


![image](https://github.com/user-attachments/assets/fd4125c1-9812-4035-a175-f3b4da5d51fd)

#TAREFA 2

O segundo desafio, consistia em extrair informações a respeito dos 20 produtos que obtiveram o maior faturamento no ano de 2013
- Todavia, na tabela ordem de vendas, as datas estavam formatadas em dd/mm/yyyy - hora
- Logo, ao construir uma linha de comando utilizando between e ordenar no modo descrescente, apresentou o seguinte erro:

![image](https://github.com/user-attachments/assets/288de386-9020-408e-a006-8da1b53825a1)

- Portanto, precisei formatar para SELECT FORMAT(ModifiedDate, 'dd/MM/yyyy') AS FormattedDate
- E assim, consegui unir a coluna que foi modificada de outra tabela e construir o que foi solicitado pelo gerente.

![image](https://github.com/user-attachments/assets/4c9a4db9-43ee-4b33-8f23-b1482f59b4df)


#TAREFA 3

O terceiro desafio, foi feita uma reunião no setor financeiro, onde o meu gerente havia participado, foi solicitado a ele um levantamento do número de entidades cadastradas que possuem o maior cadastrado em um tipo x de cartão --

Resultado:

![image](https://github.com/user-attachments/assets/bd315812-5f60-4640-94e6-34adeb9e9935)


#TAREFA 4

-- O nosso gestor de RH precisa de um levantamento de todos os funcionários que trabalham no grupo de Manufatura --
-- tabela HumanResources.vEmployeeDepartmentHistory , HumanResources.Employee

![image](https://github.com/user-attachments/assets/2200778e-9da0-49ac-ad6a-034071d7ccdc)



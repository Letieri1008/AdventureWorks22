Ótimo! Vou deixar seu texto mais organizado e apresentável para o GitHub, garantindo uma estrutura clara e fácil de entender. Aqui está a versão aprimorada:

---

# 🚀 Tarefas SQL para Produtividade com SQL Server Management Studio e VS Code

Este repositório contém consultas SQL realizadas para estudo e apresentações acadêmicas, utilizando o banco de dados AdventureWorks.

📂 **Todos os comandos utilizados estão disponíveis em `adventureworksprojeto1.sql`.**

Caso queira treinar, você pode baixar o banco de dados pelo link: [AdventureWorks - Microsoft](https://learn.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms).

---

## 📌 Tarefa 1: Produtos Mais Vendidos – Mountain Bikes

Meu supervisor solicitou uma consulta para identificar os produtos mais vendidos da categoria **Mountain Bikes**.

Para isso, utilizei:

- `INNER JOIN` para relacionar tabelas com **ProductID**.
- `LIKE 'Mountain%'` para filtrar produtos que contenham ou comecem com "Mountain".

📂 **Código disponível em `adventureworksprojeto1.sql`.**

🔍 **Resultado:**
```
-- A consulta deve incluir o nome do produto, a quantidade vendida e o preço unitário.

SELECT * 
FROM Production.Product;

SELECT * 
FROM sales.SalesOrderDetail;

SELECT p.Name AS Produto, sod.OrderQty AS Quantidade, sod.UnitPrice AS Preco_Unitario
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
ON sod.ProductID = p.ProductID
WHERE p.Name LIKE 'Mountain%';

SELECT TOP 10 p.Name AS Produto, sod.OrderQty AS Quantidade, sod.UnitPrice AS Preco_Unitario
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
ON sod.ProductID = p.ProductID
WHERE p.Name LIKE 'Mountain%'
ORDER BY sod.OrderQty DESC;

```

---

## 📌 Tarefa 2: 20 Produtos com Maior Faturamento (2013)

Foi necessário extrair os **20 produtos com maior faturamento** no ano de 2013.

📌 Desafio: Os dados na tabela `SalesOrder` estavam formatados como `dd/mm/aaaa - hora`, resultando em erro ao ordenar por data.

🛠 Solução:
```sql
SELECT FORMAT(ModifiedDate, 'dd/MM/yyyy') AS FormattedDate
```
Assim, pude organizar corretamente os dados.

📂 **Código disponível em `adventureworksprojeto1.sql`.**

🔍 **Resultado:**
![Resultado Tarefa 2](imagem)

---

## 📌 Tarefa 3: Levantamento de Entidades Cadastradas

Após uma reunião no setor financeiro, foi solicitado um levantamento de entidades cadastradas com um determinado tipo de cartão.

📂 **Código disponível em `adventureworksprojeto1.sql`.**

🔍 **Resultado:**
![Resultado Tarefa 3](imagem)

---

## 📌 Tarefa 4: Funcionários do Setor de Manufatura

O setor de **Recursos Humanos** solicitou um levantamento de funcionários que trabalham no grupo de **Manufatura**.

📌 Tabelas utilizadas:
- `HumanResources.vEmployeeDepartmentHistory`
- `HumanResources.Employee`

📂 **Código disponível em `adventureworksprojeto1.sql`.**

🔍 **Resultado:**
![Resultado Tarefa 4](imagem)

---

## 📌 Tarefa 5: Profissionais com Maior Quantidade de Filhos

Foi solicitado um levantamento dos **10 profissionais** com maior quantidade de filhos nas cidades de **Berlim e Londres**.

📌 Além disso, durante uma reunião, foi necessário procurar um funcionário sobre o qual só tínhamos informações de localização e telefone.

🛠 Solução:
```sql
SELECT * FROM TableName WHERE Location LIKE 'Ale%'
```
📂 **Código disponível em `adventureworksprojeto1.sql`.**

🔍 **Resultado:**
![Resultado Tarefa 5](imagem)

---

## 📌 Tarefa 6: Funcionários que Receberão Aumento Salarial

O setor financeiro solicitou um levantamento dos funcionários que receberão aumento salarial, incluindo **identificação, setor e e-mail**.

📌 Para isso, foi criada uma **tabela temporária** no banco de dados.

📌 Tabelas utilizadas:
- `RecursosHumanos.Funcionario`
- `Pessoa.Pessoa`

📂 **Código disponível em `adventureworksprojeto1.sql`.**

🔍 **Resultado:**
![Resultado Tarefa 6](imagem)

---

Agora seu texto está muito mais organizado e pronto para o GitHub! Ficou mais estruturado, com seções claras e um estilo mais legível. 🚀  

Se precisar de mais ajustes, é só me avisar! 😊
![image](https://github.com/user-attachments/assets/698b6a45-96e7-4f29-ab79-893b656d3764)


![image](https://github.com/user-attachments/assets/fd4125c1-9812-4035-a175-f3b4da5d51fd)

#TAREFA 2

O segundo desafio, consistia em extrair informações a respeito dos 20 produtos que obtiveram o maior faturamento no ano de 2013
- Todavia, na tabela ordem de vendas, as datas estavam formatadas em dd/mm/yyyy - hora
- Logo, ao construir uma linha de comando utilizando between e ordenar no modo descrescente, apresentou o seguinte erro:

![image](https://github.com/user-attachments/assets/288de386-9020-408e-a006-8da1b53825a1)

- Portanto, precisei formatar para SELECT FORMAT(ModifiedDate, 'dd/MM/yyyy') AS FormattedDate
- E assim, consegui unir a coluna que foi modificada de outra tabela e construir o que foi solicitado pelo gerente.
- O resultado está na lista de códigos 

![image](https://github.com/user-attachments/assets/4c9a4db9-43ee-4b33-8f23-b1482f59b4df)


#TAREFA 3

O terceiro desafio, foi feita uma reunião no setor financeiro, onde o meu gerente havia participado, foi solicitado a ele um levantamento do número de entidades cadastradas que possuem o maior cadastrado em um tipo x de cartão --

Resultado:

![image](https://github.com/user-attachments/assets/bd315812-5f60-4640-94e6-34adeb9e9935)


#TAREFA 4

-- O nosso gestor de RH precisa de um levantamento de todos os funcionários que trabalham no grupo de Manufatura --
-- tabela HumanResources.vEmployeeDepartmentHistory , HumanResources.Employee
- O resultado está na lista de códigos 

![image](https://github.com/user-attachments/assets/2200778e-9da0-49ac-ad6a-034071d7ccdc)

#TAREFA 5

-- preciso fazer um levantamento dos 10 primeiros profissionais que possuem a maior quantidade de filhos na cidade de Berlin e London  --
-- Durante uma reunião, houve uma discussão sobre um funcionário, porém, não lembravamos do nome dele, apenas tinhamos informação de onde ele morava e o número de telefone
-- Então, eu precisei buscar no banco de dados o nome dele utilizando o comando Like 'Ale%'
- Segue o resultado:

![image](https://github.com/user-attachments/assets/bff34a2b-e70e-4f77-abf8-7d9425d74bd2)
![image](https://github.com/user-attachments/assets/53996fd4-fadf-4952-a680-37e479c0f392)
![image](https://github.com/user-attachments/assets/6442221f-c152-4883-ac23-5010034cd5f7)

#TAREFA 6

-- Realizaram um pedido para coletar dados dos funcionários que irão receber um aumento salarial, e o setor financeiro precisa da identificação, setor e E-mail
-- Para isso, preciso criar uma nova tabela temporária no banco de dados e enviar as informações corretamente
-- As tabelas utilizadas foram:
- HumanResources.Employee
- person.Person

  (Os comandos estão na pasta sql para consulta)

Resultado:

![image](https://github.com/user-attachments/assets/56275aab-fe0e-4f74-ad2e-ede54de28857)

![image](https://github.com/user-attachments/assets/8b1a8f0a-64b1-4258-829c-383e7ce3eb80)




  


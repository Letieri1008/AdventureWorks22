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

-- 🚀 Consulta SQL para obter os produtos mais vendidos na categoria "Mountain Bikes"
-- 📌 A consulta inclui o nome do produto, a quantidade vendida e o preço unitário.

-- 🔍 Verificando os dados das tabelas principais

```
SELECT * FROM Production.Product;
SELECT * FROM Sales.SalesOrderDetail;
```

-- 🔹 Consulta para buscar todos os produtos da categoria "Mountain Bikes"

```
SELECT p.Name AS Produto, sod.OrderQty AS Quantidade, sod.UnitPrice AS Preco_Unitario
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
ON sod.ProductID = p.ProductID
WHERE p.Name LIKE 'Mountain%';

-- 🔹 Consulta para listar os 10 produtos mais vendidos da categoria "Mountain Bikes"

SELECT TOP 10 p.Name AS Produto, sod.OrderQty AS Quantidade, sod.UnitPrice AS Preco_Unitario
FROM Sales.SalesOrderDetail sod
INNER JOIN Production.Product p
ON sod.ProductID = p.ProductID
WHERE p.Name LIKE 'Mountain%'
ORDER BY sod.OrderQty DESC;
```

📌 Tarefa 2: 
- 20 Produtos com Maior Faturamento (2013) ,Foi necessário extrair os 20 produtos com maior faturamento no ano de 2013.

📌 Desafio: Os dados na tabela SalesOrder estavam formatados como dd/mm/aaaa - hora, resultando em erro ao ordenar por data.

🛠 Solução:

```
sql
SELECT FORMAT(ModifiedDate, 'dd/MM/yyyy') AS FormattedDate
Assim, pude organizar corretamente os dados.
```

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




  


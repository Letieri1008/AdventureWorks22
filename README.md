
---

# 🚀 Tarefas SQL para Produtividade com SQL Server Management Studio e VS Code

Este repositório contém consultas SQL realizadas para estudo e apresentações acadêmicas, utilizando o banco de dados AdventureWorks.

📂 **Todos os comandos utilizados estão disponíveis em `adventureworksprojeto1.sql`.**

Caso queira treinar, você pode baixar o banco de dados pelo link: [AdventureWorks - Microsoft](https://learn.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms).

---

# Tarefa 1: Produtos Mais Vendidos – Mountain Bikes

Meu supervisor solicitou uma consulta para identificar os produtos mais vendidos da categoria **Mountain Bikes**.

Para isso, utilizei:

- `INNER JOIN` para relacionar tabelas com **ProductID**.
- `LIKE 'Mountain%'` para filtrar produtos que contenham ou comecem com "Mountain".

📂 **Código disponível em `adventureworksprojeto1.sql`.**

🔍 **Resultado:**

- 🚀 Consulta SQL para obter os produtos mais vendidos na categoria "Mountain Bikes"
- 📌 A consulta inclui o nome do produto, a quantidade vendida e o preço unitário.

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

#  Tarefa 2: 20 Produtos com Maior Faturamento (2013)
- Foi necessário extrair os 20 produtos com maior faturamento no ano de 2013.

📌 Desafio: Os dados na tabela SalesOrder estavam formatados como dd/mm/aaaa - hora, resultando em erro ao ordenar por data.

🛠 Solução:

```
sql
SELECT FORMAT(ModifiedDate, 'dd/MM/yyyy') AS FormattedDate
Assim, pude organizar corretamente os dados.
```

```
select p.name,p.color, so.OrderQty, so.LineTotal, so.modifieddate
from sales.SalesOrderDetail so
inner join Production.Product p
on so.ProductID = p.ProductID
where so.ModifiedDate between '2013-01-01' and '2013-12-31'  
ORDER BY so.linetotal DESC
```

#  Tarefa 3: Levantamento de Entidades Cadastradas
Após uma reunião no setor financeiro, foi solicitado um levantamento de entidades cadastradas com um determinado tipo de cartão.

📂 Código

```
select cc.CardType, COUNT(cc.CardType) as Total
from sales.CreditCard cc
inner join sales.PersonCreditCard pcc
on cc.CreditCardID = pcc.CreditCardID
group by cc.CardType
order by Total desc
```

🔍 Resultado:

![image](https://github.com/user-attachments/assets/bd315812-5f60-4640-94e6-34adeb9e9935)


# Tarefa 4: Funcionários do Setor de Manufatura
O setor de Recursos Humanos solicitou um levantamento de funcionários que trabalham no grupo de Manufatura.

📌 Tabelas utilizadas:

``HumanResources.vEmployeeDepartmentHistory``
``HumanResources.Employee``

📂 Código 

```
select e.BusinessEntityID as IdentificaçãoID , e.JobTitle,edh.Department as Departamento , edh.GroupName as Grupo , e.Hiredate as Aniversário , e.Gender as Gênero , CONCAT(FirstName,LastName) as Nome 
from HumanResources.vEmployeeDepartmentHistory edh
inner join HumanResources.Employee e
on edh.BusinessEntityID = e.BusinessEntityID
where edh.GroupName = 'Manufacturing'
order by HireDate desc
```

🔍 Resultado:

![image](https://github.com/user-attachments/assets/2200778e-9da0-49ac-ad6a-034071d7ccdc)


# Tarefa 5: Profissionais com Maior Quantidade de Filhos 

Foi solicitado um levantamento dos 10 profissionais com maior quantidade de filhos nas cidades de Berlim e Londres.

📌 Além disso, durante uma reunião, foi necessário procurar um funcionário sobre o qual só tínhamos informações de localização e telefone.

🛠 Solução:

```
sql
SELECT * FROM TableName WHERE Location LIKE 'Ale%'
```

📂 Código
```
-- preciso fazer um levantamento dos profissionais que possuem a maior quantidade de filhos na cidade de Berlin e London  --
Para isso, vou utilizar as tabelas
dbo.DimCustomer
dbo.DimGeography

select TOP 10 c.FirstName, c.Lastname, c.Gender, c.TotalChildren, c.Phone, g.City
from dbo.dimcustomer c 
inner join dbo.DimGeography g
on c.GeographyKey = g.GeographyKey
where city = 'Berlin' 
order by TotalChildren desc

select TOP 10 c.FirstName, c.Lastname, c.Gender, c.TotalChildren, c.Phone, g.City
from dbo.dimcustomer c 
inner join dbo.DimGeography g
on c.GeographyKey = g.GeographyKey
where city = 'London' 
order by TotalChildren desc

select c.FirstName, c.Lastname, c.Gender, c.TotalChildren, c.Phone, g.City
from dbo.dimcustomer c 
inner join dbo.DimGeography g
on c.GeographyKey = g.GeographyKey
where c.Phone like 'Ale%' and city = 'Berlin'
order by TotalChildren desc
```

# 🔍 Resultado:

![image](https://github.com/user-attachments/assets/bff34a2b-e70e-4f77-abf8-7d9425d74bd2)
![image](https://github.com/user-attachments/assets/53996fd4-fadf-4952-a680-37e479c0f392)
![image](https://github.com/user-attachments/assets/6442221f-c152-4883-ac23-5010034cd5f7)

# 📌 Tarefa 6: Funcionários que Receberão Aumento Salarial
O setor financeiro solicitou um levantamento dos funcionários que receberão aumento salarial, incluindo identificação, setor e e-mail.

📌 Para isso, foi criada uma tabela temporária no banco de dados.

📌 Tabelas utilizadas:

- ``RecursosHumanos.Funcionario``

- ``Pessoa.Pessoa``

📂 Código 


🔍 Resultado:

```
-- Eu preciso localizar, adicionar os funcionários que trabalham na categoria Production Technician - WC20 que irão receber um aumento salarial de 2.000$ dólares --


select *
from HumanResources.Employee

select BusinessEntityID, JobTitle
from HumanResources.Employee
where JobTitle = 'production technician - wc20'

-- Agora eu preciso adicionar uma coluna com os funcionários que trabalham na categoria Production Technician - WC20 com suas respectivas identificações --
```
```
create table #EmployeeSalaries
(
    BusinessEntityID int,
    Name varchar(100),
    LastName varchar(100),
    JobTitle varchar(100),
    Salary decimal(18,2)
)
```
```
-- Preenchendo na nova tabela as informações de BusinessEntityID, JobTitle --

select *
from #EmployeeSalaries


INSERT INTO #EmployeeSalaries (BusinessEntityID, JobTitle) VALUES
(135, 'Production Technician - WC20'),
(136, 'Production Technician - WC20'),
(137, 'Production Technician - WC20'),
(138, 'Production Technician - WC20'),
(139, 'Production Technician - WC20'),
(140, 'Production Technician - WC20'),
(141, 'Production Technician - WC20'),
(142, 'Production Technician - WC20'),
(143, 'Production Technician - WC20'),
(144, 'Production Technician - WC20'),
(153, 'Production Technician - WC20'),
(154, 'Production Technician - WC20'),
(155, 'Production Technician - WC20'),
(156, 'Production Technician - WC20'),
(157, 'Production Technician - WC20'),
(158, 'Production Technician - WC20'),
(159, 'Production Technician - WC20'),
(181, 'Production Technician - WC20'),
(182, 'Production Technician - WC20'),
(183, 'Production Technician - WC20'),
(184, 'Production Technician - WC20'),
(185, 'Production Technician - WC20');
```
```
-- Juntandos as informações, agora precisa adicionar e-mail e telefone dos funcionários --

select p.name, p.lastname, s.jobtitle, s.BusinessEntityID
from person.person p
inner join #EmployeeSalaries s
on p.BusinessEntityID = s.BusinessEntityID

insert into #EmployeeSalaries (Name, LastName) VALUES
('Ivo', 'Salmre'),
('Sylvester', 'Valdez'),
('Anibal', 'Sousa'),
('Samantha', 'Smith'),
('Hung-Fu', 'Ting'),
('Prasanna', 'Samarawickrama'),
('Min', 'Su'),
('Olinda', 'Turner'),
('Krishna', 'Sunkammurali'),
('Paul', 'Singh'),
('Hanying', 'Feng'),
('Raymond', 'Sam'),
('Fadi', 'Fakhouri'),
('Lane', 'Sacksteder'),
('Linda', 'Randall'),
('Shelley', 'Dyck'),
('Terrence', 'Earls'),
('Michael', 'Hines'),
('Nitin', 'Mirchandani'),
('Barbara', 'Decker'),
('John', 'Chen'),
('Stefen', 'Hesse');
```
```
-- Corrigindo as linhas que foram adicionadas com valores nulos na tabela #EmployeeSalaries --

DELETE FROM #EmployeeSalaries
WHERE BusinessEntityID IS NULL;

```
```
-- Agora, utilizar inner join para adicionar as informações de e-mail e telefone dos funcionários para formatar e enviar a nova tabela para o financeiro e--

select s.BusinessEntityID, CONCAT(s.Name ,'', s.LastName) as Nome, s.JobTitle as Categoria, e.EmailAddress as Email
from #EmployeeSalaries s
inner join person.EmailAddress e
on s.BusinessEntityID = e.BusinessEntityID
```

Resultado:


![image](https://github.com/user-attachments/assets/8b1a8f0a-64b1-4258-829c-383e7ce3eb80)




  


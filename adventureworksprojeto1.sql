
#TAREFA 1
  
-- Eu quero sabre o nome do produto, a quantidade vendida e o preço unitário da  Mountain utilizando as tabelas Sales.SalesOrderDetail e Production.Product 
/* Foram utilizados os comandos select, from, inner join, where e like para filtrar o nome 'mountain' */

select p.Name as N, sod.OrderQty , sod.UnitPrice 
from Sales.SalesOrderDetail sod
inner join Production.Product p
on sod.ProductID = p.ProductID
where p.Name like 'Mountain%'

-- Agora ele pediu somente os 10 produtos dessa categoria que mais venderam --

select top 10 p.name as Mountain Bike, sod.OrderQty, sod.UnitPrice
from sales.SalesOrderDetail sod
inner join Production.Product p 
on sod.ProductID = p.ProductID
where p.Name like 'Mountain%'       
order by sod.OrderQty desc

#TAREFA 2

/* o Meu gerente, solicitou uma tabela dos produtos que obtiveram o maior faturamento no ano de 2013 */
-- Quando utilizei o comando betewen, ele não conseguiu selecionar as datas corretamente e então precisei formatar, então modifiquei o formato para dd/MM/yyyy --

--Lina de código erro, seguida de correção para solucionar o problema --
select p.name,p.color, so.OrderQty, so.LineTotal, so.modifieddate
from sales.SalesOrderDetail so
inner join Production.Product p
on so.ProductID = p.ProductID
where so.ModifiedDate between '2013-01-01' and '2013-12-31'  
ORDER BY so.linetotal DESC

-- Da tabela  production.product da coluna Modifiedate --

-- > SELECT FORMAT(ModifiedDate, 'dd/MM/yyyy') AS FormattedDate <--

SELECT top 20 p.name,p.color, so.OrderQty, so.LineTotal, FORMAT(so.ModifiedDate, 'dd/MM/yyyy') AS FormattedDate
FROM sales.SalesOrderDetail so
INNER JOIN Production.Product p ON so.ProductID = p.ProductID
WHERE YEAR(so.ModifiedDate) = 2013
ORDER BY so.LineTotal DESC

#TAREFA 3

-- Em uma reunião no setor financeiro, onde o meu gerente havia participado, foi solicitado a ele um levantamento do número de entidades cadastradas que possuem o maior cadastrado em um tipo x de cartão --
--Para isso, precisei obter através da tabela sales.creditcard e sales.personcreditcard.

select cc.CardType, COUNT(cc.CardType) as Total
from sales.CreditCard cc
inner join sales.PersonCreditCard pcc
on cc.CreditCardID = pcc.CreditCardID
group by cc.CardType
order by Total desc


#TAREFA 4

-- O nosso gestor de RH precisa de um levantamento de todos os funcionários que trabalham no grupo de Manufatura --
-- tabela HumanResources.vEmployeeDepartmentHistory , HumanResources.Employee

select e.BusinessEntityID as IdentificaçãoID , e.JobTitle,edh.Department as Departamento , edh.GroupName as Grupo , e.Hiredate as Aniversário , e.Gender as Gênero , CONCAT(FirstName,LastName) as Nome 
from HumanResources.vEmployeeDepartmentHistory edh
inner join HumanResources.Employee e
on edh.BusinessEntityID = e.BusinessEntityID
where edh.GroupName = 'Manufacturing'
order by HireDate desc

  
#TAREFA 5

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

#TAREFA 6
  
-- Eu preciso localizar, adicionar os funcionários que trabalham na categoria Production Technician - WC20 que irão receber um aumento salarial de 2.000$ dólares --


select *
from HumanResources.Employee

select BusinessEntityID, JobTitle
from HumanResources.Employee
where JobTitle = 'production technician - wc20'

-- Agora eu preciso adicionar uma coluna com os funcionários que trabalham na categoria Production Technician - WC20 com suas respectivas identificações --

create table #EmployeeSalaries
(
    BusinessEntityID int,
    Name varchar(100),
    LastName varchar(100),
    JobTitle varchar(100),
    Salary decimal(18,2)
)

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

-- Corrigindo as linhas que foram adicionadas com valores nulos na tabela #EmployeeSalaries --

DELETE FROM #EmployeeSalaries
WHERE BusinessEntityID IS NULL;


-- Agora, utilizar inner join para adicionar as informações de e-mail e telefone dos funcionários para formatar e enviar a nova tabela para o financeiro e--

select s.BusinessEntityID, CONCAT(s.Name ,'', s.LastName) as Nome, s.JobTitle as Categoria, e.EmailAddress as Email
from #EmployeeSalaries s
inner join person.EmailAddress e
on s.BusinessEntityID = e.BusinessEntityID





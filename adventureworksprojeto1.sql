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

![image](https://github.com/user-attachments/assets/16cb8049-9f35-4da8-ab20-9017eb941dc4)

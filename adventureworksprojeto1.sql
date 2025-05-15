
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





-- Recuperacao das tabelas
select * from clients;
select * from Supplier;
select * from product;
select * from productsupplier;
select * from storagelocation;
select * from productstorage;

-- Pedidos Confirmados
select * from Orders
where OrderStatus = 'confirmado';

-- Cliente que possuem conta PF
select * from clients 
where tipoConta = 'PF';

-- Valor a pagar dos produtos
select p.idProduct, Pname, PodQuantity * 200 as Valorpagar
from product p inner join productorder o on p.idproduct = o.idProduct;

-- Pedidos pagos
select o.idOrder, id_payment, typePayment, valor
from payments p join orders o on p.idOrder = o.idOrder;

-- Nome de clientes
select * from clients c left
join orders o on c.idClient = o.idOrderClient
order by Fname ASC;


-- Contar quantos produtos existem por categoria e exibir apenas aqueles com mais de 1 item
SELECT category, COUNT(*) AS TotalProdutos
FROM Product
GROUP BY category
HAVING COUNT(*) > 1;

-- Listar os vendedores que têm mais de 5 produtos cadastrados
SELECT idPseller, COUNT(idProduct) AS TotalVendas
FROM ProductSeller
GROUP BY idPseller
HAVING COUNT(idProduct) > 1;


-- Pedidos feitos por cada cliente
select Fname, count(*) as totalPedidos
from clients c Left join orders o on c.idClient = o.idOrderClient
group by Fname
order by Fname;

-- Vendedor que é fornecedor
select AbsName
from Seller s join supplier sp on s.CNPJ = sp.CNPJ;

-- forcedores com mais de 2 produtos
select SocialName, count(*) as total
from supplier s join productsupplier p on s.idSupplier = p.idSupplier
Group by SocialName
HAVING total > 2;



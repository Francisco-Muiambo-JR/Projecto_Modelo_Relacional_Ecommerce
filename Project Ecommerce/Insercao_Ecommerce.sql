-- Inserindo dados na tabela clients
INSERT INTO clients (Fname, Minit, Lname, CPF, Address, conta_id, tipoConta) VALUES
('Carlos', 'M', 'Silva', '12345678901', 'Rua A, 123', 101, 'PF'),
('Ana', 'L', 'Souza', '98765432100', 'Avenida B, 456', 102, 'PJ'),
('João', 'P', 'Ferreira', '56789012345', 'Travessa C, 789', 103, 'PF');

INSERT INTO clients (Fname, Minit, Lname, CPF, Address, conta_id, tipoConta) VALUES
('Paulo', 'J', 'Silva', '12345678900', 'Rua B, 123', 105, 'PF'),
('Guinho', 'L', 'Souza', '98765832100', 'Avenida B, 456', 109, 'PJ'),
('João', 'P', 'Manuel', '56780012345', 'Travessa C, 789', 1083, 'PF');

-- Inserindo dados na tabela Orders
INSERT INTO Orders (idOrderClient, OrderStatus, orderDescription, sendvalue, paymentCash) VALUES
(1, 'Confirmado', 'Compra de eletrônicos', 20.00, true),
(2, 'Em processamento', 'Compra de roupas', 15.00, false),
(3, 'Cancelado', 'Compra de brinquedos', 10.00, true);

INSERT INTO Orders (idOrderClient, OrderStatus, orderDescription, sendvalue, paymentCash) VALUES
(1, 'Confirmado', 'Compra de eletrônicos', 20.00, true),
(3, 'Em processamento', 'Compra de roupas', 15.00, true),
(3, 'Cancelado', 'Compra de brinquedos', 10.00, false);

INSERT INTO Orders (idOrderClient, OrderStatus, orderDescription, sendvalue, paymentCash) VALUES
(1, 'Confirmado', 'Compra de eletrônicos', 50.00, true);


-- Inserindo dados na tabela payments
INSERT INTO payments (idOrder, typePayment, valor) VALUES
(1, 'Credito', 200.50),
(2, 'Debito', 150.75),
(3, 'Numerario', 50.00);

-- Inserindo dados na tabela entrega
INSERT INTO entrega (status, codRasteio, idOrder) VALUES
('A caminho', 'TRK1234567', 1),
('Chegou', 'TRK9876543', 2),
('A caminho', 'TRK5678901', 3);

-- Inserindo dados na tabela Product
INSERT INTO Product (Pname, Classification_kids, category, Avaliacao, size) VALUES
('Laptop', false, 'eletronico', 4.5, '15 polegadas'),
('Camisa', false, 'Vestimenta', 4.2, 'M'),
('Carrinho', true, 'Brinquedos', 4.8, 'Pequeno');

-- Inserindo dados na tabela productStorage
INSERT INTO productStorage (storageLocation, quantity) VALUES
('Depósito Central', 50),
('Armazém Norte', 30),
('Loja Física', 20);

-- Inserindo dados na tabela supplier
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Tech Supplier Ltda', '12345678000199', '11999998888'),
('Fashion Distribuidora', '98765432000177', '21988887777');
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Eletrônicos Ltda', '23456789000111', '31977776666');

-- Inserindo dados na tabela seller
INSERT INTO seller (SocialName, AbsName, CNPJ, CPF, location, contact) VALUES
('Eletrônicos Ltda', 'EletroShop', '23456789000111', NULL, 'Rua Eletrônica, 100', '31977776666'),
('Moda Express', 'ModaX', NULL, '56789012345', 'Av. Estilo, 200', '41966665555');

-- Inserindo dados na tabela ProductSeller
INSERT INTO ProductSeller (idPseller, idProduct, ProdQuantity) VALUES
(1, 1, 10),
(2, 2, 15);

-- Inserindo dados na tabela ProductOrder
INSERT INTO ProductOrder (idProduct, idOrder, PodQuantity) VALUES
(1, 1, 2),
(2, 2, 3);

-- Inserindo dados na tabela StorageLocation
INSERT INTO StorageLocation (idProduct, idStorage, location) VALUES
(1, 1, 'Depósito Central'),
(2, 2, 'Armazém Norte');

-- Inserindo dados na tabela ProductSupplier
INSERT INTO ProductSupplier (idSupplier, idProduct, quantity) VALUES
(1, 1, 20),
(2, 2, 30);

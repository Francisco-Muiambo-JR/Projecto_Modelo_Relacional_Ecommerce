-- Criacão de Banco de Dados para o cenário de E-Commerce

create database Ecommerce;
use Ecommerce;


-- Criar tabela cliente
create table clients(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit varchar(3),
    Lname varchar(20),
    CPF char(11) not null unique,
    Address varchar(30),
    conta_id int unique,
    tipoConta enum('PJ','PF')
);

-- Criar tabela pedido antes das dependentes
create table Orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    OrderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em Processamento',
    orderDescription varchar(250),
    sendvalue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

-- Criar tabela pagamento
create table payments(
    id_payment int auto_increment primary key,
    idOrder int not null,
    typePayment enum('Numerario','Credito', 'Debito'),
    valor float,
    constraint fk_payments_order foreign key (idOrder) references Orders(idOrder)
);

-- Criar tabela entrega
create table entrega(
    idEntrega int auto_increment primary key,
    status enum('A caminho','Chegou'),
    codRasteio char(10) unique,
    idOrder int not null,
    constraint fk_entrega_order foreign key (idOrder) references Orders(idOrder)
);

-- Criar tabela produto
create table Product(
    idProduct int auto_increment primary key,
    Pname varchar(50) not null,
    Classification_kids bool default false, 
    category enum('eletronico','Vestimenta','Brinquedos', 'Alimentos','Moveis') not null,
    Avaliacao float default 0,
    size varchar(20)
);

-- Criar tabela estoque
create table productStorage(
    idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- Criar tabela fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(14) not null unique,
    contact char(11) not null
);

-- Criar tabela vendedor
create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar(225) not null,
    AbsName varchar(255),
    CNPJ char(14) unique,
    CPF char(11) unique,
    location varchar(255),
    contact char(11) not null
);

-- Criar tabela de relacionamento entre produto e vendedor
create table ProductSeller(
    idPseller int,
    idProduct int,
    ProdQuantity int default 1,
    primary key(idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references Product(idProduct)
);

-- Criar tabela de relação entre pedido e produto
create table ProductOrder(
    idProduct int,
    idOrder int,
    PodQuantity int default 1,
    primary key(idProduct, idOrder),
    constraint fk_productOrder_product foreign key (idProduct) references Product(idProduct),
    constraint fk_productOrder_order foreign key (idOrder) references Orders(idOrder)
);

-- Criar tabela de localização do estoque
create table StorageLocation(
    idProduct int,
    idStorage int,
    location varchar(255) not null,
    primary key(idProduct, idStorage),
    constraint fk_storage_location_product foreign key (idProduct) references Product(idProduct),
    constraint fk_storage_location_storage foreign key (idStorage) references productStorage(idProdStorage)
);

-- Criar tabela de relacionamento entre produto e fornecedor
create table ProductSupplier(
    idSupplier int,
    idProduct int,
    quantity int not null,
    primary key (idSupplier, idProduct),
    constraint fk_product_supplier_supplier foreign key (idSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idProduct) references Product(idProduct)
);

-- Exibir tabelas criadas
show tables;

# Projecto_Modelo_Relacional_Ecommerce


# E-Commerce Database

Este repositório contém a estrutura de um banco de dados para um sistema de E-Commerce. Inclui a criação das tabelas, inserção de dados e consultas SQL para manipulação das informações.

## Estrutura do Banco de Dados

O banco de dados `Ecommerce` é composto pelas seguintes tabelas:

- `clients` - Armazena informações sobre os clientes.
- `orders` - Contém os pedidos realizados pelos clientes.
- `payments` - Registra os pagamentos associados aos pedidos.
- `entrega` - Controla o status de entrega dos pedidos.
- `product` - Contém informações sobre os produtos disponíveis.
- `productStorage` - Gerencia o estoque de produtos.
- `supplier` - Contém informações sobre os fornecedores.
- `seller` - Armazena informações sobre os vendedores.
- `productSeller` - Relaciona produtos com vendedores.
- `productOrder` - Relaciona produtos com pedidos.
- `storageLocation` - Define a localização do estoque.
- `productSupplier` - Relaciona produtos com fornecedores.

## Scripts Disponíveis

- [Criação do Banco de Dados e Tabelas](./scripts/create_database.sql)
- [Inserção de Dados](./scripts/insert_data.sql)
- [Consultas SQL](./scripts/queries.sql)

## Funcionalidades Implementadas

- **Criação de banco de dados e tabelas**
- **Inserção de registros** nas tabelas
- **Consultas SQL**:
  - Recuperação de dados com `SELECT`
  - Filtros com `WHERE`
  - Geração de atributos derivados
  - Ordenação de dados com `ORDER BY`
  - Filtragem de grupos com `HAVING`
  - Junções entre tabelas para consultas mais complexas


## Tecnologias Utilizadas

- **MySQL**
- **SQL**

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para enviar pull requests ou abrir issues.

## Autor

- [Francisco Salomão Muiambo Júnior](https://github.com/Francisco-Muiambo-JR)

---
Dúvidas? Entre em contato! 😊


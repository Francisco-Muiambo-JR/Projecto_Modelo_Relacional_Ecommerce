USE Ecommerce; 
DELIMITER //

CREATE PROCEDURE ManageClientsEcommerce(
    IN action INT, -- 1: INSERT, 2: UPDATE, 3: DELETE
    IN id INT,
    IN Fname VARCHAR(10),
    IN Lname VARCHAR(20),
    IN CPF CHAR(11),
    IN Address VARCHAR(30)
)
BEGIN
    CASE 
        WHEN action = 1 THEN -- Inserir Cliente
            INSERT INTO clients (Fname, Lname, CPF, Address)
            VALUES (Fname, Lname, CPF, Address);

        WHEN action = 2 THEN -- Atualizar Cliente
            UPDATE clients 
            SET Address = Address
            WHERE idClient = id;

        WHEN action = 3 THEN -- Deletar Cliente
            DELETE FROM clients WHERE idClient = id;
    END CASE;
END //

DELIMITER ;

CALL ManageClientsEcommerce(1, NULL, 'Carlos', 'Silva', '9631587425', 'Rua A, 123'); -- Inserir
CALL ManageClientsEcommerce(2, 1, NULL, NULL, NULL, 'Rua Nova, 456'); -- Atualizar
CALL ManageClientsEcommerce(3, 1, NULL, NULL, NULL, NULL); -- Deletar

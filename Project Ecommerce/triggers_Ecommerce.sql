use ecommerce;

CREATE TABLE IF NOT EXISTS client_backup (
    idClient INT,
    Fname VARCHAR(10),
    Minit VARCHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11),
    Address VARCHAR(30),
    conta_id INT,
    tipoConta ENUM('PJ','PF'),
    data_remocao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER before_delete_client
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
    INSERT INTO client_backup (
        idClient, Fname, Minit, Lname, CPF, Address, conta_id, tipoConta
    )
    VALUES (
        OLD.idClient, OLD.Fname, OLD.Minit, OLD.Lname,
        OLD.CPF, OLD.Address, OLD.conta_id, OLD.tipoConta
    );
END$$

DELIMITER ;

CREATE TABLE IF NOT EXISTS historico_contato_seller (
    idSeller INT,
    nome_empresa VARCHAR(255),
    contato_antigo CHAR(11),
    contato_novo CHAR(11),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER $$

CREATE TRIGGER before_update_seller_contact
BEFORE UPDATE ON seller
FOR EACH ROW
BEGIN
    IF OLD.contact <> NEW.contact THEN
        INSERT INTO historico_contato_seller (
            idSeller, nome_empresa, contato_antigo, contato_novo
        )
        VALUES (
            OLD.idSeller, OLD.SocialName, OLD.contact, NEW.contact
        );
    END IF;
END$$

DELIMITER ;



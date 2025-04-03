DELIMITER $$

drop procedure ManageAlunoData;
CREATE  PROCEDURE ManageAlunoData(
    IN opcao INT, 
    IN NomeAluno VARCHAR(100), 
    IN DataNascimento DATE, 
    IN EmailAluno VARCHAR(100)
)
BEGIN
    -- Ação de Inserção (opcao = 1)
    IF opcao = 1 THEN
        INSERT INTO Alunos (Nome, DataNascimento, Email)
        VALUES (NomeAluno, DataNascimento, EmailAluno);
        
    -- Ação de Atualização (opcao = 2)
    ELSEIF opcao = 2 THEN
        UPDATE Alunos
        SET Nome = NomeAluno, DataNascimento = DataNascimento
        WHERE Email = EmailAluno;
    
    -- Ação de Exclusão (opcao = 3)
    ELSEIF opcao = 3 THEN
        DELETE FROM Alunos
        WHERE Email = EmailAluno;
    END IF;
    
END $$

DELIMITER ;


CALL ManageAlunoData(1, 'João Silva', '1995-05-20', 'joao.silva@email.com');
CALL ManageAlunoData(2, 'João Silva', '1995-05-21', 'joao.silva@email.com');
CALL ManageAlunoData(3, NULL, NULL, 'joao.silva@email.com');

select * from alunos;

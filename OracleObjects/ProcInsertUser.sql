CREATE OR REPLACE PROCEDURE PRC_INSERT_USER
(
    P_Nome_In IN VARCHAR2,
    P_CPF_In IN NUMBER,
    P_DataNascimento_In IN TIMESTAMP,
    P_UsuarioId_Out OUT NUMBER
)
IS
BEGIN 
	
	IF P_Nome_In IS NULL THEN
		RAISE NO_DATA_FOUND;
	END IF;
	
	IF P_CPF_In IS NULL THEN
		RAISE NO_DATA_FOUND;
	END IF;
	
	IF P_DataNascimento_In IS NULL THEN
		RAISE NO_DATA_FOUND;
	END IF;

    INSERT INTO Usuarios(Nome, CPF, DataNascimento, DataCadastro, StatusId) 
    VALUES(P_Nome_In, P_CPF_In, P_DataNascimento_In, SYSDATE, 1)
    RETURNING UsuarioId INTO P_UsuarioId_Out;

    COMMIT;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		ROLLBACK;
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line(SQLERRM);
END;
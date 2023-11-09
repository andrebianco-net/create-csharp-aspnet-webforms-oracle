CREATE OR REPLACE PROCEDURE PRC_UPDATE_USER
(
    P_UsuarioId_In IN NUMBER,
	P_Nome_In IN VARCHAR2,
    P_CPF_In IN NUMBER,
    P_DataNascimento_In IN DATE,
	P_StatusId_In IN NUMBER
)
IS
BEGIN 

	IF P_UsuarioId_In IS NULL THEN
		RAISE NO_DATA_FOUND;
	END IF;
	
	IF P_Nome_In IS NULL THEN
		RAISE NO_DATA_FOUND;
	END IF;
	
	IF P_CPF_In IS NULL THEN
		RAISE NO_DATA_FOUND;
	END IF;
	
	IF P_DataNascimento_In IS NULL THEN
		RAISE NO_DATA_FOUND;
	END IF;
	
	IF P_StatusId_In IS NULL THEN
		RAISE NO_DATA_FOUND;
	END IF;
	
    UPDATE Usuarios
	SET Nome = P_Nome_In, CPF = P_CPF_In, DataNascimento = P_DataNascimento_In, StatusId = P_StatusId_In
	WHERE UsuarioId = P_UsuarioId_In;

    COMMIT;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		ROLLBACK;
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line(SQLERRM);
END;
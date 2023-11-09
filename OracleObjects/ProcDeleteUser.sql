CREATE OR REPLACE PROCEDURE PRC_DELETE_USER
(
    P_UsuarioId_In IN NUMBER
)
IS
BEGIN 

    DELETE FROM Usuarios
	WHERE UsuarioId = P_UsuarioId_In;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        dbms_output.put_line(SQLERRM);
END;
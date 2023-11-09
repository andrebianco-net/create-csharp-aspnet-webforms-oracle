CREATE OR REPLACE PROCEDURE PRC_SELECT_USER
IS
    v_cursor SYS_REFCURSOR;
BEGIN 

    OPEN v_cursor FOR 
		SELECT u.UsuarioId, u.Nome, u.CPF, TO_CHAR(u.DataNascimento, 'dd/mm/yyyy') As DataNascimento, u.DataCadastro, u.StatusId, su.Nome As Situacao
		FROM Usuarios u
		INNER JOIN StatusUsuario su
		ON u.Statusid = su.Statusid;		
    DBMS_SQL.return_result(v_cursor);
    
END;

EXECUTE PRC_SELECT_USER;



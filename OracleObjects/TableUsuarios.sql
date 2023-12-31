CREATE TABLE Usuarios
(
  UsuarioId NUMBER GENERATED BY DEFAULT AS IDENTITY,
  Nome VARCHAR2(100) NOT NULL,
  CPF NUMBER NOT NULL,
  DataNascimento DATE NOT NULL,
  DataCadastro TIMESTAMP NOT NULL,
  StatusId NUMBER NOT NULL,
  PRIMARY KEY(UsuariOid),
  CONSTRAINT FK_StatusUsuario FOREIGN KEY (StatusId) REFERENCES StatusUsuario(StatusId)
);

INSERT INTO Usuarios(Nome, CPF, DataNascimento, DataCadastro, StatusId) VALUES('Adam José dos Santos 2', 12345678901, '01/01/1980', SYSDATE, 1);
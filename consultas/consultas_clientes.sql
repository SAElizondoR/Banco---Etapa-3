
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Banco')
BEGIN
    CREATE DATABASE Banco;
END

USE Banco;

IF NOT EXISTS(SELECT * FROM sysobjects WHERE name = 'Cliente')
BEGIN
    CREATE TABLE Cliente
    (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre VARCHAR(200) NOT NULL,
        NumeroTelefono VARCHAR(40) NOT NULL,
        CorreoE VARCHAR(50),
        Saldo DECIMAL(10,2)
    )

    ALTER TABLE Cliente
    DROP COLUMN Saldo;

    ALTER TABLE Cliente
    ADD FechaRegistro DATETIME DEFAULT GETDATE();

    ALTER TABLE Cliente
    ALTER COLUMN FechaRegistro DATETIME NOT NULL;

    INSERT INTO Cliente
    (Nombre, NumeroTelefono, CorreoE)
    VALUES ('Bladimiro', '88002002316', 'info@veb.ru');

    SELECT * FROM Cliente;

    INSERT INTO Cliente
    (Nombre, NumeroTelefono)
    VALUES ('Xi', '1063070900');

    SELECT * FROM Cliente;

    INSERT INTO Cliente
    (Nombre, NumeroTelefono, CorreoE)
    VALUES
    ('José', '2024561111', NULL),
    ('Kim', '850218111999', 'ipa817@star-co.net.kp'),
    ('Alejandro', '80172226665', 'contact@government.by')

    SELECT * FROM Cliente;

    UPDATE Cliente SET CorreoE = 'chinamission_un@mfa.gov.cn'
    WHERE ID = 2

    SELECT * FROM Cliente;

    UPDATE Cliente SET NumeroTelefono = '0019135356280'
    WHERE CorreoE IS NULL;
END

SELECT * FROM Cliente;

DELETE FROM Cliente
WHERE Nombre = 'José'

SELECT * FROM Cliente;

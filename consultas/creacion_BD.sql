IF NOT EXISTS(SELECT * FROM sysobjects WHERE name = 'TipoCuenta')
BEGIN
    CREATE TABLE TipoCuenta
    (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre VARCHAR(100) NOT NULL,
        FechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
    );

    INSERT INTO TipoCuenta (Nombre)
    VALUES ('Personal'), ('Nómina'), ('Ahorro');
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE name = 'TipoTransaccion')
BEGIN
    CREATE TABLE TipoTransaccion
    (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nombre VARCHAR(100) NOT NULL,
        FechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
    )

    INSERT INTO TipoTransaccion (Nombre)
    VALUES ('Depósito en efectivo'), ('Retiro en efectivo'),
        ('Depósito vía transferencia'), ('Retiro vía transferencia');
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE name = 'Cuenta')
BEGIN
    CREATE TABLE Cuenta
    (
        Id INT PRIMARY KEY IDENTITY(1,1),
        TipoCuenta INT NOT NULL FOREIGN KEY REFERENCES TipoCuenta(Id),
        IdCliente INT NOT NULL FOREIGN KEY REFERENCES Cliente(Id),
        Saldo DECIMAL(10,2) NOT NULL,
        FechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
    )

    INSERT INTO Cuenta (TipoCuenta, IdCliente, Saldo)
    VALUES (1, 1, 50000),
        (2, 1, 10000),
        (1, 2, 3000),
        (2, 1, 14000);
END

IF NOT EXISTS(SELECT * FROM sysobjects WHERE name = 'TransaccionBancaria')
BEGIN
    CREATE TABLE TransaccionBancaria
    (
        Id INT PRIMARY KEY IDENTITY(1,1),
        IdCuenta INT NOT NULL FOREIGN KEY REFERENCES Cuenta(Id),
        TipoTransaccion INT NOT NULL FOREIGN KEY REFERENCES TipoTransaccion(Id),
        Importe DECIMAL(10,2) NOT NULL,
        CuentaExterna INT NULL,
        FechaRegistro DATETIME NOT NULL DEFAULT GETDATE()
    );

    INSERT INTO TransaccionBancaria (IdCuenta, TipoTransaccion,
        Importe, CuentaExterna)
    VALUES (1, 1, 100, NULL),
        (1, 3, 200, 666),
        (3, 1, 100, NULL),
        (3, 3, 250, 1313);
END

IF EXISTS(SELECT * FROM sysobjects WHERE name = 'Transaccion')
BEGIN
    exec sp_rename 'Transaccion', 'TransaccionBancaria';
END

SELECT * FROM TipoCuenta;
SELECT * FROM TipoTransaccion;
SELECT * FROM Cliente;
SELECT * FROM Cuenta;

--INSERT INTO Cuenta (TipoCuenta, IdCliente, Saldo)
--VALUES (1, 10, 50000);

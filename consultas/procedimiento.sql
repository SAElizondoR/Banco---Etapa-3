IF NOT EXISTS (SELECT * FROM sys.objects WHERE [name]='SeleccionarCuenta')
BEGIN
    EXEC('CREATE PROCEDURE SeleccionarCuenta
    AS
        SELECT cuenta.Id, tipo.Nombre AS NombreCuenta, cliente.Nombre AS NombreCliente, cuenta.Saldo, cuenta.FechaRegistro
        FROM Cuenta cuenta
        JOIN TipoCuenta tipo ON cuenta.TipoCuenta = tipo.Id
        JOIN Cliente cliente ON cuenta.IdCliente = cliente.Id;
    END')
END

GO

ALTER PROCEDURE SeleccionarCuenta
    @IdCliente INT = NULL
AS
    IF @IdCliente IS NULL
    BEGIN
        SELECT cuenta.Id, tipo.Nombre AS NombreCuenta, cliente.Nombre AS NombreCliente, cuenta.Saldo, cuenta.FechaRegistro
        FROM Cuenta cuenta
        JOIN TipoCuenta tipo ON cuenta.TipoCuenta = tipo.Id
        JOIN Cliente cliente ON cuenta.IdCliente = cliente.Id;
    END
    ELSE
    BEGIN
        SELECT cuenta.Id, tipo.Nombre AS NombreCuenta, cliente.Nombre AS NombreCliente, cuenta.Saldo, cuenta.FechaRegistro
        FROM Cuenta cuenta
        JOIN TipoCuenta tipo ON cuenta.TipoCuenta = tipo.Id
        JOIN Cliente cliente ON cuenta.IdCliente = cliente.Id
        WHERE cuenta.IdCliente = @IdCliente;
    END
GO

EXEC SeleccionarCuenta;
EXEC SeleccionarCuenta @IdCliente = 1;

SELECT * FROM Cliente;
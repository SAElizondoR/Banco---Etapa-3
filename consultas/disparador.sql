IF NOT EXISTS (SELECT * FROM sys.objects WHERE [name]='ClienteDespuesInsertar')
BEGIN
    EXEC('CREATE TRIGGER ClienteDespuesInsertar
        ON Cliente
        AFTER INSERT
        AS
            DECLARE @IdClienteNuevo INT;
            SET @IdClienteNuevo = (SELECT Id FROM inserted);

            INSERT INTO Cuenta (TipoCuenta, IdCliente, Saldo)
            VALUES (1, @IdClienteNuevo, 0);
        END')
    
    EXEC InsertarCliente @Nombre = 'Ramzan', @NumeroTelefono = '8712222009';
END

SELECT * FROM Cliente;
SELECT * FROM Cuenta;

EXEC SeleccionarCuenta

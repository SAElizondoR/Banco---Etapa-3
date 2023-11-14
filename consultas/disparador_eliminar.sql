
ALTER TABLE Cuenta
ALTER COLUMN IdCliente INT NULL;

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE [name]='ClienteEnLugarEliminar')
BEGIN
    EXEC('CREATE TRIGGER ClienteEnLugarEliminar
        ON Cliente
        INSTEAD OF DELETE
        AS
            DECLARE @IdEliminado INT;
            SET @IdEliminado = (SELECT Id FROM deleted);
            
            UPDATE Cuenta SET IdCliente = NULL
            WHERE IdCliente = @IdEliminado;

            DELETE FROM Cliente WHERE Id = @IdEliminado;
        END');
END

SELECT * FROM Cliente;
DELETE FROM Cliente WHERE Id = 10;
EXEC SeleccionarCuenta;

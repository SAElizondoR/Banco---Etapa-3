SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[InsertarTransaccionBancaria]
    @IdCuenta INT,
    @TipoTransaccion INT,
    @Importe DECIMAL(10,2),
    @CuentaExterna INT = NULL
AS
    DECLARE @SaldoActual DECIMAL(10,2), @SaldoNuevo DECIMAL(10,2);

    BEGIN TRANSACTION;

    SET @SaldoActual = (SELECT Saldo FROM Cuenta WHERE Id = @IdCuenta)

    IF @TipoTransaccion = 2 OR @TipoTransaccion = 4
        SET @SaldoNuevo = @SaldoActual - @Importe;
    ELSE
        SET @SaldoNuevo = @SaldoActual + @Importe;
    
    UPDATE Cuenta SET Saldo = @SaldoNuevo WHERE Id = @IdCuenta;
    INSERT INTO TransaccionBancaria
    (IdCuenta, TipoTransaccion, Importe, CuentaExterna)
    VALUES (@IdCuenta, @TipoTransaccion, @Importe, @CuentaExterna)

    IF @SaldoNuevo >= 0
    BEGIN
        COMMIT TRANSACTION;
        RETURN 0;
    END
    ELSE
    BEGIN
        PRINT 'El nuevo saldo sería negativo.
            No se puede realizar la transacción.';
        ROLLBACK TRANSACTION;
        RETURN 1;
    END
GO

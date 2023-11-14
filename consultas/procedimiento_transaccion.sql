SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE [name]='InsertarTransaccionBancaria')
BEGIN
    EXEC('CREATE PROCEDURE [dbo].[InsertarTransaccionBancaria]
            @IdCuenta INT,
            @TipoTransaccion INT,
            @Importe DECIMAL(10,2),
            @CuentaExterna INT = NULL
        AS
            DECLARE @SaldoActual DECIMAL(10,2), @SaldoNuevo DECIMAL(10,2);
            SET @SaldoActual = (SELECT Saldo FROM Cuenta WHERE Id = @IdCuenta)

            IF @TipoTransaccion = 2 OR @TipoTransaccion = 4
                SET @SaldoNuevo = @SaldoActual - @Importe;
            ELSE
                SET @SaldoNuevo = @SaldoActual + @Importe;
            
            UPDATE Cuenta SET Saldo = @SaldoNuevo WHERE Id = @IdCuenta;
            INSERT INTO TransaccionBancaria
            (IdCuenta, TipoTransaccion, Importe, CuentaExterna)
            VALUES (@IdCuenta, @TipoTransaccion, @Importe, @CuentaExterna)
        END');
        EXEC InsertarTransaccionBancaria @IdCuenta = 1, @TipoTransaccion = 2,
            @Importe = 1000;
END

EXEC SeleccionarCuenta;
SELECT * FROM TransaccionBancaria;

EXEC InsertarTransaccionBancaria @IdCuenta = 1, @TipoTransaccion = 2,
            @Importe = 500000;

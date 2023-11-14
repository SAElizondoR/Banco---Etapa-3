SELECT * FROM Cliente;

EXEC SelectClient @ClientID = 6;

EXEC InsertarCliente @Nombre = 'Demetrio', @NumeroTelefono = '79166435',
    @CorreoE = 'info2@veb.ru';

SELECT * FROM Cuenta;

EXEC InsertarTransaccionBancaria @IdCuenta = 3, @TipoTransaccion = 2,
    @Importe = 2000;

SELECT * FROM Cuenta;

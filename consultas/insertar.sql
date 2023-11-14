
IF NOT EXISTS (SELECT * FROM sys.objects WHERE [name]='SeleccionarCuenta')
BEGIN
    EXEC('CREATE PROCEDURE InsertarCliente
            @Nombre VARCHAR(200),
            @NumeroTelefono VARCHAR(40),
            @CorreoE VARCHAR(50) = NULL
        AS
            INSERT INTO Cliente(Nombre, NumeroTelefono, CorreoE)
            VALUES (@Nombre, @NumeroTelefono, @CorreoE);
        END')
    EXEC InsertarCliente @Nombre = 'Kasim', @NumeroTelefono = '375172223465';
    EXEC InsertarCliente @Nombre = 'AMLO', @NumeroTelefono = '50934900';
END
    
SELECT * FROM Cliente;

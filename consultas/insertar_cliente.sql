SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[InsertarCliente]
    @Nombre VARCHAR(200),
    @NumeroTelefono VARCHAR(40),
    @CorreoE VARCHAR(50) = NULL
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Cliente WHERE CorreoE = @CorreoE)
    BEGIN
        PRINT 'El correo electrónico ya existe. No se puede insertar.';
        RETURN 1;
    END
    ELSE
    BEGIN
        INSERT INTO Cliente(Nombre, NumeroTelefono, CorreoE)
        VALUES (@Nombre, @NumeroTelefono, @CorreoE);
        RETURN 0;
    END
END;


SELECT * FROM TransaccionBancaria;
SELECT cuenta.Id, tipo.Nombre AS NombreCuenta, cliente.Nombre AS NombreCliente,
    cuenta.Saldo, cuenta.FechaRegistro
FROM Cuenta cuenta
INNER JOIN Cliente cliente ON cuenta.IdCliente = cliente.Id
INNER JOIN TipoCuenta tipo ON cuenta.TipoCuenta = tipo.Id;

SELECT tr.Id, cliente.Nombre AS NombreCliente,
    tipo.Nombre AS TipoDeTransaccion, tr.Importe, tr.CuentaExterna,
    tr.FechaRegistro
FROM TransaccionBancaria tr
JOIN Cuenta cuenta ON tr.IdCuenta = cuenta.Id
JOIN Cliente cliente ON cuenta.IdCliente = cliente.Id
JOIN TipoTransaccion tipo ON tr.TipoTransaccion = tipo.Id;

SELECT * FROM TransaccionBancaria;
SELECT cuenta.Id, cliente.Nombre AS NombreCliente,
    cuenta.Saldo, cuenta.FechaRegistro
FROM Cuenta cuenta
LEFT JOIN Cliente cliente ON cuenta.IdCliente = cliente.Id;

SELECT * FROM TransaccionBancaria;
SELECT cuenta.Id, cliente.Nombre AS NombreCliente,
    cuenta.Saldo, cuenta.FechaRegistro
FROM Cuenta cuenta
RIGHT JOIN Cliente cliente ON cuenta.IdCliente = cliente.Id;

SELECT * FROM TransaccionBancaria;
SELECT cuenta.Id, cliente.Nombre AS NombreCliente,
    cuenta.Saldo, cuenta.FechaRegistro
FROM Cuenta cuenta
FULL OUTER JOIN Cliente cliente ON cuenta.IdCliente = cliente.Id;


CREATE PROCEDURE SelectClient
    @ClientID INT = NULL
AS
BEGIN
    IF @ClientID IS NULL
        SELECT * FROM Cliente
    ELSE
        SELECT * FROM Cliente WHERE ID = @ClientID;
END;

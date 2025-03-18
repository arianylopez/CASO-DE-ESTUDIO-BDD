-- TRIGGER 
CREATE TRIGGER ActualizarStock
ON DetalleVenta
AFTER INSERT
AS
BEGIN
    UPDATE P
    SET P.Stock = P.Stock - I.Cantidad
    FROM Productos P
    INNER JOIN inserted I ON P.ProductoID = I.ProductoID;

    IF EXISTS (SELECT 1 FROM Productos WHERE Stock < 0)
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'Error: Stock insuficiente para uno o más productos.';
    END
END;

-- VERIFICACION
SELECT Stock FROM Productos WHERE ProductoID = 1;

INSERT INTO DetalleVenta (PedidoID, ProductoID, Cantidad, PrecioUnitario)
VALUES (1, 1, 1, 1200.50);

SELECT Stock FROM Productos WHERE ProductoID = 1;
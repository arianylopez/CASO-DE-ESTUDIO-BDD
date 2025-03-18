-- TRANSACCION
BEGIN TRANSACTION

DECLARE @ClienteID INT      = 1;
DECLARE @ProductoID INT     = 3;
DECLARE @Cantidad INT       = 2;
DECLARE @Estado VARCHAR(50) = 'Pendiente';

DECLARE @Precio DECIMAL(10,2) = (SELECT Precio FROM Productos WHERE ProductoID = @ProductoID);
DECLARE @Total DECIMAL(10,2)  = @Cantidad * @Precio;

BEGIN TRY
	IF(@Cantidad <= (SELECT Stock FROM Productos WHERE ProductoID = @ProductoID))
	BEGIN
		INSERT INTO Pedidos(ClienteID, FechaPedido, Estado, Total)
		VALUES (@ClienteID, GETDATE(), @Estado, @Total) 
		DECLARE @PedidoID INT = (SELECT TOP 1 PedidoID FROM Pedidos ORDER BY PedidoID DESC)

		INSERT INTO DetalleVenta(PedidoID, ProductoID, Cantidad, PrecioUnitario)
		VALUES (@PedidoID, @ProductoID, @Cantidad, @Precio)

		UPDATE Productos 
		SET Stock = Stock - @Cantidad
		WHERE ProductoID = @ProductoID
		COMMIT;
		PRINT 'Transferencia completada exitosamente.';
	END
	ELSE
	BEGIN
		ROLLBACK;
		PRINT 'Stock insuficiente. Transacción revertida.';
	END
END TRY
BEGIN CATCH
	ROLLBACK;
	PRINT 'Error en la transferencia, cambios revertidos.';
END CATCH

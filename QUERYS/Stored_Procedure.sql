-- STORED PROCEDURE 
CREATE PROCEDURE ConsultarVentasPorCliente
	@ClienteID INT
AS 
BEGIN
	SELECT 
		P.ClienteID,
		P.PedidoID,
		P.FechaPedido,
		P.Estado,
		P.Total,
		DV.ProductoID,
		DV.Cantidad,
		DV.PrecioUnitario,
		PR.NombreProducto
	FROM Pedidos P
	INNER JOIN DetalleVenta DV ON P.PedidoID = DV.PedidoID
	INNER JOIN Productos PR ON DV.ProductoID = PR.ProductoID
	WHERE P.ClienteID = @ClienteID;
END;

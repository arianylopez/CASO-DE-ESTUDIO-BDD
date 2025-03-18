-- INDICES
CREATE INDEX idx_DetalleVenta_PedidoID ON DetalleVenta(PedidoID);
SELECT * FROM DetalleVenta WHERE PedidoID = 1;

CREATE INDEX idx_Pagos_PedidoID ON Pagos(PedidoID);
SELECT * FROM Pagos WHERE PedidoID = 10;
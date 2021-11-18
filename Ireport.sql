
/*Ireport*/

SELECT MASCOTA.ID_TIPO_MASCOTA AS ID, TM.DESCRIPCION_TM AS TIPO, COUNT(*)CANTIDAD FROM VENTA
INNER JOIN PRODUCTO ON PRODUCTO.ID_PRODUCTO=VENTA.ID_PRODUCTO
INNER JOIN MASCOTA ON MASCOTA.ID_CLIENTE=VENTA.ID_CLIENTE
INNER JOIN TIPO_MASCOTA AS TM ON TM.ID_TIPO_MASCOTA=MASCOTA.ID_TIPO_MASCOTA
WHERE PRODUCTO.ID_TIPO_PRODUCTO='2'
GROUP BY MASCOTA.ID_TIPO_MASCOTA, TM.DESCRIPCION_TM ORDER BY ID ASC;
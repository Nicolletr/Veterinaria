/*Consulta 4: Mostrar histórico de vacunaciones que se hayan dado en el centro a cada tipo de animal. 
En una columna debe aparecer el año, en otra el tipo de animal, en otra el total de vacunas dadas a todo ese tipo de animal.*/

SELECT  date_part('year',FECHA_APLICACION) AS año, T.DESCRIPCION_TM, COUNT(*)CANTIDAD FROM MASCOTA AS M
INNER JOIN TIPO_MASCOTA AS T ON T.ID_TIPO_MASCOTA=M.ID_TIPO_MASCOTA
INNER JOIN VACUNA AS V ON V.ID_MASCOTA=M.ID_MASCOTA
GROUP BY DESCRIPCION_TM, DOSIS,date_part('year',FECHA_APLICACION) ORDER BY date_part('year',FECHA_APLICACION) ASC;
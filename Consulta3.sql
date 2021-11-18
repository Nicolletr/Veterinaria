
/*Consulta 3: Cantidad de vacunas que cada veterinario ha puesto.*/
SELECT
VACUNA.ID_VETERINARIO,
(V.NOMBRE_VETERINARIO||' '||V.APELLIDO_VETERINARIO)AS VETERINARIO,
COUNT (*) CANTIDAD
FROM VACUNA
INNER JOIN VETERINARIO AS V ON VACUNA.ID_VETERINARIO=V.ID_VETERINARIO
GROUP BY VACUNA.ID_VETERINARIO, V.NOMBRE_VETERINARIO, V.APELLIDO_VETERINARIO ORDER BY CANTIDAD ASC;



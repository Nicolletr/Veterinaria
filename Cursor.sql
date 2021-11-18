/*CURSOR: muestre los veterinarios con todas las mascotas y fechas en las que fueron atendidas.*/
do 
$$
declare
	consulta RECORD;
	cur_clientes cursor for 
	select 
	V.ID_VETERINARIO AS CODIGO,
	(V.NOMBRE_VETERINARIO||' '||V.APELLIDO_VETERINARIO) AS VETERINARIO, 
	M.NOMBRE_MASCOTA AS NOMBRE, FECHA_APLICACION AS FECHA FROM VACUNA AS VA
	INNER JOIN VETERINARIO AS V ON V.ID_VETERINARIO=VA.ID_VETERINARIO
	INNER JOIN MASCOTA AS M ON M.ID_MASCOTA=VA.ID_MASCOTA
	GROUP BY V.ID_VETERINARIO,NOMBRE_VETERINARIO, NOMBRE_MASCOTA, FECHA_APLICACION;
begin 
	for consulta in cur_clientes loop
		raise notice 
		'Id_veterinario: %| Veterinario: %| Mascota: %| Fecha de Aplicacion: %' ,
		consulta.CODIGO,consulta.VETERINARIO,consulta.NOMBRE,consulta.FECHA;
	end loop;
end
$$
LANGUAGE PLPGSQL;
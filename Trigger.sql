
/*TRIGGER: que actualice el número de mascotas que un cliente ha llevado.*/
create or replace function actualizar_datos() returns trigger 
as $actualizar_datos$
DECLARE 
 NUM_MASCOTAS INT;
begin
	UPDATE CLIENTE SET NUMERO_MASCOTAS = (NUMERO_MASCOTAS + NUM_MASCOTAS)
	WHERE ID_CLIENTE=NEW.ID_CLIENTE;
	RETURN NULL;
END
$actualizar_datos$
LANGUAGE PLPGSQL;

CREATE TRIGGER actualizar_datos 
after
INSERT ON cliente FOR EACH ROW
EXECUTE PROCEDURE actualizar_datos();

update cliente set numero_mascotas='3' where id_cliente='1'
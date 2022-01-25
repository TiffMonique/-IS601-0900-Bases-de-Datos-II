/*12. Crear una secuencia para las tablas LOGS, que comience con el valor de 1 y se 
incremente de 3 en 3 y que tenga un valor mínimo de 1 y un valor máximo de 1000.
*/

CREATE SEQUENCE SQ_TABLA_LOGS
START WITH 1
INCREMENT BY 3
MINVALUE 1
MAXVALUE 1000;

/*13. Con la secuencia creada en el ejercicio anterior, vincularla con un trigger para simular 
un campo autoincrementable en tabla LOGS
*/
CREATE OR REPLACE TRIGGER TG_SQ_TABLA_LOGS
BEFORE INSERT ON LOGS
FOR EACH ROW
DECLARE


BEGIN
    :NEW.ID:=SQ_TABLA_LOGS.NEXTVAL;

END;


BEGIN
    INSERT INTO LOGS (NOMBREUSUARIO, FECHAMOD, DESCRIPCION)VALUES ('TIOFILO','09-JUN-2021','HOLA');
END;


/*14. Crear triggers para las tablas mecánicos, trabajos y coches. Los triggers deben 
cumplir las condiciones siguientes*/

/*Se deben ejecutar antes de realizar una inserción en cada tabla y guardar un 
registro en la tabla LOGS con los datos de la inserción
Se deben ejecutar después de realizar una actualización en cada tabla y guardar 
un registro en la tabla LOGS con los datos anteriores a la actualización
*/

--TRIGGER UPDATE
CREATE OR REPLACE TRIGGER TG_UPDATE_TABLA_LOGS
BEFORE UPDATE ON LOGS
FOR EACH ROW
BEGIN
 :NEW.DESCRIPCION:=TRIM(UPPER(:NEW.DESCRIPCION));
END;


BEGIN
    UPDATE LOGS SET DESCRIPCION ='hOli';
END;


/*15. Mediante el uso de la instrucción insert into, ingresar 3 registros nuevos en las tablas 
mecánicos, trabajos y coches. Luego de ingresar estos registros, comprobar que se hayan 
creado todos los registros correspondientes en la tabla LOGS*/


/*16. Crear un bloque anónimo que elimine lógicamente todos los trabajos que ha realizado 
el empleado con DNI=3333 y cuyo bloque anónimo imprima un mensaje al terminar de 
realizar la eliminación lógica de todos los registros*/

BEGIN

    DELETE FROM TRABAJOS WHERE DNI=3333;
END;

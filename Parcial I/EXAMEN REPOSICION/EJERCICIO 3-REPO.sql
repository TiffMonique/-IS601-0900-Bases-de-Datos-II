/*3) Crear una secuencia para la tabla Empleados, en donde el valor de inicio debe ser
mayor una unidad de acuerdo al último id de empleado almacenado en la base de datos.
Debe de mostrar cómo obtuvo el último id de empleado guardado. Luego se debe crear
un bloque anónimo que inserte 4 nuevos empleados, los valores a insertar serán definidos
por usted, estas inserciones deben hacer uso de la secuencia. La secuencia NO debe ser
gestionada por un trigger. Al final de la inserción se deben aprobar los cambios y mostrar
un mensaje que diga “Registros almacenados”. En caso de cualquier error, se debe
gestionar el error y deshacer los cambios que se hayan realizado en la base de datos,
además de imprimir un mensaje con el código y la descripción del error. (valor 10%)*/

DECLARE
ULTIMO_REGISTRO EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
SELECT COUNT(EMPLOYEE_ID) INTO ULTIMO_REGISTRO FROM EMPLOYEES;
DBMS_OUTPUT.PUT_LINE('EL ULTIMO REGISTROS ES: '||ULTIMO_REGISTRO);
DBMS_OUTPUT.PUT_LINE(CHR(13)); 
END;

CREATE SEQUENCE SQ_EMPLE_20181002925 

START WITH 108 
INCREMENT BY 1;

INSERT INTO EMPLOYEES VALUES (SQ_EMPLE_20181002925.nextval,	'Summer','Payne',	'summer.payne@example.com',	'515.123.8181','07-JUN-16',	106	,'Public Accountant');
INSERT INTO EMPLOYEES VALUES (SQ_EMPLE_20181002925.nextval,	'Island','Payne',	'summer.payne@example.com',	'515.123.8181','07-JUN-16',	106	,'Public Accountant');
INSERT INTO EMPLOYEES VALUES (SQ_EMPLE_20181002925.nextval,	'Beach'	,'Payne',	'summer.payne@example.com',	'515.123.8181','07-JUN-16',	106	,'Public Accountant');
INSERT INTO EMPLOYEES VALUES (SQ_EMPLE_20181002925.nextval,	'Ocean','Payne',	'summer.payne@example.com',	'515.123.8181','07-JUN-16',	106	,'Public Accountant');

DECLARE 
  VALOR_ACTUAL_SQ NUMBER;
BEGIN
  VALOR_ACTUAL_SQ := SQ_EMPLE_20181002925.CURRVAL;
  DBMS_OUTPUT.PUT_LINE('EL VALOR ACTUAL DE LA SECUENCIA ES: '||VALOR_ACTUAL_SQ);
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Registros almacenados');
   EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error de procesamiento');
            ROLLBACK;
END;
  
/*2) Crear una tabla llamada LOGS, que contenga los campos CODIGO NUMBER, 
DESCRIPCION VARCHAR2(800), FECHA TIMESTAMP, USUARIO VARCHAR2(50), 
OPERACION VARCHAR2(50). Además, crear una secuencia para esta tabla y que se 
gestione la misma a través de un trigger para tener valores autoincrementables en el 
campo código de esta tabla. Luego crear un trigger para la tabla categorías, se debe 
ejecutar después de un UPDATE en esta tabla, este trigger debe guardar un registro en la 
tabla LOGS con la información de la operación que se realizó.
*/

CREATE TABLE LOGS(
    CODIGO NUMBER PRIMARY KEY,
    DESCRIPCION VARCHAR2(800),
    FECHA TIMESTAMP,
    USUARIO VARCHAR2(50),
    OPERACION VARCHAR2(50)
);

--CREACION DE LLAVE INCREMENTAL
CREATE SEQUENCE SQ_LOGS
START WITH 1
INCREMENT BY 1;

--CREACION DEL TRIGGER
CREATE OR REPLACE TRIGGER TG_CATEGORIAS
AFTER UPDATE ON CATEGORIAS
FOR EACH ROW

DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

    IF(UPDATING) THEN
        INSERT INTO LOGS VALUES(SQ_LOGS.NEXTVAL, 'SE REALIZO UN UPDATE EN LA TABLA CATEGORIAS',
        SYSTIMESTAMP, USER, 'OPERACION UPDATE'); 
    END IF;
    
    COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
  
END;


--PROBANDO EL UPDATE
BEGIN
    UPDATE CATEGORIAS SET nombrecat='MEDICINA' WHERE nombrecat='MEDICINAS';
    COMMIT;
    
END;

set SERVEROUTPUT ON

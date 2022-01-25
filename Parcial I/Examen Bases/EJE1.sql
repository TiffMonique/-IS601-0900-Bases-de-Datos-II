/*1) Se desea realizar una consulta para obtener los siguientes campos department_id,
department_name, street_address y postal_code. La consulta debe involucrar las tablas
necesarias para obtener los campos y se deben obtener los registros cuyo valor del
manager_id NO sea NULL. La información obtenida se debe imprimir en pantalla
mediante un bloque anónimo y la forma de procesar la consulta será mediante un bulk
collect. Es necesario imprimir en la pantalla cuántos registros se obtuvieron. (valor 15%)*/


DECLARE 

    TYPE FILA IS RECORD(
        DEPARTMENT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE,
        DEPARTMENT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE,
        street_address LOCATIONS.street_address%TYPE,
        postal_code LOCATIONS.postal_code%TYPE,
        manager_id employees.manager_id%TYPE
    );

    TYPE TABLA_DEPTO_20181002925 IS TABLE OF FILA INDEX BY PLS_INTEGER;
    DATOS_DEPARTMENT TABLA_DEPTO_20181002925;
    ITERACION NUMBER(10):=0;
    location_id LOCATIONS.location_id%TYPE;
    manager_id employees.manager_id%TYPE;
    
    BEGIN

    SELECT DEPARTMENTS.DEPARTMENT_ID,DEPARTMENTS.DEPARTMENT_NAME,LOCATIONS.street_address,
    LOCATIONS.postal_code ,employees.manager_id BULK COLLECT 
    INTO DATOS_DEPARTMENT FROM DEPARTMENTS
    INNER JOIN LOCATIONS ON locations.location_id = departments.location_id
    INNER JOIN EMPLOYEES ON employees.manager_id = departments.manager_id
    WHERE DEPARTMENTS.manager_id IS NOT NULL;
    
    
    WHILE(ITERACION<SQL%ROWCOUNT) LOOP
        DBMS_OUTPUT.PUT_LINE('DEPARTMENT ID: '||DATOS_DEPARTMENT(ITERACION+1).DEPARTMENT_ID);
        DBMS_OUTPUT.PUT_LINE('DEPARTMENT Name: '||DATOS_DEPARTMENT(ITERACION+1).DEPARTMENT_NAME);
        DBMS_OUTPUT.PUT_LINE('STREET ADDRESS: '||DATOS_DEPARTMENT(ITERACION+1).street_address);
        DBMS_OUTPUT.PUT_LINE('POSTAL CODE: '||DATOS_DEPARTMENT(ITERACION+1).postal_code);
        DBMS_OUTPUT.PUT_LINE('MANAGER ID: '||DATOS_DEPARTMENT(ITERACION+1).manager_id);
        DBMS_OUTPUT.PUT_LINE(CHR(13));
        
        ITERACION := ITERACION+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('LA CANTIDAD DE REGISTROS OBTENIDOS ES '||DATOS_DEPARTMENT.COUNT);
END;

  
    
    

    
    

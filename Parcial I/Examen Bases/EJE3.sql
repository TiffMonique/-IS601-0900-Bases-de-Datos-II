/*3) Crear un bloque anónimo que imprima en pantalla la siguiente información JOB_ID,
JOB_TITLE, MIN_SALARY, MAX_SALARY, DEPARTMENT_ID, DEPARTMENT_NAME,
START_DATE, END_DATE y NOMBRE COMPLETO del empleado. Este bloque anónimo
debe mostrar todos los registros obtenidos en la consulta. (valor 10%)
*/

DECLARE 

    TYPE FILA IS RECORD(
        JOB_ID JOBS.JOB_ID%TYPE,
        JOB_TITLE jobs.job_title%TYPE,
        min_salary jobs.min_salary%TYPE,
        max_salary jobs.max_salary%TYPE,
        department_id departments.department_id%TYPE,
        department_name departments.department_name%TYPE,
        START_DATE job_history.start_date%TYPE,
        END_DATE job_history.end_date%TYPE,
        first_name employees.first_name%TYPE,
        last_name employees.last_name%TYPE
        
    );

    TYPE TABLA_JOBS_20181002925 IS TABLE OF FILA INDEX BY PLS_INTEGER;
    DATOS_JOBS TABLA_JOBS_20181002925;
    ITERACION NUMBER(10):=0;
    department_id departments.department_id%TYPE;
    employee_id employees.employee_id%TYPE;
    
    BEGIN

    SELECT JOBS.JOB_ID,jobs.job_title,jobs.min_salary,
    max_salary,departments.department_id,department_name,START_DATE,END_DATE,first_name, last_name BULK COLLECT 
    INTO DATOS_JOBS  FROM JOB_HISTORY
    INNER JOIN departments ON job_history.department_id= departments.department_id
    INNER JOIN jobs ON jobs.job_id = job_history.job_id
    INNER JOIN employees on employees.employee_id = job_history.employee_id;
    
    
    WHILE(ITERACION<SQL%ROWCOUNT) LOOP
       
        DBMS_OUTPUT.PUT_LINE('JOB ID: '||DATOS_JOBS (ITERACION+1).JOB_ID);
        DBMS_OUTPUT.PUT_LINE('JOB_TITLE: '||DATOS_JOBS (ITERACION+1).JOB_TITLE);
        DBMS_OUTPUT.PUT_LINE('min_salary: '||DATOS_JOBS (ITERACION+1).min_salary);
        DBMS_OUTPUT.PUT_LINE('max_salary: '||DATOS_JOBS (ITERACION+1).max_salary);
        DBMS_OUTPUT.PUT_LINE('DEPARTMENT ID: '||DATOS_JOBS (ITERACION+1).DEPARTMENT_ID);
        DBMS_OUTPUT.PUT_LINE('DEPARTMENT name: '||DATOS_JOBS (ITERACION+1).DEPARTMENT_NAME);
        DBMS_OUTPUT.PUT_LINE('START DATE: '||DATOS_JOBS (ITERACION+1).START_DATE);
        DBMS_OUTPUT.PUT_LINE('END DATE: '||DATOS_JOBS (ITERACION+1).END_DATE);
        DBMS_OUTPUT.PUT_LINE('NOMBRE EMPLEADO: '||DATOS_JOBS (ITERACION+1).FIRST_NAME||' '||DATOS_JOBS (ITERACION+1).LAST_NAME);
        DBMS_OUTPUT.PUT_LINE(CHR(13));
        
        ITERACION := ITERACION+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('LA CANTIDAD DE REGISTROS OBTENIDOS ES '||DATOS_JOBS.COUNT);
END;
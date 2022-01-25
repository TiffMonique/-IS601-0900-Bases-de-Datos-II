CREATE TABLE COCHES(
mat VARCHAR2(8) PRIMARY KEY,
marca VARCHAR2(15),
modelo VARCHAR2(15),
an_fab NUMBER(4)

);

CREATE TABLE MECANICOS(
dni VARCHAR2(9) PRIMARY KEY,
nombre VARCHAR2(15),
puesto VARCHAR2(15)
);

CREATE TABLE TRABAJOS(
mat VARCHAR2(8),
dni VARCHAR2(9),
horas NUMBER(3,1),
CONSTRAINT ck_trabajo CHECK (horas>=0.5),
fecha_rep DATE, 
CONSTRAINT fk1_trabajos FOREIGN KEY (mat) REFERENCES coches (mat),
CONSTRAINT fk2_trabajos FOREIGN KEY (dni) REFERENCES mecanicos (dni)
);

/*Crear una tabla llamada LOGS y con los campos id de tipo NUMBER, nombreUsuario 
de tipo VARCHAR2(50), fechaMod de tipo DATE y descripción de tipo VARCHAR2(100)*/
CREATE TABLE LOGS(
id NUMBER PRIMARY KEY,
nombreUsuario VARCHAR2(50),
fechaMod DATE,
descripcion VARCHAR2(100)
);

/*Agregar una columna a todas las tablas, esta columna se debe llamar estado y debe 
ser de tipo NUMBER(1), este campo solamente almacenará valores de 0 y 1, el 0 indicará 
que el registro se encuentra inactivo (lógicamente eliminado). El 1 indicará que el registro 
se encuentra activo (lógicamente no eliminado)*/
 

ALTER  table constituyente ADD ESTADO NUMBER(1);
ALTER  table Destino ADD ESTADO NUMBER(1);
ALTER  table empresaproductora ADD ESTADO NUMBER(1);
ALTER  table empresatransportista ADD ESTADO NUMBER(1);
ALTER  table residuo ADD ESTADO NUMBER(1);
ALTER  table residuo_constituyente ADD ESTADO NUMBER(1);
ALTER  table traslado ADD ESTADO NUMBER(1);
ALTER  table traslado_empresatransportista ADD ESTADO NUMBER(1);


/*Crear un bloque anónimo que establezca en un valor de 1 todos los registros de todas 
las tablas, en el campo llamado estado, es decir, el campo estado debe tener un valor de 
1 en todos los registros de todas las tablas*/


DECLARE
    ESTADO NUMBER(1);
    CURSOR CTABLAS IS SELECT ESTADO FROM SYS.TABLES;

BEGIN
    OPEN CTABLAS;
    
    LOOP
        FETCH  CTABLAS INTO ESTADO;
        EXIT WHEN CTABLAS%NOTFOUND;
        
        UPDATE SYS.TABLES SET estado =1;
        COMMIT;
        
        END LOOP;
    CLOSE CTABLAS;

END;


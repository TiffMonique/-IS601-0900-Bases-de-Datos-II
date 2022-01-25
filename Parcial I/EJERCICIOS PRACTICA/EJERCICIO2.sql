DECLARE
                                                                     
BEGIN
     INSERT INTO traslado_empresatransportista VALUES('B-4539523-R',1.02, '10-JAN-90',	'DESTINO-N01',	'A-87684567-B'	,'Ferrocarril',	400,	80000);
    INSERT INTO traslado_empresatransportista VALUES('A-4539523-R',1.02, '10-JAN-90',	'DESTINO-N06',	'A-87684567-B'	,'Ferrocarril',	400,	80000);
   -- COMMIT;
    
    INSERT INTO traslado_empresatransportista VALUES('C-4539523-R',1.02, '10-JAN-90',	'DESTINO-N01',	'A-87684567-B'	,'Ferrocarril',	400,	80000);
    INSERT INTO traslado_empresatransportista VALUES('D-4539523-R',1.02, '10-JAN-90',	'DESTINO-N01',	'A-87684567-B'	,'Ferrocarril',	400,	80000);
   -- COMMIT;
    
    INSERT INTO traslado_empresatransportista VALUES('E-4539523-R',1.02, '10-JAN-90',	'DESTINO-N05',	'A-87684567-B'	,'Ferrocarril',	400,	80000);
    INSERT INTO traslado_empresatransportista VALUES('F-4539523-R',1.02, '10-JAN-90',	'DESTINO-N06',	'A-87684567-B'	,'Ferrocarril',	400,	80000);
    --COMMIT;
    
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: '||SQLCODE||' LLAVE FORANEA DUPLICADA');
            ROLLBACK;
            
        WHEN OTHERS THEN
            IF (SQLCODE = -2291) THEN
                DBMS_OUTPUT.PUT_LINE('ERROR '||SQLCODE||' valor incorrecto de llave foránea');
            END IF;
            
            IF (SQLCODE = -1438) THEN 
                DBMS_OUTPUT.PUT_LINE('AsignO un valor mayor a laprecisión indicada en la estructura de la tabla para un campo numérico');
            END IF;

END;


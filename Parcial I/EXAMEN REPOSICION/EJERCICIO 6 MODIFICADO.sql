DECLARE
  v_cod_region REGIONS.REGION_ID%TYPE;
  v_nomb_region REGIONS.REGION_NAME%TYPE;
  v_cant_reg NUMBER :=4;
  v_iter NUMBER;
BEGIN
  SELECT COUNT(regions.region_ID) INTO v_cant_reg FROM REGIONS; --ESTE CODIGO ESTÃ? CORRECTO

  FOR v_iter IN 1..v_cant_reg LOOP
    v_cod_region:=v_iter;
    SELECT regions.region_name INTO v_nomb_region FROM REGIONS
    WHERE regions.region_ID=v_iter;
    
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA REGION CON CODIGO '||v_cod_region||' ES: '||v_nomb_region); 
    
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('OBTENIENDO NOMBRE DE REGION 5');
  v_cod_region:=5;
  SELECT regions.region_name INTO v_nomb_region FROM REGIONS
  WHERE regions.region_ID=v_cod_region;    
  DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA REGION CON CODIGO 5 ES: '||v_nomb_region);
  
  EXCEPTION
    WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('LA CONSULTA HA RETORNADO MUCHOS REGISTROS');
      
    WHEN OTHERS THEN
        IF (v_cod_region>4) THEN
           DBMS_OUTPUT.PUT_LINE('REGISTRO NO ENCONTRADO');  
        END IF;
END;
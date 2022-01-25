-------PARA LA TABLA DEPARTAMENTOS-------
SELECT id_departamento , departamento FROM departamento



--------PARA LA TABLA CLIENTE----
SELECT id_cliente , CONCAT(nombre , ' ' , apellido) nombre FROM cliente


-------PARA LA TABLA TIEMPO----

SELECT CONVERT(DATE, fecha_pago) tiempoId, DATEPART(YEAR, fecha_pago) año, 
DATEPART(MONTH, fecha_pago) mes, DATEPART(dayofyear , fecha_pago) dia_año, 
((DATEPART(quarter, FECHA_PAGO)-1)/2)+1 SEMESTRE,
DATEPART(QUARTER, fecha_pago) trimestre 
FROM PAGO
GROUP BY PAGO.FECHA_PAGO


---------PARA LA TABLA EMPLEADO----
SELECT id_empleado , CONCAT(nombre, ' ' , apellido) nombre FROM empleado




-----PARA LA TABLA HECHOS PAGO------
SELECT EMPLEADO.ID_EMPLEADO "Cod. Empleado", CLIENTE.ID_CLIENTE "Cod. Cliente", 
    ID_PAGO "Cod. Pago", CONVERT(DATE, FECHA_PAGO) "Id. Fecha de pago", 
    COUNT(ID_PAGO) OVER (PARTITION BY DATEPART(MONTH, FECHA_PAGO), 
    DATEPART(YEAR, FECHA_PAGO)) "Conteo de pagos en el mes", 
    SUM(MONTO) OVER (PARTITION BY DATEPART(MONTH, FECHA_PAGO), DATEPART(YEAR, FECHA_PAGO)) "Monto de pagos del mes"
FROM PAGO 
  INNER JOIN EMPLEADO ON PAGO.ID_EMPLEADO = EMPLEADO.ID_EMPLEADO 
  INNER JOIN CLIENTE ON PAGO.ID_CLIENTE = CLIENTE.ID_CLIENTE 
GROUP BY EMPLEADO.ID_EMPLEADO, CLIENTE.ID_CLIENTE, ID_PAGO, FECHA_PAGO, MONTO;





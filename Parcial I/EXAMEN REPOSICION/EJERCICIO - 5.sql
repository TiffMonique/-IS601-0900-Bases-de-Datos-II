/*5) Mediante sus palabras explicar lo siguiente (deben de dar respuesta en el archivo con
la soluci�n a todos los ejercicios, es decir, las respuestas ser�n escritas, no las deben
explicar en el video:
a) �Cu�l es la importancia del commit y rollback? �Sobre qu� elementos no tiene
efectos el rollback?�Qu� tipo de operaciones tienen un commit impl�cito?
b) �En qu� ocasiones se genera la excepci�n TOO MANY ROWS? (valor 4%)
*/

/*Repuesta a)
--El uso del Commit es muy importante ya que permite guardar los cambio realizados en una transaccion
--por ejemplo al utilizar un commit despues de realizar un insert en una tabla, el registro quedara guardado permantemente en la base de datos.

--El rollback es importante ya que permite borrar o revertir los cambios efectuados para que los datos vuelva a la forma en que se encontraban,
--es importante utilizarlo porque cuando hay fallas o errores en lo que hemos realizado, no se guarden cambios que vayan a afectar. es vital para un  buen funcionanmiento de nuestras bases de datos

--EL ROLLBACK NO TIENE EFECTO SOBRE LAS SECUENCIAS

--Una vez que cualquier transaccion se realice de forma exitosa se realiza un coommit implicito, lo que quiere decor que es realizado de forma autmoatica

Respuesta b)
-SI SE RETORNAN MUCHOS REGISTROS EN LA SENTENCIA SELECT INTO

*/



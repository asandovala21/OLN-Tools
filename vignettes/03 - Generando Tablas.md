Generando Tablas
================

``OLN-Tools`` contiene un sistema OO para generar tablas que se apeguen al formato establecido en los manuales. Esta viñeta muestra, a través de una serie de ejemplos, como sacarle el máximo provecho a este sistema.

### Ejemplo 1

Suponga que desea construir una tabla con la distribución de ocupados y desocupados por tramo de edad, para los años 2010 y 2015. La siguiente figura ilustra el formato esperado:
![Figura 03-01](https://rawgit.com/igutierrezm/OLN-Tools/master/fig/vignettes/figura 03-01.png)

Ya que esta tabla tiene dos paneles (digamos, *ocupados* y *desocupados*) podemos construirla de la siguiente manera:
```stata
* Housekeeping
set more off
clear all
cls

* Objetos temporales
tempfile df
save `df', emptyok

* Declaración de una nueva tabla
.my_table = .ol_table.new
.my_table.cmds     = "proportion _tramo_edad_v1"
.my_table.masks    = "(% de ocupados)"
.my_table.years    = "2010 2015"
.my_table.months   = "2 5 8 11"
.my_table.src      = "ene"
.my_table.from     = "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"
.my_table.varlist0 = "_ocupado"

* Estimación - Panel N°1:
.my_table.subpop   = "if (_ocupado == 1)"
.my_table.create
gen subpop = 

* Estimación - Panel N°2:
.my_table.subpop   = "if (_ocupado == 1)"
.my_table.create

```



asdasda

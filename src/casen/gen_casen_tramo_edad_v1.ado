* Tramo de edad (centrado en la pet)
capture program drop gen_casen_tramo_edad_v1
program define gen_casen_tramo_edad_v1
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_casen, varlist("_tramo_edad_v1") año(`año')
	# delimit ;
	recode `r(selection)'
		(00/14  =  0 "14 o menos")
		(15/24  =  1 "Entre 15 y 24")
		(25/34  =  2 "Entre 25 y 34")
		(35/44  =  3 "Entre 35 y 44")
		(45/54  =  4 "Entre 45 y 54")
		(55/64  =  5 "Entre 55 y 64")
		(65/max =  6 "65 o más")
		(else   = .a "ns/nr"),
		generate(_tramo_edad_v1);
	# delimit cr
	* Etiquetado
	label variable _tramo_edad_v1 "Tramo de edad"
end

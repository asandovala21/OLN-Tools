capture program drop gen_casen_pea
program define gen_casen_pea
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  select_casen, varlist("_pea") año(`año')
  # delimit ;
  recode `r(selection)'
  	(1/2  =  1 "Sí")
  	(3    =  0 "No")
    (else = 1e5 "ns/nr"),
  	generate(_pea);
  # delimit cr
  * Etiquetado:
  label variable _pea "¿Pertenece a la PEA?"
end

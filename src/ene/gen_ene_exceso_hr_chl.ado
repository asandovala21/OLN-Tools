capture program drop gen_ene_exceso_hr_chl
program define gen_ene_exceso_hr_chl, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local var "_exceso_hr_chl"
  recode habituales (0/45 = 0) (46/998 = 1) (else = .a), generate(`var')
  * Etiquetado (valores)
  label define `var' 0 "No" 1 "Sí" .a "ns/nr"
  label values `var' `var'
  * Etiquetado (variables)
  local lvar "¿Trabaja habitualmente más de 45hrs por semana?"
  label variable `var' "`lvar'"
end

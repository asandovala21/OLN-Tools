capture program drop gen_casen_ytrabajo
program define gen_casen_ytrabajo
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_ytrabajo"
  select_casen, varlist("`var'") año(`año')
  generate `var' = `r(selection)'
  * Etiquetado
  label variable `var' "Ingreso del trabajo ($)"
end

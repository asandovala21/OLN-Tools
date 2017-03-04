*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "categoria_ocupacion b8"
local var1 "_cise_v2"

* Base de prueba
use `var0' using "$pkg/data/tests/ene/2016/01/`var1'.dta", clear
gen_ene`var1', año("2016") mes("01")
contract `var0' `var1'
gen nolabel = `var1'
drop _freq

* Visualización
format * %100.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact
noisily : list, abbr(100)
noisily : label list

* Contrastes
matrix expected = (.a, 1, 2, 3, 4, 3, 4, 3, 4, 3, 4, 5)'
expect_equal, expected("expected") observed("`var1'") id("Test N°1")

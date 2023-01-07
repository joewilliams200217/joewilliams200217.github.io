clear
insheet using "Comparespendindex.csv", clear
keep City april242022
rename april242022 SpendIndex
save "Spendindex.dta", replace

clear
insheet using "Cityaverageoverallrecovery.csv", clear
keep City averagefootfall
save "Footfall.dta", replace

clear
insheet using "Highstreet_vacancies.csv", clear
save "Vacancies.dta", replace

clear
use "Footfall.dta"
sort City
merge 1:1 City using "Spendindex.dta"
tab _merge
keep if _merge==3 
drop _merge
save "working.dta", replace

clear
use "working.dta"
sort City
merge 1:1 City using "Vacancies.dta"
tab _merge
keep if _merge==3 
drop _merge
save "Highstreetdata.csv", replace



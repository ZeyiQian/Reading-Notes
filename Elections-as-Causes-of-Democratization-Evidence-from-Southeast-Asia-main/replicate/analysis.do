** THESE COMMANDS REPLICATE ALL ANALYSIS IN MORGENBESSER AND PEPINSKY, "ELECTIONS AS CAUSES OF DEMOCRATIZATION" **
** 
** To use, change the second line to match your own directory structure
** Regression outputs will be placed in that folder as well.
** 



* get and process electoral democracy data
clear all

cd "___YOUR PATH HERE____"

* first import table 1 and make it into data
* this is the Morgenbesser and Pepinsky election data (for SEA only)
import excel "Elections.xlsx", sheet("Competitive Elections") cellrange(A1:C87) firstrow
drop if Year == .
gen elect_mp = 1
gen comp_mp = 1
save competitive-temp.dta, replace

import excel "Elections.xlsx", sheet("Uncompetitive Elections") cellrange(A1:C28) firstrow clear
drop if Year == .
gen elect_mp = 1
gen comp_mp = 0
append using competitive-temp.dta
erase competitive-temp.dta

rename Regime cname
rename Year year
rename Competition competition
replace cname="Myanmar" if cname=="Burma/Myanmar"
replace cname="Malaysia (-1965)" if cname=="Malaysia" & year <= 1965
replace cname="Malaysia (1966-)" if cname=="Malaysia" & year > 1965
duplicates drop cname year, force
sort cname year
save elect-mp.dta, replace


* now get the VDEM data
use "V-Dem-DS-CY-v7.1.dta", clear

keep country_name country_id country_text_id year v2eltype_0 v2eltype_6
drop if year<=1945

gen vdem_elect = 0
replace vdem_elect = 1 if v2eltype_0==1 | v2eltype_6 ==1

* rename countries for later merge
replace country_name="Congo" if country_name=="Republic of the Congo"
replace country_name="Congo, Democratic Republic" if country_name=="Democratic Republic of Congo"
replace country_name="Cote d'Ivoire" if country_name=="Ivory Coast"
replace country_name="Germany, East" if country_name=="German Democratic Republic"
replace country_name="Korea, North" if country_name=="North Korea"
replace country_name="Korea, South" if country_name=="South Korea"
replace country_name="Myanmar" if country_name=="Burma/Myanmar"
replace country_name="Sao Tome and Principe" if country_name=="São Tomé och Príncipe"
replace country_name="Vietnam" if country_name=="Democratic Republic of Vietnam"
replace country_name="Vietnam, South" if country_name=="Republic of Vietnam"
replace country_name="Yemen, South" if country_name=="South Yemen"

drop if country_name=="Palestine/British" | country_name=="Palestine/Gaza" | ///
	country_name=="Palestine/West Bank" | country_name=="Somaliland" | country_name=="Zanzibar"

replace country_name="Cyprus (-1974)" if country_name=="Cyprus" & year <= 1974
replace country_name="Cyprus (-1975)" if country_name=="Cyprus" & year > 1974
replace country_name="Ethiopia (-1992)" if country_name=="Ethiopia" & year <= 1992
replace country_name="Ethiopia (1993-)" if country_name=="Ethiopia" & year > 1992
replace country_name="France (-1962)" if country_name=="France" & year <= 1962
replace country_name="France (1963-)" if country_name=="France" & year > 1962
replace country_name="Malaysia (-1965)" if country_name=="Malaysia" & year <= 1965
replace country_name="Malaysia (1966-)" if country_name=="Malaysia" & year > 1965
replace country_name="Pakistan (-1970)" if country_name=="Pakistan" & year <= 1970
replace country_name="Pakistan (1971-)" if country_name=="Pakistan" & year > 1970
replace country_name="Sudan (-2011)" if country_name=="Sudan" & year <= 2011
replace country_name="Sudan (2012-)" if country_name=="Sudan" & year > 2011

rename country_name cname

save vdem-temp.dta, replace 



import excel "Electoral Democracy Table, ''Yes-No'' list, FIW 1989-2016.xlsx", sheet("Electoral Democracies") cellrange(A9:AB214) firstrow clear
rename Nov1988Dec1989 B
rename Yearscovered cname
label var B "1989"
label var cname ""
drop in 1

* reshape
rename (B-AB) temp#, addnumber(1989)
reshape long temp, i(cname) j(year)

* clean
tab temp, mi
replace temp = "No" if temp=="No "
replace temp = "" if temp==".."
tab temp, mi
encode temp, generate(eldem)
replace eldem = eldem-1


replace cname = "Antigua and Barbuda" if cname == "Antigua & Barbuda"
replace cname = "Bosnia and Herzegovina" if cname == "Bosnia-Herzegovina"
replace cname = "Myanmar" if cname == "Burma"
replace cname = "Congo" if cname == "Congo (Brazzaville)"
replace cname = "Congo, Democratic Republic" if cname == "Congo (Kinshasa)"
replace cname = "Cyprus (1975-)" if cname == "Cyprus"
replace cname = "Timor-Leste" if cname == "East Timor"
replace cname = "Ethiopia (-1992)" if cname == "Ethiopia" & year <=1992
replace cname = "Ethiopia (1993-)" if cname == "Ethiopia" & year >1992
replace cname = "France (1963-)" if cname == "France"
replace cname = "Gambia" if cname == "Gambia, The"
replace cname = "Germany, East" if cname == "Germany, E. "
replace cname = "Germany, West" if cname == "Germany, W. "
replace cname = "Malaysia (1966-)" if cname == "Malaysia"
replace cname = "Korea, North" if cname == "North Korea"
replace cname = "Korea, South" if cname == "South Korea"
replace cname = "Pakistan (1971-)" if cname == "Pakistan"
replace cname = "Sao Tome and Principe" if cname == "Sao Tome & Principe"
replace cname = "Serbia and Montenegro" if cname == "Serbia & Montenegro"
replace cname = "St Kitts and Nevis" if cname == "St. Kitts & Nevis"
replace cname = "St Lucia" if cname == "St. Lucia"
replace cname = "St Vincent and the Grenadines" if cname == "St. Vincent & Grenadines"
replace cname = "Sudan (-2011)" if cname == "Sudan" & year <=2011
replace cname = "Sudan (2012-)" if cname == "Sudan" & year >2011
replace cname = "Trinidad and Tobago" if cname == "Trinidad & Tobago"

save eldem.dta, replace 



* now grab data from QOG
use "qog_std_ts_jan17.dta", clear



* merge Morgenbesser and Pepinsky election data
replace ht_region = 7 if cname=="Vietnam" & year >= 1955  //ensure Vietnam coded
sort cname year
merge cname year using "elect-mp.dta"
replace elect_mp = 0 if elect_mp==. & ht_region==7
replace comp_mp = 0 if comp_mp==. & ht_region==7
drop _merge

* merge ELDEM data
merge 1:1 cname year using "eldem.dta"
order ccode cname year temp eldem _merge
drop if ccode==.
drop _merge

* merge VDEM data
merge 1:1 cname year using vdem-temp.dta
drop if ccode==.



set more off



* elections (NELDA)
gen elect_nelda = 0
replace elect_nelda = 1 if nelda_noe>=0 & nelda_noe!=.
replace elect_nelda = . if year<=1945 | year>=2013

* elections are competitive
gen comp_dpi= 0
replace comp_dpi = 1 if dpi_slop1>=1 & dpi_slop1!=.
replace comp_dpi = . if dpi_slop1 == .


drop if _merge==2
xtset


* Southeast Asia only, use our data
qui xtreg F1.bmr_dem elect_mp i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.bmr_dem elect_mp i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.bmr_dem elect_mp i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.bmr_dem elect_mp i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp)
esttab mod* using regressions1.csv, b(2) se(2) nogap keep(elect_mp) replace




* Southeast Asia only, cheibub and gandhi, not BMR

qui xtreg F1.chga_demo elect_mp i.year if chga_demo==0, fe cluster(ccode)
estimates store mod1

qui xtreg F5.chga_demo elect_mp i.year if chga_demo==0, fe cluster(ccode)
estimates store mod2

qui xtreg F1.chga_demo elect_mp i.year if L1.chga_demo==0, fe cluster(ccode)
estimates store mod3

qui xtreg F5.chga_demo elect_mp i.year if L1.chga_demo==0, fe cluster(ccode)
estimates store mod4


esttab mod*, b(2) se(2) nogap keep(elect_mp)
esttab mod* using regressions2.csv, b(2) se(2) nogap keep(elect_mp) replace



* Southeast Asia only, polity as DV
qui xtreg F1.p_polity2 elect_mp p_polity2 i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.p_polity2 elect_mp p_polity2 i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.p_polity2 elect_mp p_polity2 i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.p_polity2 elect_mp p_polity2 i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp)
esttab mod* using regressions3.csv, b(2) se(2) nogap keep(elect_mp p_polity2) replace



* Southeast Asia only, FH as DV

recode fh_pr  (7 = 1 "Not Free") (6 = 2) (5 = 3) (3 = 5) (2 = 6) (1 = 7 "Free"), gen(fh_pr_new)
recode fh_cl  (7 = 1 "Not Free") (6 = 2) (5 = 3) (3 = 5) (2 = 6) (1 = 7 "Free"), gen(fh_cl_new)

qui xtreg F1.fh_pr elect_mp fh_pr i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.fh_pr elect_mp fh_pr i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.fh_pr elect_mp fh_pr i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.fh_pr elect_mp fh_pr i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp)
esttab mod* using regressions4.csv, b(2) se(2) nogap keep(elect_mp fh_pr) replace



qui xtreg F1.fh_cl elect_mp fh_cl i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.fh_cl elect_mp fh_cl i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.fh_cl elect_mp fh_cl i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.fh_cl elect_mp fh_cl i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp)
esttab mod* using regressions5.csv, b(2) se(2) nogap keep(elect_mp fh_cl) replace



qui xtreg F1.eldem elect_mp i.year if eldem ==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.eldem elect_mp i.year if eldem ==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.eldem elect_mp i.year if L1.eldem ==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.eldem elect_mp i.year if L1.eldem ==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp)
esttab mod* using regressions6.csv, b(2) se(2) nogap keep(elect_mp) replace




* whole world

qui xtreg F1.bmr_dem elect_nelda i.year if bmr_dem==0, fe cluster(ccode)
estimates store mod1

qui xtreg F5.bmr_dem elect_nelda i.year if bmr_dem==0, fe cluster(ccode)
estimates store mod2

qui xtreg F1.bmr_dem elect_nelda i.year if L1.bmr_dem==0, fe cluster(ccode)
estimates store mod3

qui xtreg F5.bmr_dem elect_nelda i.year if L1.bmr_dem==0, fe cluster(ccode)
estimates store mod4


esttab mod*, b(2) se(2) nogap keep(elect_nelda)
esttab mod* using regressions7.csv, b(2) se(2) nogap keep(elect_nelda) replace



*******APPENDIX TABLES********
* use NELDA
qui xtreg F1.bmr_dem elect_nelda i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.bmr_dem elect_nelda i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.bmr_dem elect_nelda i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.bmr_dem elect_nelda i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_nelda)
esttab mod* using regressions_appendix1_nelda.csv, b(2) se(2) nogap keep(elect_nelda) replace


* use VDEM elect
qui xtreg F1.bmr_dem vdem_elect i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.bmr_dem vdem_elect i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.bmr_dem vdem_elect i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.bmr_dem vdem_elect i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(vdem_elect)
esttab mod* using regressions_appendix2_vdem.csv, b(2) se(2) nogap keep(vdem_elect) replace


* logit
qui xtlogit F1.bmr_dem elect_mp i.year if bmr_dem==0 & ht_region==7, fe 
estimates store mod1

qui xtlogit F5.bmr_dem elect_mp i.year if bmr_dem==0 & ht_region==7, fe 
estimates store mod2

qui xtlogit F1.bmr_dem elect_mp i.year if L1.bmr_dem==0 & ht_region==7, fe 
estimates store mod3

qui xtlogit F5.bmr_dem elect_mp i.year if L1.bmr_dem==0 & ht_region==7, fe 
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp) eform
esttab mod* using regressions_appendix3_logit.csv, b(2) se(2) nogap keep(elect_mp) replace



* competitiveness
qui xtreg F1.bmr_dem elect_mp comp_mp i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.bmr_dem elect_mp comp_mp i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.bmr_dem elect_mp comp_mp i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.bmr_dem elect_mp comp_mp i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp comp_mp)
esttab mod* using regressions_appendix4_comp.csv, b(2) se(2) nogap keep(elect_mp comp_mp) replace


* interacted competitiveness
qui xtreg F1.bmr_dem elect_mp##comp_dpi i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.bmr_dem elect_mp##comp_dpi i.year if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.bmr_dem elect_mp##comp_dpi i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.bmr_dem elect_mp##comp_dpi i.year if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(1.elect_mp 1.comp_dpi 1.elect_mp#1.comp_dpi)
esttab mod* using regressions_appendix5_interact.csv, b(2) se(2) nogap keep(1.elect_mp 1.comp_dpi 1.elect_mp#1.comp_dpi) replace



gen ln_gdppccon = ln(wdi_gdppppcon2011)
gen ln_pwt_rgdppc = ln(pwt_rgdp/pwt_pop)
gen pwt_gr = 100*(pwt_rgdp-pwt_rgdp[_n-1])/pwt_rgdp[_n-1]


* Southeast Asia, econ covariates
qui xtreg F1.bmr_dem elect_mp i.year ln_gdppccon wdi_gdpcapgr wdi_popurb if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.bmr_dem elect_mp i.year ln_gdppccon wdi_gdpcapgr wdi_popurb if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.bmr_dem elect_mp i.year ln_gdppccon wdi_gdpcapgr wdi_popurb if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.bmr_dem elect_mp i.year ln_gdppccon wdi_gdpcapgr  wdi_popurb if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp ln_gdppccon wdi_gdpcapgr wdi_popurb )
esttab mod* using regressions_appendix6_control1.csv, b(2) se(2) nogap keep(elect_mp ln_gdppccon wdi_gdpcapgr wdi_popurb) replace



* Southeast Asia, econ covariates2
qui xtreg F1.bmr_dem elect_mp i.year ln_pwt_rgdppc pwt_gr wdi_popurb if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod1

qui xtreg F5.bmr_dem elect_mp i.year ln_pwt_rgdppc pwt_gr wdi_popurb if bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod2

qui xtreg F1.bmr_dem elect_mp i.year ln_pwt_rgdppc pwt_gr wdi_popurb if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod3

qui xtreg F5.bmr_dem elect_mp i.year ln_pwt_rgdppc pwt_gr wdi_popurb if L1.bmr_dem==0 & ht_region==7, fe cluster(ccode)
estimates store mod4

esttab mod*, b(2) se(2) nogap keep(elect_mp ln_pwt_rgdppc pwt_gr wdi_popurb )
esttab mod* using regressions_appendix7_control2.csv, b(2) se(2) nogap keep(elect_mp ln_pwt_rgdppc pwt_gr wdi_popurb) replace




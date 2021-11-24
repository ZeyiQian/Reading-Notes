clear 
set mem 2000m
*cd "C:\Users\m1fjp00\Desktop\standar_errors"
cd "C:\Users\lc576\Dropbox\NAFTA\RESTUD\Caliendo_Parro_MS_17443\Data_and_Codes_CP\Elasticities"


global sectors "1 2 3 4 5 6 7 8 9 10 11 12 13  14 15 16 17 18 19 20"
global countries "1 2 3 4 5 6 7 8 9 10 11 12 13  14 15 16"


******Computing Robust Standard Errors Full Sample*****
insheet using DATA_OUT_100.csv
rename v1 sector
rename v2 y
rename v3 x
rename v4 d1
rename v5 d2
rename v6 d3
rename v7 d4
rename v8 d5
rename v9 d6
rename v10 d7
rename v11 d8
rename v12 d9
rename v13 d10
rename v14 d11
rename v15 d12
rename v16 d13
rename v17 d14
rename v18 d15
rename v19 d16
save data100, replace
drop if y=="NaN"
drop if x=="NaN"
destring y, replace
destring x, replace
save data100, replace
reg y x, nocons robust
gen agg_se100=_se[x]
gen agg_c100=_b[x]
keep agg_c100 agg_se100
keep if _n==1
gen obs=1
save agg100, replace
clear

***Observations
use data100
gen N=1
collapse (sum) N, by (sector)
save N, replace 
clear

foreach a of global sectors{
    use data100
	keep if sector==`a'
	regress y x, nocons robust
	gen sd=_se[x]
	gen cn=_b[x]
	keep if _n==1
	keep sector sd cn
	save s`a', replace 
	clear
      }
	
use s1
append using s2
append using s3
append using s4
append using s5
append using s6
append using s7
append using s8
append using s9
append using s10
append using s11
append using s12
append using s13
append using s14
append using s15
append using s16
append using s17
append using s18
append using s19
append using s20

save se100, replace
clear

use se100
joinby sector using N
rename sd se_100 
rename cn c_100
rename N N_100 
save se100, replace 
clear

use N
collapse (sum) N
gen obs=1
rename N N_100
save N_agg, replace
clear

use agg100
joinby obs using N_agg
save agg100, replace
clear


******Fixed Effects*******

foreach a of global sectors{
    use data100
	keep if sector==`a'
	regress y x d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16, nocons robust
	gen sd=_se[x]
	gen cn=_b[x]
	keep if _n==1
	keep sector sd cn
	save s`a', replace 
	clear
      }
	
use s1
append using s2
append using s3
append using s4
append using s5
append using s6
append using s7
append using s8
append using s9
append using s10
append using s11
append using s12
append using s13
append using s14
append using s15
append using s16
append using s17
append using s18
append using s19
append using s20

save se100fe, replace
clear

use se100fe
joinby sector using N
rename sd se_100_fe 
rename cn c_100_fe
rename N N_100_fe 
save se100fe, replace 

use se100
joinby sector using se100fe
save se100, replace
clear

******************************************************************************************************************************************************************************************************************************

******Computing Robust Standard Errors 99% Sample*****
insheet using DATA_OUT_99.csv
rename v1 sector
rename v2 y
rename v3 x
rename v4 d1
rename v5 d2
rename v6 d3
rename v7 d4
rename v8 d5
rename v9 d6
rename v10 d7
rename v11 d8
rename v12 d9
rename v13 d10
rename v14 d11
rename v15 d12
rename v16 d13
rename v17 d14
rename v18 d15
rename v19 d16
foreach a of global countries{
    tostring d`a', replace
    replace d`a'="0" if d`a'=="NaN"
	destring d`a', replace
	    }
save data99, replace
drop if y=="NaN"
drop if x=="NaN"
destring y, replace
destring x, replace
save data99, replace
reg y x, nocons robust
gen agg_se99=_se[x]
gen agg_c99=_b[x]
keep agg_c99 agg_se99
keep if _n==1
gen obs=1
save agg99, replace
clear

***Observations
use data99
gen N=1
collapse (sum) N, by (sector)
save N, replace 
clear

use data99
destring y, replace
destring x, replace
foreach a of global sectors{
	gen d_`a'=1
      replace d_`a'=0 if sector~=`a'
    }
save data99, replace 
clear

foreach a of global sectors{
    use data99
	keep if sector==`a'
	regress y x, nocons robust
	gen sd=_se[x]
	gen cn=_b[x]
	keep if _n==1
	keep sector sd cn
	save s`a', replace 
	clear
      }
	
use s1
append using s2
append using s3
append using s4
append using s5
append using s6
append using s7
append using s8
append using s9
append using s10
append using s11
append using s12
append using s13
append using s14
append using s15
append using s16
append using s17
append using s18
append using s19
append using s20

save se99, replace
clear

use se99
joinby sector using N
rename sd se_99 
rename cn c_99
rename N N_99 
save se99, replace 
clear

use N
collapse (sum) N
gen obs=1
rename N N_99
save N_agg, replace
clear

use agg99
joinby obs using N_agg
save agg99, replace
clear


******Fixed Effects*******

foreach a of global sectors{
    use data99
	keep if sector==`a'
	regress y x d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16, nocons robust
	gen sd=_se[x]
	gen cn=_b[x]
	keep if _n==1
	keep sector sd cn
	save s`a', replace 
	clear
      }
	
use s1
append using s2
append using s3
append using s4
append using s5
append using s6
append using s7
append using s8
append using s9
append using s10
append using s11
append using s12
append using s13
append using s14
append using s15
append using s16
append using s17
append using s18
append using s19
append using s20

save se99fe, replace
clear

use se99fe
joinby sector using N
rename sd se_99_fe 
rename cn c_99_fe
rename N N_99_fe 
save se99fe, replace 

use se99
joinby sector using se99fe
save se99, replace
clear

*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
******Computing Robust Standard Errors 97.5% Sample*****
insheet using DATA_OUT_975.csv
rename v1 sector
rename v2 y
rename v3 x
rename v4 d1
rename v5 d2
rename v6 d3
rename v7 d4
rename v8 d5
rename v9 d6
rename v10 d7
rename v11 d8
rename v12 d9
rename v13 d10
rename v14 d11
rename v15 d12
rename v16 d13
rename v17 d14
rename v18 d15
rename v19 d16
foreach a of global countries{
    tostring d`a', replace
    replace d`a'="0" if d`a'=="NaN"
	destring d`a', replace
	    }
save data975, replace
drop if y=="NaN"
drop if x=="NaN"
destring y, replace
destring x, replace
save data975, replace
reg y x, nocons robust
gen agg_se975=_se[x]
gen agg_c975=_b[x]
keep agg_c975 agg_se975
keep if _n==1
gen obs=1
save agg975, replace
clear

***Observations
use data975
gen N=1
collapse (sum) N, by (sector)
save N, replace 
clear

use data975
destring y, replace
destring x, replace
foreach a of global sectors{
	gen d_`a'=1
      replace d_`a'=0 if sector~=`a'
    }
save data975, replace 
clear

foreach a of global sectors{
    use data975
	keep if sector==`a'
	regress y x, nocons robust
	gen sd=_se[x]
	gen cn=_b[x]
	keep if _n==1
	keep sector sd cn
	save s`a', replace 
	clear
      }
	
use s1
append using s2
append using s3
append using s4
append using s5
append using s6
append using s7
append using s8
append using s9
append using s10
append using s11
append using s12
append using s13
append using s14
append using s15
append using s16
append using s17
append using s18
append using s19
append using s20

save se975, replace
clear

use se975
joinby sector using N
rename sd se_975 
rename cn c_975
rename N N_975 
save se975, replace 
clear

use N
collapse (sum) N
gen obs=1
rename N N_975
save N_agg, replace
clear

use agg975
joinby obs using N_agg
save agg975, replace
clear


******Fixed Effects*******

foreach a of global sectors{
    use data975
	keep if sector==`a'
	regress y x d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16, nocons robust
	gen sd=_se[x]
	gen cn=_b[x]
	keep if _n==1
	keep sector sd cn
	save s`a', replace 
	clear
      }
	
use s1
append using s2
append using s3
append using s4
append using s5
append using s6
append using s7
append using s8
append using s9
append using s10
append using s11
append using s12
append using s13
append using s14
append using s15
append using s16
append using s17
append using s18
append using s19
append using s20

save se975fe, replace
clear

use se975fe
joinby sector using N
rename sd se_975_fe 
rename cn c_975_fe
rename N N_975_fe 
save se975fe, replace 

use se975
joinby sector using se975fe
save se975, replace
clear

***Results*****
use agg100
joinby obs using agg99
joinby obs using agg975
drop obs
save agg_se, replace
clear

use se100
joinby sector using se100fe
joinby sector using se99
joinby sector using se99fe
joinby sector using se975
joinby sector using se975fe
save sect_se, replace
clear

use agg_se
outsheet agg_c100 agg_se100 N_100 agg_c99 agg_se99 N_99 agg_c975 agg_se975 N_975  using aggregate_results.csv , comma replace
clear

use sect_se
outsheet c_100 se_100 N_100 c_100_fe se_100_fe N_100_fe c_99 se_99 N_99 c_99_fe se_99_fe N_99_fe c_975 se_975 N_975 c_975_fe se_975_fe N_975_fe using sectoral_results.csv , comma replace

foreach a of global sectors{
erase s`a'.dta
}


erase se100.dta
erase se99.dta
erase se975fe.dta
erase se100fe.dta
erase se99fe.dta
erase se975.dta
erase agg_se.dta
erase agg100.dta
erase agg99.dta
erase agg975.dta
erase data100.dta 
erase data99.dta
erase data975.dta
erase sect_se.dta
erase N.dta
erase N_agg.dta

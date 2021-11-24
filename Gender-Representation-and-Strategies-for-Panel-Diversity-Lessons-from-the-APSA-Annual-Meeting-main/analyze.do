cd "___YOUR PATH NAME HERE___"


* import and clean to make easier to read (2017 data)
* import excel "17AMPanelParticipants.Demographics.xlsx", sheet("Sheet1") firstrow clear
import excel "2017 Annual Meeting Participants_7.11.2018 - ANONYMIZED (1)", sheet("Scheduled Participants By Role") firstrow clear

replace Gender = strtrim(Gender)
replace Roles  = subinstr(Roles, char(10), " and ", .) 
replace Gender = "Unknown" if Gender == "No Response"
replace Gender = "Unknown" if Gender == "Other"
replace Gender = "Unknown" if Gender == "Prefer not to disclose"
split Unit, parse(:) limit(2)
drop Unit
gen Unit = Unit2 if Unit2 != ""
replace Unit = Unit1 if Unit2 == ""
replace Unit = proper(Unit)
replace Unit = SubUnit if Unit == "Related Groups"
replace Unit = subinstr(Unit, "Claremont Institute for the Study of Statesmanship and Political Philosophy", "Claremont Institute", .)
replace Unit = subinstr(Unit, "Walter Bagehot Research Council on National Sovereignty", "Walter Bagehot Research Council", .)
replace Unit = subinstr(Unit, "Churchill Centre, The (International Churchill Society)", "Churchill Centre", .)
replace Unit = trim(Unit)
replace Unit = "International Security" if Unit=="International Security And Arms Control"
replace Unit="Comparative Latin American Politics and Political Economy" if Unit=="Latin American Studies Association"
save cleaned_data.dta, replace

preserve
drop if APSAStaff=="Y"
drop if SessionType=="Business Meeting"
collapse (count) DummyID, by(UniqueDummyID Gender RaceEthnicity YearofBirth)
rename DummyID appearances
gen female = 1 if Gender=="Female"
replace female = 0 if Gender=="Male"
graph bar (count) if Gender!="Unknown", over(appearances) over(Gender) title(2017) ylabel(, angle(0)) name(gender17, replace)
xi: nbreg appearances female i.RaceEthnicity i.YearofBirth
est store model1
estadd local hascontrols "Yes"
restore

* import and clean to make easier to read (2018 data)
import excel "2018 Annual Meeting Participants_7.11.2018 - ANONYMIZED (1)", sheet("Scheduled Participants By Role") firstrow clear
replace Gender = strtrim(Gender)
replace Roles  = subinstr(Roles, char(10), " and ", .) 
replace Gender = "Unknown" if Gender == "No Response"
replace Gender = "Unknown" if Gender == "Other"
replace Gender = "Unknown" if Gender == "Prefer not to disclose"
split Unit, parse(:) limit(2)
drop Unit
gen Unit = Unit2 if Unit2 != ""
replace Unit = Unit1 if Unit2 == ""
replace Unit = proper(Unit)
replace Unit = SubUnit if Unit == "Related Groups"
replace Unit = subinstr(Unit, "Claremont Institute for the Study of Statesmanship and Political Philosophy", "Claremont Institute", .)
replace Unit = subinstr(Unit, "Walter Bagehot Research Council on National Sovereignty", "Walter Bagehot Research Council", .)
replace Unit = subinstr(Unit, "International Churchill Society (The Churchill Centre)", "Churchill Centre", .)
replace Unit = trim(Unit)
replace Unit="African Politics" if Unit=="African Politics Conference Group"
replace Unit="Class & Inequality" if Unit=="Class And Inequality"
replace Unit="Comparative Politics Of Developing Countries" if Unit=="Comparative Politics In Developing Countries"
replace Unit="Elections, Public Opinion, And Voting Behavior" if Unit=="Elections And Voting Behavior"
replace Unit="Elections, Public Opinion, And Voting Behavior" if Unit=="Public Opinion"
replace Unit="Federalism And Intergovernmental Relations" if Unit=="Federalism & Intergovernmental Relations"
replace Unit="Health Politics And Health Policy" if  Unit=="Health Politics And Policy"
replace Unit="Qualitative Methods" if Unit=="Qualitative And Multi-Method Research"
replace Unit="Science, Technology And Environmental Politics" if Unit=="Science, Technology & Environmental Politics"
replace Unit="Women & Politics Research" if Unit=="Women And Politics Research"

save cleaned_data18.dta, replace 


preserve
drop if APSAStaff=="Y"
drop if SessionType=="Business Meeting"
collapse (count) DummyID, by(UniqueDummyID Gender RaceEthnicity YearofBirth)
rename DummyID appearances
gen female = 1 if Gender=="Female"
replace female = 0 if Gender=="Male"
graph bar (count) if Gender!="Unknown" & Gender!="No Code Assigned", over(appearances) over(Gender) title(2018) ylabel(, angle(0)) name(gender18, replace)
xi: nbreg appearances female i.RaceEthnicity i.YearofBirth
est store model2
estadd local hascontrols "Yes"
tab appearances female
restore

graph combine gender17 gender18, cols(1)

graph export participation_counts.eps, as(eps) replace
graph export participation_counts.png, as(png) replace


esttab model1 model2, keep(female) mtitles("2017" "2018") scalars("hascontrols Age/REP Controls") 

* process data on section membership from Jacob
import delimited "APSASections.csv", clear 
label var female "% Female (Section Membership)"
replace section="African Politics" if section=="African Politics Conference Group"
replace section="Class & Inequality" if section=="Class and Inequality"
replace section="Comparative Democratization" if section=="Compariative Democratization"
replace section="Comparative Politics" if section=="Comparitive Politics"
replace section="Elections, Public Opinion, And Voting Behavior" if section=="Elections, Public Opinion and Voting Behavior"
replace section="European Politics And Society" if section=="European Politics and Society"
replace section="Federalism And Intergovernmental Relations" if section=="Federalism & Intergovernmental Relations"
replace section="Foundations Of Political Theory" if section=="Foundations of Political Theory"
replace section="Health Politics And Health Policy" if section=="Health Politics and Policy"
replace section="Ideas, Knowledge And Politics" if section=="Ideas, Knowledge and Politics"
replace section="Information Technology And Politics" if section=="Information Technology and Politics"
replace section="International History And Politics" if section=="International History and Politics"
replace section="International Security And Arms Control" if section=="International Security and Arms Control"
replace section="Law And Courts" if section=="Law and Courts"
replace section="Migration And Citizenship" if section=="Migration and Citizenship"
replace section="Political Organizations And Parties" if section=="Political Organizations and Parties"
replace section="Politics And History" if section=="Politics and History"
replace section="Politics, Literature, And Film" if section=="Politics, Literature, and Film"
replace section="Presidents And Executive Politics" if section=="Presidents and Executive Politics"
replace section="Qualitative Methods" if section=="Qualitative and Multi-Method Research"
replace section="Race, Ethnicity And Politics" if section=="Race, Ethnicity and Politics"
replace section="Religion And Politics" if section=="Religion and Politics"
replace section="Representation And Electoral Systems" if section=="Representation and Electoral Systems"
replace section="Science, Technology And Environmental Politics" if section=="Science, Technology & Environmental Politics"
replace section="Sexuality And Politics" if section=="Sexuality and Politics"
replace section="State Politics And Policy" if section=="State Politics and Policy"
replace section="Urban And Local Politics" if section=="Urban and Local Politics"
replace section="Women & Politics Research" if section=="Women and Politics Research"
save section_membership.dta, replace




* percentage of participants who are women (2017)
use cleaned_data.dta, clear
preserve
gen panels17 = 1
collapse panels17, by(Unit EventTitle)
collapse (sum)  panels17, by(Unit)
save panels17.dta, replace
restore
keep if Gender=="Male" | Gender=="Female"
contract Unit Gender, freq(number_all17) zero
by Unit, sort: egen participants_all17 = sum(number_all17)
keep if Gender=="Female"
merge 1:1 Unit using panels17.dta, nogenerate
gen pctwomen_part17 = 100*number/participants
label var pctwomen_part17 "% Female (All Participants, 2017)"
label var number_all17 "No. Female (All Participants, 2017)"
label var participants_all17 "Total Participants, 2017"
label var panels17 "Total Panels, 2017"
erase panels17.dta
save allparticipants.dta, replace

* percentage of participants who are women (2018)
use cleaned_data18.dta, replace
preserve
gen panels18 = 1
collapse panels18, by(Unit EventTitle)
collapse (sum)  panels18, by(Unit)
save panels18.dta, replace
restore
keep if Gender=="Male" | Gender=="Female"
contract Unit Gender, freq(number_all18) zero
by Unit, sort: egen participants_all18 = sum(number_all18)
keep if Gender=="Female"
merge 1:1 Unit using panels18.dta, nogenerate
gen pctwomen_part18 = 100*number/participants
label var pctwomen_part18 "% Female (All Participants, 2018)"
label var number_all18 "No. Female (All Participants, 2018)"
label var participants_all18 "Total Participants, 2018"
label var panels18 "Total Panels, 2018"
erase panels18.dta
save allparticipants18.dta, replace

* all participants 2017/2018
merge 1:1 Unit using "allparticipants.dta", nogenerate
save allparticipants.dta, replace
erase allparticipants18.dta


* percentage of presenters and authors who are women (2017)
use cleaned_data.dta, clear
keep if Gender=="Male" | Gender=="Female"
keep if (Roles=="Author" | Roles=="Non-Presenting Co-Author" | Roles=="Presenter" | Roles=="Author and Non-Presenting Co-Author" | ///
	Roles=="Chair and Author" | /// 
	Roles=="Chair and Author and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Discussant and Author" | /// 
	Roles=="Chair and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Non-Presenting Co-Author and Author" | /// 
	Roles=="Chair and Presenter" | /// 
	Roles=="Chair and Presenter and Author" | /// 
	Roles=="Discussant and Author" | /// 
	Roles=="Discussant and Chair and Author" | /// 
	Roles=="Discussant and Non-Presenting Co-Author" | /// 
	Roles=="Discussant and Presenter" | /// 
	Roles=="Discussant and Presenter and Author" | /// 
	Roles=="Non-Presenting Co-Author and Author" | /// 
	Roles=="Presenter and Author" | /// 
	Roles=="Presenter and Chair" | /// 
	Roles=="Presenter and Chair and Author" | /// 
	Roles=="Presenter and Chair and Author and Non-Presenting Co-Author" | /// 
	Roles=="Presester and Discussant" | /// 
	Roles=="Presenter and Discussant and Author" | /// 
	Roles=="Presenter and Non-Presenting Co-Author" | /// 
	Roles=="Session Organizer and Author")
contract Unit Gender, freq(number_auth17) zero
by Unit, sort: egen participants_auth17 = sum(number)
keep if Gender=="Female"
gen pctwomen_auth17 = 100*number/participants
label var pctwomen_auth17 "% Female (Authors and Presenters, 2017)"
label var number_auth17 "No. Female (Authors and Presenters, 2017)"
label var participants_auth17 "Total Authors and Presenters, 2017"
save authorspresenters.dta, replace

* percentage of presenters and authors who are women (2018)
use cleaned_data18.dta, clear
keep if Gender=="Male" | Gender=="Female"
keep if (Roles=="Author" | Roles=="Non-Presenting Co-Author" | Roles=="Presenter" | Roles=="Author and Non-Presenting Co-Author" | ///
	Roles=="Chair and Author" | /// 
	Roles=="Chair and Author and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Discussant and Author" | /// 
	Roles=="Chair and Discussant and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Non-Presenting Co-Author and Author" | /// 
	Roles=="Chair and Presenter" | /// 
	Roles=="Chair and Presenter and Author" | /// 
	Roles=="Discussant and Author" | /// 
	Roles=="Discussant and Author and non-Presenting Co-Author" | /// 
	Roles=="Discussant and Chair and Author" | ///
	Roles=="Discussant and Chair and Non-Presenting Co-Author" | /// 
	Roles=="Discussant and Non-Presenting Co-Author" | /// 
	Roles=="Discussant and Presenter" | /// 
	Roles=="Discussant and Presenter and Author" | /// 
	Roles=="Non-Presenting Co-Author and Author" | /// 
	Roles=="Presenter and Author" | /// 
	Roles=="Presenter and Chair" | /// 
	Roles=="Presenter and Chair and Author" | /// 
	Roles=="Presenter and Chair and Author and Non-Presenting Co-Author" | /// 
	Roles=="Presester and Discussant" | /// 
	Roles=="Presenter and Discussant and Author" | /// 
	Roles=="Presenter and Non-Presenting Co-Author" | /// 
	Roles=="Session Organizer and Author")
contract Unit Gender, freq(number_auth18) zero
by Unit, sort: egen participants_auth18 = sum(number)
keep if Gender=="Female"
gen pctwomen_auth18 = 100*number/participants
label var pctwomen_auth18 "% Female (Authors and Presenters, 2018)"
label var number_auth18 "No. Female (Authors and Presenters, 2018)"
label var participants_auth18 "Total Authors and Presenters, 2018"
save authorspresenters18.dta, replace

* all authors/presenters 
merge 1:1 Unit using "authorspresenters.dta", nogenerate
save authorspresenters.dta, replace
erase authorspresenters18.dta


* merge into a single dataset
merge 1:1 Unit using allparticipants.dta, nogenerate
save bothroles.dta, replace


* merge with data on section membership 
generate  section = Unit
merge 1:1 section using section_membership.dta, nogenerate

* more cleaning

replace Unit = subinstr(Unit, "Conference Group", "Conf. Grp.", .)
replace Unit = subinstr(Unit, "And", "&", .)
replace Unit = subinstr(Unit, "Politics", "Pol.", .)
replace Unit = subinstr(Unit, "Political", "Pol.", .)
replace Unit = subinstr(Unit, "American", "Am.", .)
replace Unit = subinstr(Unit, "International", "Int.", .)
replace Unit = subinstr(Unit, "Comparative", "Comp.", .)
replace Unit = subinstr(Unit, "Public Policy", "Pub. Pol.", .)
replace Unit = subinstr(Unit, "Association", "Assn.", .)


drop if Unit=="Apsa Panels And All Meetings And Receptions"

gen diff18 = pctwomen_auth18 - female
label var diff18 "Difference between Female Author Participant Rate and Section Membership (2018)"

gen ratio_auth17 = pctwomen_auth17/female
label var ratio_auth17 "Author/Presenter Ratio (2017)"

gen ratio_auth18 = pctwomen_auth18/female
label var ratio_auth18 "Author/Presenter Ratio (2018)"

gen ratio_part17 = pctwomen_part17/female
label var ratio_part17 "All Participant Ratio (2017)"

gen ratio_part18 = pctwomen_part18/female
label var ratio_part18 "All Participant Ratio (2018)"


preserve
twoway (function y=x, range(0 110) lcolor(black)) (scatter pctwomen_auth17 female, msymbol(Oh) mcolor(black) legend(off) ///
	xtitle("% Female (Section Membership)") ytitle("% Female (APSA 2017 Authors and Presenters)"))  ///
	(scatter pctwomen_auth17 female if (pctwomen_auth17 < 25 | pctwomen_auth17 > 71), msymbol(none) mlabel(section))
graph export pctwomen_x_section17.eps, as(eps) replace
sort pctwomen_auth17
gen y = _n
twoway scatter y pctwomen_auth17, mlabel(Unit) msize(tiny) mcolor(black) mlabsize(tiny) msymbol(Oh) ///
	ysize(10) ylabel(none)  ytitle("") xscale(range(0 130)) xtitle("Percent Female Authors or Presenters")
graph export pctwomen17.eps, as(eps) replace
graph export pctwomen17.png, as(png) replace


keep if female!=.
egen meansection = mean(female), by(section)
egen ylab = axis(meansection female), label(section)
twoway (scatter ylab female , mcolor(black) msize(small) xline(37) msymbol(pipe) ///
	ysize(8) ytitle("") ylabel(1(1)44, labsize(vsmall) angle(horizontal) valuelabel) xscale(range(0 100)) xtitle("Percent Female")) ///
	(scatter ylab pctwomen_auth17, msymbol(Dh) msize(small))  ///
	(scatter ylab pctwomen_auth18, ///
	msize(small) msymbol(Oh)  title("Presenters & Authors") name(presenters, replace)  ///
	legend(order(1 "Section Membership" 2 "2017" 3 "2018" ) region(lwidth(none)) cols(1) size(small))) 
graph export womens_sections_v_apsa_authors.eps, as(eps) replace
graph export womens_sections_v_apsa_authors.png, as(png) replace


twoway (scatter ylab female , mcolor(black) msize(small) xline(37) msymbol(pipe) ///
	ysize(8) ytitle("") ylabel(1(1)44, labsize(vsmall) angle(horizontal) valuelabel) xscale(range(0 100)) xtitle("Percent Female")) ///
	(scatter ylab pctwomen_part17, msize(small) msymbol(Dh))  ///
	(scatter ylab pctwomen_part18, ///
	msize(small) msymbol(Oh) title("All Participants") name(all, replace) ///
	legend(order(1 "Section Membership" 2 "2017" 3 "2018" ) region(lwidth(none)) cols(1) size(small))) 
graph export womens_sections_v_apsa_all.eps, as(eps) replace
graph export womens_sections_v_apsa_all.png, as(png) replace

grc1leg presenters all, rows(1)
graph export womens_sections_v_apsa.eps, as(eps) replace
graph export womens_sections_v_apsa.png, as(png) replace


reg ratio_auth17 panels17
twoway (scatter panels17 ratio_auth17, msymbol(Oh) mcolor(black) legend(off) title("2017, Authors and Presenters") plotregion(lcolor(none))) ///
	(lfit panels17 ratio_auth17, lcolor(black)) ///
	(scatter panels17 ratio_auth17 if ratio_auth17<.8,  msymbol(O)  mlabel(Unit) mlabposition(12) name(ratio_auth17, replace)) 
twoway (scatter panels18 ratio_auth18, msymbol(Oh) mcolor(black) legend(off) title("2018, Authors and Presenters") plotregion(lcolor(none))) ///
	(lfit panels18 ratio_auth18, lcolor(black)) ///
	(scatter panels18 ratio_auth18 if ratio_auth18<.8,  msymbol(O)  mlabel(Unit) mlabposition(12) name(ratio_auth18, replace))
graph play 2018partcall.grec
twoway (scatter panels17 ratio_part17, msymbol(Oh) mcolor(black) legend(off) title("2017, All Participants") plotregion(lcolor(none))) ///
	(lfit panels17 ratio_part17, lcolor(black)) ///
	(scatter panels17 ratio_part17 if ratio_part17<.8,  msymbol(O)  mlabel(Unit) mlabposition(12) name(ratio_part17, replace)) 
twoway (scatter panels18 ratio_part18, msymbol(Oh) mcolor(black) legend(off) title("2018,  All Participants") plotregion(lcolor(none))) ///
	(lfit panels18 ratio_part18, lcolor(black)) ///
	(scatter panels18 ratio_part18 if ratio_part18<.8,  msymbol(O) mlabel(Unit) mlabposition(12) name(ratio_part18, replace))
graph play 2018partcall.grec
graph combine ratio_part17 ratio_auth17 ratio_part18 ratio_auth18  , title(Ratio of Female Participants to Female Section Members) iscale(*.9)
graph export callout.eps, as(eps) replace
graph export callout.png, as(png) replace
restore



*********************
* women in discussant and chair role
**********************
* percentage of presenters and authors who are women (2017)
use cleaned_data.dta, clear
keep if Gender=="Male" | Gender=="Female"

gen RoleSimple = "Author or Presenter Plus"
replace RoleSimple = "Non-Presenting Co-Author" if Roles == "Non-Presenting Co-Author"
replace RoleSimple = "Author or Presenter" if Roles == "Author" | Roles == "Presenter"
replace RoleSimple = "Chair" if Roles == "Chair"
replace RoleSimple = "Discussant" if Roles == "Discussant" | Roles == "Chair and Discussant" | Roles == "Discussant and Chair"
drop if Roles == "Session Organizer"

tab RoleSimple Gender, row

keep if Gender == "Female"
keep RoleSimple EventTitle
egen N_women = count(RoleSimple), by (EventTitle)
keep if N_women == 1
save what_women_do.dta, replace

* percentage of presenters and authors who are women (2017)
use cleaned_data18.dta, clear
keep if Gender=="Male" | Gender=="Female"

gen RoleSimple = "Author or Presenter Plus"
replace RoleSimple = "Non-Presenting Co-Author" if Roles == "Non-Presenting Co-Author"
replace RoleSimple = "Author or Presenter" if Roles == "Author" | Roles == "Presenter"
replace RoleSimple = "Chair" if Roles == "Chair"
replace RoleSimple = "Discussant" if Roles == "Discussant" | Roles == "Chair and Discussant" | Roles == "Discussant and Chair"
drop if Roles == "Session Organizer"

tab RoleSimple Gender, row

keep if Gender == "Female"
keep RoleSimple EventTitle
egen N_women = count(RoleSimple), by (EventTitle)
keep if N_women == 1
save what_women_do18.dta, replace



**********************
* manels by divisions
**********************

* gender of division chairs
import excel "division chair list.xlsx", sheet("email duties") cellrange(A1:E56) firstrow clear
gen chair_female = (Female1 == "Yes" | Female2 == "Yes")
gen chair_allfemale = (Female1 == "Yes" & Female2 != "No")
rename Division Unit
replace Unit = proper(Unit)

replace Unit="African Politics" if Unit=="African Politics Conference Group"
replace Unit="Class & Inequality" if Unit=="Class And Inequality"
replace Unit="Comparative Politics Of Developing Countries" if Unit=="Comparative Politics In Developing Countries"
replace Unit="Elections, Public Opinion, And Voting Behavior" if Unit=="Elections And Voting Behavior"
replace Unit="Elections, Public Opinion, And Voting Behavior" if Unit=="Public Opinion"
replace Unit="Elections, Public Opinion, And Voting Behavior" if Unit=="Elections, Public Opinion And Voting "
replace Unit="Political Thought and Philosophy" if Unit=="Political Thought and Philosophy:"
replace Unit="Politics, Literature, And Film" if Unit=="Politics, Literature And Film"
replace Unit="Federalism And Intergovernmental Relations" if Unit=="Federalism & Intergovernmental Relations"
replace Unit="Health Politics And Health Policy" if  Unit=="Health Politics And Policy"
replace Unit="Qualitative Methods" if Unit=="Qualitative And Multi-Method Research"
replace Unit="Science, Technology And Environmental Politics" if Unit=="Science, Technology And Environmental"
replace Unit="Women & Politics Research" if Unit=="Women And Politics Research"

generate section = Unit
merge 1:1 section using "section_membership.dta", nogenerate
save division_chairs2017.dta, replace



use cleaned_data.dta, clear

* first a crosswalk of panel names to divisions
* also clean up the division names
preserve
gen x = _n
collapse x, by(EventTitle Unit)
drop x
save xwalk.dta, replace
restore

* now gender breakdown by panel
* all participants
contract EventTitle Gender, freq(number) zero
by EventTitle, sort: egen total_part = sum(number)
merge m:1 EventTitle using xwalk.dta // label each panel by its division
keep if Gender == "Female"
gen p_women = number / total_part
rename number number_women


* visualize the distribution of women's representation by division
hist p_women, name(manels_dist_part2017, replace) ///
	freq xtitle("Proportion Women") title("All Participants") 

	
* tabulate the roles of women in "1 woman" panels
preserve
keep if number_women==1
drop if total_part==1
merge 1:1 EventTitle using what_women_do.dta, generate(_merge2)
tab RoleSimple
tabout RoleSimple using table2.csv, replace cells(col freq)
restore

	
* now generate a unit-specific "manel rate"
gen is_manel = (1-ceil(p_women))
contract Unit is_manel, zero freq(no_manels)
by Unit, sort: egen no_panels = total(no_manels)
gen p_manels = 100*no_manels / no_panels
drop if is_manel == 0
drop is_manel
drop if Unit=="Apsa Panels And All Meetings And Receptions"
rename no_manels no_manels_part2017
rename p_manels p_manels_part2017
save allpart2017.dta, replace


* now gender breakdown by panel
* only authors and presenters
use cleaned_data.dta, clear
keep if (Roles=="Author" | Roles=="Non-Presenting Co-Author" | Roles=="Presenter" | Roles=="Author and Non-Presenting Co-Author" | ///
	Roles=="Chair and Author" | /// 
	Roles=="Chair and Author and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Discussant and Author" | /// 
	Roles=="Chair and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Non-Presenting Co-Author and Author" | /// 
	Roles=="Chair and Presenter" | /// 
	Roles=="Chair and Presenter and Author" | /// 
	Roles=="Discussant and Author" | /// 
	Roles=="Discussant and Chair and Author" | /// 
	Roles=="Discussant and Non-Presenting Co-Author" | /// 
	Roles=="Discussant and Presenter" | /// 
	Roles=="Discussant and Presenter and Author" | /// 
	Roles=="Non-Presenting Co-Author and Author" | /// 
	Roles=="Presenter and Author" | /// 
	Roles=="Presenter and Chair" | /// 
	Roles=="Presenter and Chair and Author" | /// 
	Roles=="Presenter and Chair and Author and Non-Presenting Co-Author" | /// 
	Roles=="Presester and Discussant" | /// 
	Roles=="Presenter and Discussant and Author" | /// 
	Roles=="Presenter and Non-Presenting Co-Author" | /// 
	Roles=="Session Organizer and Author")
contract EventTitle Gender, freq(number) zero
by EventTitle, sort: egen total_part = sum(number)
merge m:1 EventTitle using xwalk.dta // label each panel by its division
keep if Gender == "Female"
gen p_women = number / total_part
rename number number_women


* visualize the distribution of women's representation by division
hist p_women, name(manels_dist_auth2017, replace) ///
	freq xtitle("Proportion Women") title("Authors and Presenters") 

	
* now generate a unit-specific "manel rate"
gen is_manel = (1-ceil(p_women))
contract Unit is_manel, zero freq(no_manels)
by Unit, sort: egen no_panels = total(no_manels)
gen p_manels = 100*no_manels / no_panels
drop if is_manel == 0
drop is_manel
drop if Unit=="Apsa Panels And All Meetings And Receptions"
rename no_manels no_manels_auth2017
rename p_manels p_manels_auth2017
save auth2017.dta, replace

merge 1:1 Unit using allpart2017.dta
drop _merge
merge 1:1 Unit using division_chairs2017.dta

* test some mf-ing hypotheses!
reg p_manels_auth2017 chair_female, r
eststo m1
reg p_manels_auth2017 chair_female no_panels, r
eststo m2
reg p_manels_auth2017 chair_female no_panels female, r
eststo m3
reg p_manels_auth2017 chair_female no_panels female if Unit!="Women & Politics Research" & Unit!="Sexuality And Politics", r
eststo m4

reg p_manels_part2017 chair_female, r
eststo m5
reg p_manels_part2017 chair_female no_panels, r
eststo m6
reg p_manels_part2017 chair_female no_panels female, r
eststo m7
reg p_manels_part2017 chair_female no_panels female if Unit!="Women & Politics Research" & Unit!="Sexuality And Politics", r
eststo m8

* save the results
esttab using table1.csv, label nogaps b(2) t(2) star(* 0.1 ** 0.05) replace csv 

*  just in case: fractional logistic regression. Makes no substantive difference but is hard to interpret
gen pct_manels_auth2017 = p_manels_auth2017/100
fracreg logit pct_manels_auth2017 chair_female, vce(robust)
eststo m1
fracreg logit pct_manels_auth2017 chair_female no_panels, vce(robust)
eststo m2
fracreg logit pct_manels_auth2017 chair_female no_panels female, vce(robust)
eststo m3
fracreg logit pct_manels_auth2017 chair_female no_panels female if Unit!="Women & Politics Research" & Unit!="Sexuality And Politics", vce(robust)
eststo m4
esttab m1 m2 m3 m4

* save the results
esttab m1 m2 m3 m4 using table1_fracreg.csv, label nogaps b(2) t(2) star(* 0.1 ** 0.05) replace csv 


replace Unit = subinstr(Unit, "Conference Group", "Conf. Grp.", .)
replace Unit = subinstr(Unit, "And", "&", .)
replace Unit = subinstr(Unit, "Politics", "Pol.", .)
replace Unit = subinstr(Unit, "Political", "Pol.", .)
replace Unit = subinstr(Unit, "American", "Am.", .)
replace Unit = subinstr(Unit, "International", "Int.", .)
replace Unit = subinstr(Unit, "Comparative", "Comp.", .)
replace Unit = subinstr(Unit, "Public Policy", "Pub. Pol.", .)
replace Unit = subinstr(Unit, "Association", "Assn.", .)

* and now a plot
* some people who do not specify their gender may be women
twoway (scatter p_manels_auth2017 no_panels, jitter(1) jitterseed(123) ///
	msymbol(Oh) mcolor(black) name(auth2017, replace) plotregion(lcolor(none)) ///
	ytitle(Percent Manels) xtitle(Number of Panels) title("2017, Authors and Presenters") legend(off)) ///
	(scatter p_manels_auth2017 no_panels if p_manels_auth2017>20 & no_panels > 2, mlabel(Unit) msymbol(none) mlabcolor(black))
graph play auth2017.grec

twoway (scatter p_manels_part2017 no_panels, jitter(1) jitterseed(123) ///
	msymbol(Oh) mcolor(black) name(part2017, replace) plotregion(lcolor(none)) ///
	ytitle(Percent Manels) xtitle(Number of Panels) title("2017, All Participants") legend(off)) ///
	(scatter p_manels_part2017 no_panels if p_manels_part2017>20 & no_panels > 2, mlabel(Unit) msymbol(none) mlabcolor(black))



use cleaned_data18.dta, clear

* first a crosswalk of panel names to divisions
* also clean up the division names
preserve
gen x = _n
collapse x, by(EventTitle Unit)
drop x
save xwalk.dta, replace
restore

* now gender breakdown by panel
* all participants
contract EventTitle Gender, freq(number) zero
by EventTitle, sort: egen total_part = sum(number)
merge m:1 EventTitle using xwalk.dta // label each panel by its division
keep if Gender == "Female"
gen p_women = number / total_part
rename number number_women


* visualize the distribution of women's representation by division
hist p_women, name(manels_dist_part2018, replace) ///
	freq xtitle("Proportion Women") title("All Participants") 

* tabulate the roles of women in "1 woman" panels
preserve
keep if number_women==1
drop if total_part==1
merge 1:1 EventTitle using what_women_do18.dta, generate(_merge2)
tab RoleSimple
tabout RoleSimple using table2.csv, append cells(col freq)
restore

* now generate a unit-specific "manel rate"
gen is_manel = (1-ceil(p_women))
contract Unit is_manel, zero freq(no_manels)
by Unit, sort: egen no_panels = total(no_manels)
gen p_manels = 100*no_manels / no_panels
drop if is_manel == 0
drop is_manel
drop if Unit=="Apsa Panels And All Meetings And Receptions"
rename no_manels no_manels_part2018
rename p_manels p_manels_part2018
save allpart2018.dta, replace


* now gender breakdown by panel
* only authors and presenters
use cleaned_data18.dta, clear
keep if (Roles=="Author" | Roles=="Non-Presenting Co-Author" | Roles=="Presenter" | Roles=="Author and Non-Presenting Co-Author" | ///
	Roles=="Chair and Author" | /// 
	Roles=="Chair and Author and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Discussant and Author" | /// 
	Roles=="Chair and Discussant and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Non-Presenting Co-Author" | /// 
	Roles=="Chair and Non-Presenting Co-Author and Author" | /// 
	Roles=="Chair and Presenter" | /// 
	Roles=="Chair and Presenter and Author" | /// 
	Roles=="Discussant and Author" | /// 
	Roles=="Discussant and Author and non-Presenting Co-Author" | /// 
	Roles=="Discussant and Chair and Author" | ///
	Roles=="Discussant and Chair and Non-Presenting Co-Author" | /// 
	Roles=="Discussant and Non-Presenting Co-Author" | /// 
	Roles=="Discussant and Presenter" | /// 
	Roles=="Discussant and Presenter and Author" | /// 
	Roles=="Non-Presenting Co-Author and Author" | /// 
	Roles=="Presenter and Author" | /// 
	Roles=="Presenter and Chair" | /// 
	Roles=="Presenter and Chair and Author" | /// 
	Roles=="Presenter and Chair and Author and Non-Presenting Co-Author" | /// 
	Roles=="Presester and Discussant" | /// 
	Roles=="Presenter and Discussant and Author" | /// 
	Roles=="Presenter and Non-Presenting Co-Author" | /// 
	Roles=="Session Organizer and Author")
contract EventTitle Gender, freq(number) zero
by EventTitle, sort: egen total_part = sum(number)
merge m:1 EventTitle using xwalk.dta // label each panel by its division
keep if Gender == "Female"
gen p_women = number / total_part
rename number number_women


* visualize the distribution of women's representation by division
hist p_women, name(manels_dist_auth2018, replace) ///
	freq xtitle("Proportion Women") title("Authors and Presenters") 

* now generate a unit-specific "manel rate"
gen is_manel = (1-ceil(p_women))
contract Unit is_manel, zero freq(no_manels)
by Unit, sort: egen no_panels = total(no_manels)
gen p_manels = 100*no_manels / no_panels
drop if is_manel == 0
drop is_manel
drop if Unit=="Apsa Panels And All Meetings And Receptions"
rename no_manels no_manels_auth2018
rename p_manels p_manels_auth2018
save auth2018.dta, replace

merge 1:1 Unit using allpart2018.dta


replace Unit = subinstr(Unit, "Conference Group", "Conf. Grp.", .)
replace Unit = subinstr(Unit, "And", "&", .)
replace Unit = subinstr(Unit, "Politics", "Pol.", .)
replace Unit = subinstr(Unit, "Political", "Pol.", .)
replace Unit = subinstr(Unit, "American", "Am.", .)
replace Unit = subinstr(Unit, "International", "Int.", .)
replace Unit = subinstr(Unit, "Comparative", "Comp.", .)
replace Unit = subinstr(Unit, "Public Policy", "Pub. Pol.", .)
replace Unit = subinstr(Unit, "Association", "Assn.", .)

* and now a plot
* some people who do not specify their gender may be women
twoway (scatter p_manels_auth2018 no_panels, jitter(1) jitterseed(123) ///
	msymbol(Oh) mcolor(black) name(auth2018, replace) plotregion(lcolor(none)) ///
	ytitle(Percent Manels) xtitle(Number of Panels) title("2018, Authors and Presenters") legend(off)) ///
	(scatter p_manels_auth2018 no_panels if p_manels_auth2018>20 & no_panels > 2, mlabel(Unit) msymbol(none) mlabcolor(black))
graph play auth2018.grec

twoway (scatter p_manels_part2018 no_panels, jitter(1) jitterseed(123) ///
	msymbol(Oh) mcolor(black) name(part2018, replace) plotregion(lcolor(none)) ///
	ytitle(Percent Manels) xtitle(Number of Panels) title("2018, All Participants") legend(off)) ///
	(scatter p_manels_part2018 no_panels if p_manels_part2018>20 & no_panels > 2, mlabel(Unit) msymbol(none) mlabcolor(black))
graph play part2018.grec

	
graph combine part2017 auth2017 part2018 auth2018, iscale(*.7)
graph export manels.eps, as(eps) replace
graph export manels.png, as(png) replace

	
	
	

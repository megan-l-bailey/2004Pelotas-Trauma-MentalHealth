************************************************************
*   Associations between childhood trauma and adolescent   *
*   psychiatric disorders in the 2004 Pelotas Birth Cohort *
************************************************************

//AUTHOR: Megan Bailey (mlb51@bath.ac.uk)
//about
Stata/BE 17.0 for Mac (Intel 64-bit)
Revision 21 May 2024
Copyright 1985-2021 StataCorp LLC

Stata license: 100-student lab perpetual
Serial number: 301706312444
  Licensed to: Megan Bailey
               University of Bath		

***********************
* VARIABLE DICTIONARY *
***********************

****** ID NUMBER ******
* idnum: unique identifier

****** EXPOSURES ******
* y6_alltrauma: exposure to any trauma up to age 6
* y6_cte: cumulative trauma load up to age 6
// trauma exposure up to ages 11 (y11_), 15 (y15_), and 18 (y18_) as above - dif prefix (these all consider prior reports from earlier follow-ups)
* p15_cte: parent-reports of child cumualtive trauma at age 15 follow-up only (used in sensitivity analysis)
* a15_cte: adolescent self-reports of cumulative trauma  at age 15 follow-up only (used in sensitivity analysis)

****** OUTCOMES ******
* y6_anydis: met criteria for any psychiatric disorder at age 6
* y6_anyanx: met criteria for any anxiety disorder at age 6
* y6_anydep: met criteria for any mood disorder at age 6
* y6_anyadhd: met criteria for any attention/hyperactivity disorder at age 6
* y6_anycd: met criteria for any conduct/oppositional disorder at age 6
// psychiatric disorders at ages 11 (y11_), 15 (y15_), and 18 (y18_) as above - dif prefix
* y18_sdqtotal: dichotomised SDQ total difficulties score (used in sensitivity analysis)
* y18_sdqemotion: dichotomised SDQ emotion problems score (used in sensitivity analysis)
* y18_sdqconduct: dichotomised SDQ conduct problems score (used in sensitivity analysis)
* y18_sdqhyper: dichotomised SDQ hyperactivity score (used in sensitivity analysis)

****** CONFOUNDERS ******
* sex: sex (binary)
* mmarital: maternal marital status (binary)
* methnicity: maternal ethnicity (binary)
* malcohol: maternal alcohol consumption during pregnancy (binary)
* msmoking: maternal smoking during pregnancy (binary)
* meduc: maternal education years at birth (continuous)
* mdep12: maternal depression at 12-months postpartum (continuous)
* fincome: monthly family income at birth (continuous)
* tcbcl48: CBCL total score at 4 year follow-up (continuous)

****** AUXILIARY VARIABLES ******
* tctspc6: Conflict & Tactic Scale (parent-report) score at age 6 (auxiliary variable)
* tctspc11: Conflict & Tactic Scale (parent-report) score at age 11 (auxiliary variable)
* tctspc15: Conflict & Tactic Scale (parent-report) score at age 15 (auxiliary variable)
* birthweight: child birthweight (auxiliary variable)

****** COMPLETE CASE TRACKING ******
* y15_complete: complete data for psychiatric disorders and trauma exposures
* y15_compcon: complete data from psychiatric disorders, trauma exposures, and all confounders
* y15_missing: opposite of y15_complete (0=complete, 1=missing)
* same variables for age 18 (y18_) - dif prefix 

**************************
* COMPLETE-CASE ANALYSES *
**************************

* SUPPLEMENTARY TABLE 1 - FREQUENCIES OF TRAUMA TYPES UP TO AGES 15 AND 18 YEARS *

generate y15_sexabuse=.
replace y15_sexabuse=1 if y15_sexualabuse==1 | y15_rape==1
replace y15_sexabuse=0 if y15_sexualabuse==0 & y15_rape==0

//AGE 15 - PARENT REPORTS(restrict to individuals with complete data for for diagnoses and trauma exposure at 15y)
tab p15_alltrauma if y15_complete==1
tab p15_accident if y15_complete==1
tab p15_fire if y15_complete==1
tab p15_disaster if y15_complete==1
tab p15_attack if y15_complete==1
tab p15_physabuse if y15_complete==1
tab p15_sexabuse if y15_complete==1
tab p15_witdviol if y15_complete==1
tab p15_witattack if y15_complete==1
tab p15_witaccident if y15_complete==1
tab p15_other if y15_complete==1

//AGE 15 - ADOLESCENT REPORTS(restrict to individuals with complete data for for diagnoses and trauma exposure at 15y)
tab a15_alltrauma if y15_complete==1
tab a15_robbed if y15_complete==1
tab a15_attack if y15_complete==1
tab a15_attack2 if y15_complete==1
tab a15_gangattack if y15_complete==1
tab a15_physabuse if y15_complete==1
tab a15_sexabuse if y15_complete==1
tab a15_witdviol if y15_complete==1
tab a15_accident if y15_complete==1
tab a15_parentdeath if y15_complete==1

//AGE 18 (restrict to individuals with complete data for for diagnoses and trauma exposure at 18y)
tab y18_alltrauma if y18_complete==1
tab y18_mini_anytrauma if y18_complete==1
tab y18_robbed if y18_complete==1
tab y18_physabuse if y18_complete==1
tab y18_sexabuse if y18_complete==1
tab y18_witdviol if y18_complete==1
tab y18_accident if y18_complete==1
tab y18_parentdeath if y18_complete==1

***************************************************

* CTE: LIKELIHOOD RATIO TEST *
* SUPPLEMENTARY TABLE 4 - RESULTS OF THE LIKELIHOOD-RATIO TESTS CONDUCTED TO COMPARE MODELS THAT TREATED CUMULATIVE TRAUMA AS A NUMERICAL EXPOSURE VERSUS A CATEGORICAL EXPOSURE * 

//checking to see whether there is statistical evidence that cumulative trauma has a linear relationship with disorders in the complete case data
//if test is significant, it suggests the 2 models differ and the exposure should be treated categorically (rather than continuously)

//age 15: cross-sectional
logistic y15_anydis y15_cte if y15_compcon==1
est store a
logistic y15_anydis i.y15_cte if y15_compcon==1
est store b
lrtest a b

logistic y15_anyanx y15_cte if y15_compcon==1
est store a
logistic y15_anyanx i.y15_cte if y15_compcon==1
est store b
lrtest a b 

logistic y15_anydep y15_cte if y15_compcon==1
est store a
logistic y15_anydep i.y15_cte if y15_compcon==1
est store b
lrtest a b 

logistic y15_anyadhd y15_cte if y15_compcon==1
est store a
logistic y15_anyadhd i.y15_cte if y15_compcon==1
est store b
lrtest a b 

logistic y15_anycd y15_cte if y15_compcon==1
est store a
logistic y15_anycd i.y15_cte if y15_compcon==1
est store b
lrtest a b 

//age 18: cross-sectional
logistic y18_anydis y18_cte if y18_compcon==1
est store a
logistic y18_anydis i.y18_cte if y18_compcon==1
est store b
lrtest a b

logistic y18_anyanx y18_cte if y18_compcon==1
est store a
logistic y18_anyanx i.y18_cte if y18_compcon==1
est store b
lrtest a b 

logistic y18_anydep y18_cte if y18_compcon==1
est store a
logistic y18_anydep i.y18_cte if y18_compcon==1
est store b
lrtest a b 

logistic y18_anyadhd y18_cte if y18_compcon==1
est store a
logistic y18_anyadhd i.y18_cte if y18_compcon==1
est store b
lrtest a b 

logistic y18_anycd y18_cte if y18_compcon==1
est store a
logistic y18_anycd i.y18_cte if y18_compcon==1
est store b
lrtest a b 

//age 11 & 15: longitudinal
logistic y15_anydis y11_cte if y15_compcon==1 & y11_compcon==1
est store a
logistic y15_anydis i.y11_cte if y15_compcon==1 & y11_compcon==1
est store b
lrtest a b

logistic y15_anyanx y11_cte if y15_compcon==1 & y11_compcon==1
est store a
logistic y15_anyanx i.y11_cte if y15_compcon==1 & y11_compcon==1
est store b
lrtest a b 

logistic y15_anydep y11_cte if y15_compcon==1 & y11_compcon==1
est store a
logistic y15_anydep i.y11_cte if y15_compcon==1 & y11_compcon==1
est store b
lrtest a b 

logistic y15_anyadhd y11_cte if y15_compcon==1 & y11_compcon==1
est store a
logistic y15_anyadhd i.y11_cte if y15_compcon==1 & y11_compcon==1
est store b
lrtest a b 

logistic y15_anycd y11_cte if y15_compcon==1 & y11_compcon==1
est store a
logistic y15_anycd i.y11_cte if y15_compcon==1 & y11_compcon==1
est store b
lrtest a b 

//age 11 & 18: longitudinal
logistic y18_anydis y11_cte if y18_compcon==1 & y11_compcon==1
est store a
logistic y18_anydis i.y11_cte if y18_compcon==1 & y11_compcon==1
est store b
lrtest a b

logistic y18_anyanx y11_cte if y18_compcon==1 & y11_compcon==1
est store a
logistic y18_anyanx i.y11_cte if y18_compcon==1 & y11_compcon==1
est store b
lrtest a b 

logistic y18_anydep y11_cte if y18_compcon==1 & y11_compcon==1
est store a
logistic y18_anydep i.y11_cte if y18_compcon==1 & y11_compcon==1
est store b
lrtest a b 

logistic y18_anyadhd y11_cte if y18_compcon==1 & y11_compcon==1
est store a
logistic y18_anyadhd i.y11_cte if y18_compcon==1 & y11_compcon==1
est store b
lrtest a b 

logistic y18_anycd y11_cte if y18_compcon==1 & y11_compcon==1
est store a
logistic y18_anycd i.y11_cte if y18_compcon==1 & y11_compcon==1
est store b
lrtest a b 

//age 15 & 18: longitudinal
logistic y18_anydis y15_cte if y18_compcon==1 & y15_compcon==1
est store a
logistic y18_anydis i.y15_cte if y18_compcon==1 & y15_compcon==1
est store b
lrtest a b

logistic y18_anyanx y15_cte if y18_compcon==1 & y15_compcon==1
est store a
logistic y18_anyanx i.y15_cte if y18_compcon==1 & y15_compcon==1
est store b
lrtest a b 

logistic y18_anydep y15_cte if y18_compcon==1 & y15_compcon==1
est store a
logistic y18_anydep i.y15_cte if y18_compcon==1 & y15_compcon==1
est store b
lrtest a b 

logistic y18_anyadhd y15_cte if y18_compcon==1 & y15_compcon==1
est store a
logistic y18_anyadhd i.y15_cte if y18_compcon==1 & y15_compcon==1
est store b
lrtest a b 

logistic y18_anycd y15_cte if y18_compcon==1 & y15_compcon==1
est store a
logistic y18_anycd i.y15_cte if y18_compcon==1 & y15_compcon==1
est store b
lrtest a b 

* PLOTS *
//use the tabodds command to examine whether the effect of exposure (cumulative trauma) on the log odds of the outcome (e.g., psychiatric disorder) may be linear:
tabodds y15_anyadhd y15_cte, graph yscale(log) 

//add the predicted odds from a logistic model that assumes a linear relationship
logistic y15_anyadhd y15_cte 
predict logodds_linear, xb 
gen odds_linear = exp(logodds_linear) 
tabodds y15_anyadhd y15_cte, graph yscale(log) addplot(connected odds_linear y15_cte) 

//the tabodds plot may suggest a nonlinear pattern however without confidence limits around the observed odds we have no idea whether this indicates a striking departure from linearity or just a very subtle pattern - add confidence intervals around the observed odds
tabodds y15_anyadhd y15_cte, ciplot yscale(log) addplot(connected odds_linear y15_cte) 
 
//y18_anydis
tabodds y18_anydis y18_cte, graph yscale(log) 
logistic y18_anydis y18_cte 
predict logodds_linear, xb 
gen odds_linear = exp(logodds_linear) 
tabodds y18_anydis y18_cte, graph yscale(log) addplot(connected odds_linear y18_cte) 
tabodds y18_anydis y18_cte, ciplot yscale(log) addplot(connected odds_linear y18_cte) 

//y18_anyanx
tabodds y18_anyanx y18_cte, graph yscale(log) 
logistic y18_anyanx y18_cte 
predict logodds_linear, xb 
gen odds_linear = exp(logodds_linear) 
tabodds y18_anyanx y18_cte, graph yscale(log) addplot(connected odds_linear y18_cte) 
tabodds y18_anyanx y18_cte, ciplot yscale(log) addplot(connected odds_linear y18_cte) 

//final decision: used the CTE variables continuously - such that ORs correspond to a one category increase in cumulative trauma

***************************************************

* SUPPLEMENTARY TABLE 12 - CROSS-SECTIONAL ASSOCIATIONS BETWEEN CUMULATIVE TRAUMA LOAD UP TO AGES 15 AND 18 YEARS AND PSYCHIATRIC DUSORDERS AT AGES 15 AND 18 YEARS, RESPECTIVELY *

* AGE 15 *
//unadjusted
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	logistic `var' y15_cte if y15_compcon==1
}

//adjusted (confounders)
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	logistic `var' y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if y15_compcon==1
}

//adjusted (confounders and CBCL)
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	logistic `var' y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y15_compcon==1
}

* AGE 18 *
//unadjusted
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y18_cte if y18_compcon==1
}

//adjusted (confounders)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if y18_compcon==1
}

//adjusted (confounders and CBCL)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1
}
	
***************************************************

* SUPPLEMENTARY TABLE 13 - LONGITUDINAL ASSOCIATIONS BETWEEN CUMULATIVE TRAUMA UP TO AGES 11 AND 15 YEARS AND PSYCHIATRIC DISORDERS AT 15 AND 18 YEARS *

* AGE 11 CTE & AGE 15 DISORDERS *
//unadjusted
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	logistic `var' y11_cte if y11_compcon==1 & y15_compcon==1
}

//adjusted (confounders)
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	logistic `var' y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if y11_compcon==1 & y15_compcon==1
}

//adjusted (confounders and CBCL)
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	logistic `var' y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y11_compcon==1 & y15_compcon==1
}

* AGE 11 CTE & AGE 18 DISORDERS *
//unadjusted
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y11_cte if y11_compcon==1 & y18_compcon==1
}

//adjusted (confounders)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if y11_compcon==1 & y18_compcon==1
}

//adjusted (confounders and CBCL)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y11_compcon==1 & y18_compcon==1
}

* AGE 15 CTE & AGE 18 DISORDERS *
//unadjusted
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y15_cte if y15_compcon==1 & y18_compcon==1
}

//adjusted (confounders)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if y15_compcon==1 & y18_compcon==1
}

//adjusted (confounders and CBCL)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y15_compcon==1 & y18_compcon==1
}

***************************************************

//complete cases for the sensitivity analyses
generate sen_complete=0
replace sen_complete=1 if a15_cte!=. & p15_cte!=. & y18_anydis!=. & y18_anyanx!=. & y18_anydep!=. & y18_anyadhd!=. & y18_anycd!=. & y18_sdqtotal!=. & y18_sdqemotion!=. & y18_sdqconduct!=. & y18_sdqhyper!=. & sex!=. & msmoking!=. & mmarital!=. & malcohol!=. & methnicity!=. & meduc!=. & mdep12!=. & fincome!=. & tcbcl48!=.

* SUPPLEMENTARY TABLE 14 - LONGITUDINAL ASSOCIATIONS BETWEEN ADOLESCENT AND PARENT REPORTS OF CUMULATIVE TRAUMA UP TO AGE 15 AND ADOLESCENT REPORTS OF PSYCHIATRIC DISORDERS AT AGE 18 *

//adolescent - adolescent
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' a15_cte if sen_complete==1
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if sen_complete==1
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if sen_complete==1
}

//parent - adolescent
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' p15_cte if sen_complete==1
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if sen_complete==1
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if sen_complete==1
}

***************************************************

* SUPPLEMENTARY TABLE 15 - LONGITUDINAL ASSOCIATIONS BETWEEN ADOLESCENT AND PARENT REPORTS OF CUMULATIVE TRAUMA UP TO AGE 15 AND PARENT REPORTS OF ADOLESCENT PSYCHIATRIC DISORDERS AT AGE 18 *

//parent - parent
foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	logistic `var' p15_cte if sen_complete==1
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if sen_complete==1
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if sen_complete==1
}

//adolescent - parent
foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	logistic `var' a15_cte if sen_complete==1
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if sen_complete==1
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if sen_complete==1
}

***************************************************

* COMPLETE CASE - POPULATION ATTRIBUTABLE FRACTIONS *

//any disorder
glm y18_anydis y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1, family(poisson) link(log) nolog vce(robust)
local beta = _b[y18_alltrauma]
disp `beta'
local se = _se[y18_alltrauma]
disp `se'
bysort y18_anydis: egen denom = count(idnum)
bysort y18_anydis: egen num2 = count(idnum) if y18_alltrauma==1
bysort y18_anydis: egen num = min(num2)
gen prop = num/denom
bysort y18_anydis: egen seq = seq()
sum prop if seq == 1 & y18_anydis==1
local pc = r(mean)
disp `pc'
drop denom num num2 prop seq
local rr=2.718^(`beta')
disp `rr'
local lci=2.718^(`beta'-1.96*`se')
disp `lci'
local uci=2.718^(`beta'+1.96*`se')
disp `uci'
local paf=`pc'*(1-(1/`rr'))
disp `paf'
local lpaf=`pc'*(1-(1/`lci'))
disp `lpaf'
local upaf=`pc'*(1-(1/`uci'))
disp `upaf'
disp `lpaf' `paf' `upaf' 

//any anxiety disorder
glm y18_anyanx y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1, family(poisson) link(log) nolog vce(robust)
local beta = _b[y18_alltrauma]
disp `beta'
local se = _se[y18_alltrauma]
disp `se'
bysort y18_anyanx: egen denom = count(idnum)
bysort y18_anyanx: egen num2 = count(idnum) if y18_alltrauma==1
bysort y18_anyanx: egen num = min(num2)
gen prop = num/denom
bysort y18_anyanx: egen seq = seq()
sum prop if seq == 1 & y18_anyanx==1
local pc = r(mean)
disp `pc'
drop denom num num2 prop seq
local rr=2.718^(`beta')
disp `rr'
local lci=2.718^(`beta'-1.96*`se')
disp `lci'
local uci=2.718^(`beta'+1.96*`se')
disp `uci'
local paf=`pc'*(1-(1/`rr'))
disp `paf'
local lpaf=`pc'*(1-(1/`lci'))
disp `lpaf'
local upaf=`pc'*(1-(1/`uci'))
disp `upaf'
disp `lpaf' `paf' `upaf' 

//any mood disorder
glm y18_anydep y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1, family(poisson) link(log) nolog vce(robust)
local beta = _b[y18_alltrauma]
disp `beta'
local se = _se[y18_alltrauma]
disp `se'
bysort y18_anydep: egen denom = count(idnum)
bysort y18_anydep: egen num2 = count(idnum) if y18_alltrauma==1
bysort y18_anydep: egen num = min(num2)
gen prop = num/denom
bysort y18_anydep: egen seq = seq()
sum prop if seq == 1 & y18_anydep==1
local pc = r(mean)
disp `pc'
drop denom num num2 prop seq
local rr=2.718^(`beta')
disp `rr'
local lci=2.718^(`beta'-1.96*`se')
disp `lci'
local uci=2.718^(`beta'+1.96*`se')
disp `uci'
local paf=`pc'*(1-(1/`rr'))
disp `paf'
local lpaf=`pc'*(1-(1/`lci'))
disp `lpaf'
local upaf=`pc'*(1-(1/`uci'))
disp `upaf'
disp `lpaf' `paf' `upaf' 

//any adhd and hyperactivity disorder
glm y18_anyadhd y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1, family(poisson) link(log) nolog vce(robust)
local beta = _b[y18_alltrauma]
disp `beta'
local se = _se[y18_alltrauma]
disp `se'
bysort y18_anyadhd: egen denom = count(idnum)
bysort y18_anyadhd: egen num2 = count(idnum) if y18_alltrauma==1
bysort y18_anyadhd: egen num = min(num2)
gen prop = num/denom
bysort y18_anyadhd: egen seq = seq()
sum prop if seq == 1 & y18_anyadhd==1
local pc = r(mean)
disp `pc'
drop denom num num2 prop seq
local rr=2.718^(`beta')
disp `rr'
local lci=2.718^(`beta'-1.96*`se')
disp `lci'
local uci=2.718^(`beta'+1.96*`se')
disp `uci'
local paf=`pc'*(1-(1/`rr'))
disp `paf'
local lpaf=`pc'*(1-(1/`lci'))
disp `lpaf'
local upaf=`pc'*(1-(1/`uci'))
disp `upaf'
disp `lpaf' `paf' `upaf' 

//any conduct and oppositional disorder
glm y18_anycd y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1, family(poisson) link(log) nolog vce(robust)
local beta = _b[y18_alltrauma]
disp `beta'
local se = _se[y18_alltrauma]
disp `se'
bysort y18_anycd: egen denom = count(idnum)
bysort y18_anycd: egen num2 = count(idnum) if y18_alltrauma==1
bysort y18_anycd: egen num = min(num2)
gen prop = num/denom
bysort y18_anycd: egen seq = seq()
sum prop if seq == 1 & y18_anycd==1
local pc = r(mean)
disp `pc'
drop denom num num2 prop seq
local rr=2.718^(`beta')
disp `rr'
local lci=2.718^(`beta'-1.96*`se')
disp `lci'
local uci=2.718^(`beta'+1.96*`se')
disp `uci'
local paf=`pc'*(1-(1/`rr'))
disp `paf'
local lpaf=`pc'*(1-(1/`lci'))
disp `lpaf'
local upaf=`pc'*(1-(1/`uci'))
disp `upaf'
disp `lpaf' `paf' `upaf'

***************************************************

* COMPLETE CASE - SEX DIFFERENCES *

* AGE 15 CTE CROSS-SECTIONAL *
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	logistic `var' c.y15_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y15_compcon==1
}

* AGE 18 CTE CROSS-SECTIONAL *
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' c.y18_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1
}

logistic y18_anydis c.y18_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1 & sex==0
logistic y18_anydis c.y18_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1 & sex==1

* AGE 11 CTE & AGE 15 DISORDER *
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	logistic `var' c.y11_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y11_compcon==1 & y15_compcon==1
}

* AGE 11 CTE & AGE 18 DISORDER *
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' c.y11_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y11_compcon==1 & y18_compcon==1
}

* AGE 15 CTE & AGE 18 DISORDER *
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' c.y15_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y15_compcon==1 & y18_compcon==1
}

***************************************************

* SUPPLEMENTARY TABLE 16 - CROSS-SECTIONAL ASSOCIATIONS BETWEEN ANY TRAUMA EXPOSURE UP TO AGE 18 AND PSYCHIATRIC DISORDERS AT AGE 18 *

//unadjusted
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y18_alltrauma if y18_compcon==1
}

//adjusted (confounders)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome if y18_compcon==1
}

//adjusted (confounders & CBCL)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	logistic `var' y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12m fincome tcbcl48 if y18_compcon==1
}

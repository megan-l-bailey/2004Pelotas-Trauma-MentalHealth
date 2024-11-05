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
* mmethnicity: maternal ethnicity (binary)
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

********************
* IMPUTED ANALYSES *
********************

* TABLE 1: SAMPLE CHARACTERISTICS OF MOTHERS AND CHILDREN AT BIRTH ACCORDING TO CHILD TRAUMA EXPOSURE STATUS AT AGE 18 YEARS *

* MODEL 2 *
mi estimate: proportion sex
mi estimate: proportion methnicity
mi estimate: proportion msmoking
mi estimate: proportion malcohol
mi estimate: proportion mmarital
mi estimate: mean fincome
mi estimate: mean meduc
mi estimate: mean mdep12

foreach var of varlist sex methnicity msmoking malcohol mmarital {
	mi estimate, esampvaryok: proportion `var' if y18_alltrauma==0
}

foreach var of varlist sex methnicity msmoking malcohol mmarital {
	mi estimate, esampvaryok: proportion `var' if y18_alltrauma==1
}

foreach var of varlist fincome meduc mdep12 {
	mi estimate, esampvaryok: mean `var' if y18_alltrauma==0
}

foreach var of varlist fincome meduc mdep12 {
	mi estimate, esampvaryok: mean `var' if y18_alltrauma==1
}

mi estimate, or: logistic y18_alltrauma i.sex 
mi estimate, or: logistic y18_alltrauma ib2.sex 
mi estimate, or: logistic y18_alltrauma i.methnicity 
mi estimate, or: logistic y18_alltrauma ib2.methnicity 
mi estimate, or: logistic y18_alltrauma i.msmoking 
mi estimate, or: logistic y18_alltrauma i.malcohol 
mi estimate, or: logistic y18_alltrauma i.mmarital
mi estimate: regress fincome y18_alltrauma
mi estimate: regress meduc y18_alltrauma
mi estimate: regress mdep12 y18_alltrauma

***************************************************

* TABLE 2: PREVALENCE OF CURRENT PSYCHIATRIC DIAGNOSES AT AGES 15 AND 18 YEARS ACCORDING TO TRAUMA EXPOSURE STATUS UP TO AGES 15 AND 18 YEARS *
 
//AGE 15 - MODEL 1
mi estimate: proportion y15_alltrauma
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, esampvaryok: proportion `var'
}
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, esampvaryok: proportion `var' if y15_alltrauma==0
}
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, esampvaryok: proportion `var' if y15_alltrauma==1
}

//AGE 18 - MODEL 2
mi estimate: proportion y18_alltrauma
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, esampvaryok: proportion `var'
}
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, esampvaryok: proportion `var' if y18_alltrauma==0
}
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, esampvaryok: proportion `var' if y18_alltrauma==1
}
	
***************************************************
	
* TABLE 3: CROSS-SECTIONAL ASSOCIATIONS BETWEEN CUMULATIVE TRAUMA LOAD UP TO AGES 15 AND 18 YEARS AND PSYCHIATRIC DISORDERS AT AGES 15 AND 18 YEARS RESPECTIVELY *

* AGE 15 - MODEL 4 *
//unadjusted
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, or: logistic `var' y15_cte
}

//adjusted (confounders)
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, or: logistic `var' y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
}

//adjusted (confounders and CBCL)
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, or: logistic `var' y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

* AGE 18 - MODEL 5 *
//unadjusted
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y18_cte
}

//adjusted (confounders)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
}

//adjusted (confounders and CBCL)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}
	
***************************************************

* TABLE 4: LONGITUDINAL ASSOCIATIONS BETWEEN CUMULATIVE TRAUMA UP TO AGES 11 AND 15 AND PSYCHIATRIC DISORDERS AT AGES 15 AND 18 *

* AGE 11 CTE & AGE 15 DISORDERS - MODEL 3 *
//unadjusted
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, or: logistic `var' y11_cte
}

//adjusted (confounders)
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, or: logistic `var' y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
}

//adjusted (confounders and CBCL)
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, or: logistic `var' y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

* AGE 11 CTE & AGE 18 DISORDERS - MODEL 3 *
//unadjusted
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y11_cte
}

//adjusted (confounders)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
}

//adjusted (confounders and CBCL)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

* AGE 15 CTE & AGE 18 DISORDERS - MODEL 4 *
//unadjusted
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y15_cte
}

//adjusted (confounders)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
}

//adjusted (confounders and CBCL)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

***************************************************

* POPULATION ATTRIBUTABLE FRACTION: ESTIMATION OF THE PROPORTION OF PSYCHIATRIC DISORDERS AT AGE 18 ATTRIBUTABLE TO CHILDHOOD TRAUMA EXPOSURE *

* MODEL 2 *
putexcel set "y18imppaf", sheet("y18") modify
putexcel A1="Outcome" B1="beta" C1="SE" D1="P Value" E1="RR" F1="LCI" G1= "UCI" H1="PAF" I1="LPAF" J1="UPAF" K1="pc"

global outcome "y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd"
local x=1

foreach out of global outcome{
	use "[pathname]/miM2.dta", clear
	
	mi estimate: glm `out' y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48, family(poisson) link(log) nolog vce(robust)
	mi estimate, post

	local beta = _b[y18_alltrauma]
	local se = _se[y18_alltrauma]
	test y18_alltrauma
	local pvalue = `r(p)'
	
	bysort _mi_m `out': egen denom = count(idnum) if _mi_m!=0
	bysort _mi_m `out': egen num2 = count(idnum) if _mi_m!=0 & y18_alltrauma==1
	bysort _mi_m `out': egen num = min(num2)
	gen prop = num/denom if _mi_m!= 0
	bysort _mi_m `out': egen seq = seq() if _mi_m!=0 
	summ prop if seq == 1 & `out'==1
	local pc = r(mean)
	drop denom num num2 prop seq
	
	local x=`x' +1
	local rr=2.718^(`beta')
	local lci=2.718^(`beta'-1.96*`se')
	local uci=2.718^(`beta'+1.96*`se')
	local paf=`pc'*(1-(1/`rr'))
	local lpaf=`pc'*(1-(1/`lci'))
	local upaf=`pc'*(1-(1/`uci'))
	
	putexcel A`x'="`out'" B`x'=`beta' C`x'=`se' D`x'=`pvalue' E`x'=`rr' F`x'=`lci' G`x'=`uci' H`x'=`paf' I`x'=`lpaf' J`x'=`upaf' K`x'=`pc'
}

***************************************************

* SEX DIFFERENCE SENSITIVITY ANALYSES *

* AGE 15 CTE CROSS-SECTIONAL - MODEL 4 *
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, or: logistic `var' c.y15_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
}

* AGE 18 CTE CROSS-SECTIONAL - MODEL 5 *
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' c.y18_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
}

//significant interaction effect for any disorder
mi estimate, or: logistic y18_anydis c.y18_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 if sex==0
mi estimate, or: logistic y18_anydis c.y18_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 if sex==1

* AGE 11 CTE & AGE 15 DISORDER - MODEL 3 *
foreach var of varlist y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd {
	mi estimate, or: logistic `var' c.y11_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
}

* AGE 11 CTE & AGE 18 DISORDER - MODEL 3 *
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' c.y11_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
}

* AGE 15 CTE & AGE 18 DISORDER - MODEL 4 *
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' c.y15_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
}

//significant interaction effect for any disorder
mi estimate, or: logistic y18_anydis c.y15_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 if sex==0
mi estimate, or: logistic y18_anydis c.y15_cte##i.sex i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 if sex==1

***************************************************

* SUPPLEMENTARY TABLE 2 - TOTAL NUMBER OF TRAUMA EXPOSURES *

* IMPUTED - MODELS 3, 4, & 5, RESPECTIVELY *
mi estimate: proportion y11_cte
mi estimate: proportion y15_cte
mi estimate: proportion y18_cte

***************************************************

* SUPPLEMENTARY TABLE 9 - CROSS-SECTIONAL ASSOCIATIONS BETWEEN ANY TRAUMA EXPOSURE UP TO AGE 18 YEARS AND PSYCHIATRIC DISORDERS AT AGE 18 *

* MODEL 2 *
//unadjusted
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y18_alltrauma
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

***************************************************

* SENSITIVITY ANALYSES - INFORMANT EFFECT *
* SUPPLEMENTARY TABLE 10 - LONGITUDINAL ASSOCIATION BETWEEN ADOLESCENT AND PARENT REPORTS OF CUMULATIVE TRAUMA UP TO AGE 15 AND ADOLESCENT REPORTS OF PSYCHIATRIC DISORDERS AT AGE 18 *

* MODEL 6 *
//adolescent - adolescent
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' a15_cte
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

//parent - adolescent
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' p15_cte
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, or: logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

***************************************************

* SENSITIVITY ANALYSES - INFORMANT EFFECT *
* SUPPLEMENTARY TABLE 11 - LONGITUDINAL ASSOCIATION BETWEEN ADOLESCENT AND PARENT REPORTS OF CUMULATIVE TRAUMA UP TO AGE 15 AND PARENT REPORTS OF ADOLESCENT PSYCHIATRIC DISORDERS AT AGE 18 *

* MODEL 6 *
//parent - parent
foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, or: logistic `var' p15_cte
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, or: logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, or: logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

//adolescent - parent
foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, or: logistic `var' a15_cte
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, or: logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, or: logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

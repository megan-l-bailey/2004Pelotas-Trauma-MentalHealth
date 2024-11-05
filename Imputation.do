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

***************************************************
* MULTIPLE IMPUTATION BY CHAINED EQUATIONS (MICE) *
***************************************************

//NOTES
* 6 imputation models were run due to problems with perfect prediction when imputing all trauma variables in the same model
* model 1: binary trauma exposure up to age 15
* model 2: binary trauma exposure up to age 18
* model 3: cumulative trauma exposure up to age 11
* model 4: cumulative trauma exposure up to age 15
* model 5: cumulative trauma exposure up to age 18
* model 6: sensitivity analysis model 

*************************************************** 

* CORRELATIONS *
tetrachoric y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd y11_alltrauma y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y15_alltrauma y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_alltrauma sex mmarital methnicity malcohol  msmoking y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y6_alltrauma, pw stats(rho se obs p)

spearman y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd y11_alltrauma y11_cte y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y15_alltrauma y15_cte y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_alltrauma y18_cte sex mmarital methnicity malcohol meduc fincome msmoking mdep12 tcbcl48 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y6_alltrauma birthweight tctspc6 tctspc11 tctspc15, stats(rho p)

//females
tetrachoric y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd y11_alltrauma y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y15_alltrauma y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_alltrauma mmarital methnicity malcohol  msmoking y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y6_alltrauma if sex==0, pw stats(rho se obs p)

spearman y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd y11_alltrauma y11_cte y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y15_alltrauma y15_cte y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_alltrauma y18_cte sex mmarital methnicity malcohol meduc fincome msmoking mdep12 tcbcl48 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y6_alltrauma birthweight tctspc6 tctspc11 tctspc15 if sex==0, stats(rho p)

//males
tetrachoric y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd y11_alltrauma y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y15_alltrauma y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_alltrauma mmarital methnicity malcohol  msmoking y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y6_alltrauma if sex==1, pw stats(rho se obs p)

spearman y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd y11_alltrauma y11_cte y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y15_alltrauma y15_cte y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_alltrauma y18_cte sex mmarital methnicity malcohol meduc fincome msmoking mdep12 tcbcl48 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y6_alltrauma birthweight tctspc6 tctspc11 tctspc15 if sex==1, stats(rho p)

//correlations - sensitivity analyses
tetrachoric y18_anydis y18_sdqtotal sex mmarital methnicity malcohol msmoking y6_anydis y11_anydis, pw stats(rho se obs p)

spearman y18_anydis y18_sdqtotal p15_cte a15_cte sex mmarital methnicity malcohol meduc fincome msmoking mdep12 tcbcl48 y6_anydis y11_anydis birthweight tctspc6 tctspc11 tctspc15, stats(rho p)

***************************************************

* SUPPLEMENTARY TABLE 5 - ASSOCIATIONS BETWEEN CONFOUNDERS AND THE MAIN EXPOSURES AND OUTCOMES AT AGES 15 AND 18 *

//association with CTE @ 15
regress y15_cte sex if y15_compcon==1
regress y15_cte methnicity if y15_compcon==1
regress y15_cte msmoking if y15_compcon==1
regress y15_cte malcohol if y15_compcon==1
regress y15_cte mmarital if y15_compcon==1
regress y15_cte fincome if y15_compcon==1
regress y15_cte meduc if y15_compcon==1
regress y15_cte mdep12 if y15_compcon==1
regress y15_cte tcbcl48 if y15_compcon==1
regress y15_cte y6_anydis if y15_compcon==1
regress y15_cte y11_anydis if y15_compcon==1

//association with CTE @ 18
regress y18_cte sex if y18_compcon==1
regress y18_cte methnicity if y18_compcon==1
regress y18_cte msmoking if y18_compcon==1
regress y18_cte malcohol if y18_compcon==1
regress y18_cte mmarital if y18_compcon==1
regress y18_cte fincome if y18_compcon==1
regress y18_cte meduc if y18_compcon==1
regress y18_cte mdep12 if y18_compcon==1
regress y18_cte tcbcl48 if y18_compcon==1
regress y18_cte y6_anydis if y18_compcon==1
regress y18_cte y11_anydis if y18_compcon==1

//association with 'any disorder' @ 15
logistic y15_anydis sex if y15_compcon==1
logistic y15_anydis methnicity if y15_compcon==1
logistic y15_anydis msmoking if y15_compcon==1
logistic y15_anydis malcohol if y15_compcon==1
logistic y15_anydis mmarital if y15_compcon==1
logistic y15_anydis fincome if y15_compcon==1
logistic y15_anydis meduc if y15_compcon==1
logistic y15_anydis mdep12 if y15_compcon==1
logistic y15_anydis tcbcl48 if y15_compcon==1
logistic y15_anydis y6_anydis if y15_compcon==1
logistic y15_anydis y11_anydis if y15_compcon==1

//association with 'any disorder' @ 18
logistic y18_anydis sex if y18_compcon==1
logistic y18_anydis methnicity if y18_compcon==1
logistic y18_anydis msmoking if y18_compcon==1
logistic y18_anydis malcohol if y18_compcon==1
logistic y18_anydis mmarital if y18_compcon==1
logistic y18_anydis fincome if y18_compcon==1
logistic y18_anydis meduc if y18_compcon==1
logistic y18_anydis mdep12 if y18_compcon==1
logistic y18_anydis tcbcl48 if y18_compcon==1
logistic y18_anydis y6_anydis if y18_compcon==1
logistic y18_anydis y11_anydis if y18_compcon==1

***************************************************

* SUPPLEMENTARY TABLE 6 - Summary of missing data *

//missing values
misstable summarize sex birthweight mmarital methnicity malcohol meduc fincome msmoking mdep12 tcbcl48 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd y11_cte y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y15_alltrauma y15_cte y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_alltrauma y18_cte tctspc6 tctspc11 tctspc15 a15_cte p15_cte y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper

//mean and SD
summarize sex birthweight mmarital methnicity malcohol meduc fincome msmoking mdep12 tcbcl48 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd y11_cte y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y15_alltrauma y15_cte y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_alltrauma y18_cte tctspc6 tctspc11 tctspc15 a15_cte p15_cte y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper

//skewness and kurtosis
sktest y11_cte y15_cte y18_cte meduc fincome mdep12 tcbcl48 birthweight tctspc6 tctspc11 tctspc15 a15_cte p15_cte

***************************************************

* SUPPLEMENTARY TABLE 7 - COMPARISON OF COMPLETE CASES AND THOSE WITH MISSING INFORMATION FOR TRAUMA EXPOSURE AND/OR PSYCHIATRIC DISORDERS AT THE 15-YEAR FOLLOW-UP *

//y15_complete: 0=missing, 1=complete
generate y15_missing=.
replace y15_missing=1 if y15_complete==0
replace y15_missing=0 if y15_complete==1

//proportion missing
misstable summarize y6_alltrauma y6_anydis y11_alltrauma y11_anydis sex methnicity mmarital msmoking malcohol meduc fincome mdep12 tcbcl48

//complete case statistics
tab y6_alltrauma if y15_missing==0
tab y6_anydis if y15_missing==0
tab y11_alltrauma if y15_missing==0
tab y11_anydis if y15_missing==0
tab sex if y15_missing==0
tab methnicity if y15_missing==0
tab mmarital if y15_missing==0
tab msmoking if y15_missing==0
tab malcohol if y15_missing==0
summarize meduc if y15_missing==0
summarize fincome if y15_missing==0
summarize mdep12 if y15_missing==0
summarize tcbcl48 if y15_missing==0

//missing statistics
tab y6_alltrauma if y15_missing==1
tab y6_anydis if y15_missing==1
tab y11_alltrauma if y15_missing==1
tab y11_anydis if y15_missing==1
tab sex if y15_missing==1
tab methnicity if y15_missing==1
tab mmarital if y15_missing==1
tab msmoking if y15_missing==1
tab malcohol if y15_missing==1
summarize meduc if y15_missing==1
summarize fincome if y15_missing==1
summarize mdep12 if y15_missing==1
summarize tcbcl48 if y15_missing==1

//association with missingness
logistic y15_missing i.y6_alltrauma 
logistic y15_missing i.y6_anydis
logistic y15_missing i.y11_alltrauma
logistic y15_missing i.y11_anydis
logistic y15_missing i.sex 
logistic y15_missing i.methnicity
logistic y15_missing i.mmarital
logistic y15_missing i.msmoking
logistic y15_missing i.malcohol
logistic y15_missing meduc
logistic y15_missing fincome
logistic y15_missing mdep12
logistic y15_missing tcbcl48

***************************************************

* SUPPLEMENTARY TABLE 8 - COMPARISON OF COMPLETE CASES AND THOSE WITH MISSING INFORMATION FOR TRAUMA EXPOSURE AND/OR PSYCHIATRIC DISORDERS AT THE 18-YEAR FOLLOW-UP *

//y18_complete: 0=missing, 1=complete
generate y18_missing=.
replace y18_missing=1 if y18_complete==0
replace y18_missing=0 if y18_complete==1

//proportion missing
misstable summarize y6_alltrauma y6_anydis y11_alltrauma y11_anydis sex methnicity mmarital msmoking malcohol meduc fincome mdep12 tcbcl48

//complete case statistics
tab y6_alltrauma if y18_missing==0
tab y6_anydis if y18_missing==0
tab y11_alltrauma if y18_missing==0
tab y11_anydis if y18_missing==0
tab sex if y18_missing==0
tab methnicity if y18_missing==0
tab mmarital if y18_missing==0
tab msmoking if y18_missing==0
tab malcohol if y18_missing==0
summarize meduc if y18_missing==0
summarize fincome if y18_missing==0
summarize mdep12 if y18_missing==0
summarize tcbcl48 if y18_missing==0

//missing statistics
tab y6_alltrauma if y18_missing==1
tab y6_anydis if y18_missing==1
tab y11_alltrauma if y18_missing==1
tab y11_anydis if y18_missing==1
tab sex if y18_missing==1
tab methnicity if y18_missing==1
tab mmarital if y18_missing==1
tab msmoking if y18_missing==1
tab malcohol if y18_missing==1
summarize meduc if y18_missing==1
summarize fincome if y18_missing==1
summarize mdep12 if y18_missing==1
summarize tcbcl48 if y18_missing==1

//association with missingness
logistic y18_missing i.y6_alltrauma 
logistic y18_missing i.y6_anydis
logistic y18_missing i.y11_alltrauma
logistic y18_missing i.y11_anydis
logistic y18_missing i.sex 
logistic y18_missing i.methnicity
logistic y18_missing i.mmarital
logistic y18_missing i.msmoking
logistic y18_missing i.malcohol
logistic y18_missing meduc
logistic y18_missing fincome
logistic y18_missing mdep12
logistic y18_missing tcbcl48

***************************************************

* MULTIPLE IMPUTATION MODEL 1: BINARY TRAUMA @ 15 *

use "finaldata.dta", clear
save "miM1.dta", replace 

xtset, clear
mi set flong
mi stset, clear
mi register regular sex msmoking mmarital malcohol fincome
mi register imputed y15_alltrauma y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd methnicity meduc mdep12 tcbcl48 birthweight tctspc11 tctspc15 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd 

//dry run model 
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex)) y15_alltrauma ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y15_alltrauma `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//convergence checks
logistic y15_alltrauma meduc i.methnicity mdep12 tcbcl48 tctspc11 i.y18_anydep i.y18_anydis i.y18_anyadhd i.y18_anyanx i.y18_anycd i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd tctspc15 i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y15_anydis meduc i.methnicity mdep12 tcbcl48 i.y6_anydis i.y11_anydis i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y15_anyanx meduc i.methnicity mdep12 tcbcl48 i.y6_anyanx i.y11_anyanx i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y15_anydep meduc i.methnicity mdep12 tcbcl48 i.y6_anydep i.y11_anydep i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y15_anyadhd meduc i.methnicity mdep12 tcbcl48 i.y6_anyadhd i.y11_anyadhd i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y15_anycd meduc i.methnicity mdep12 tcbcl48 i.y6_anycd i.y11_anycd i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anydis meduc i.methnicity mdep12 tcbcl48 i.y6_anydis i.y11_anydis i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anyanx meduc i.methnicity mdep12 tcbcl48 i.y11_anyanx i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anydep meduc i.methnicity mdep12 tcbcl48 i.y11_anydep i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anyadhd  meduc i.methnicity mdep12 tcbcl48 i.y11_anyadhd i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anycd meduc i.methnicity mdep12 tcbcl48 i.y6_anycd i.y11_anycd i.y15_alltrauma i.msmoking i.mmarital i.malcohol fincome if _mi_m==0

* y15_anyadhd; predictor y11_anyadhd SE=8.60; remove as auxiliary variable
logistic y15_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anyadhd i.y15_alltrauma i.msmoking i.mmarital i.malcohol if _mi_m==0
* y15_anycd; predictor y11_anycd SE=4.09; remove as auxiliary variables
logistic y15_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd i.y15_alltrauma i.msmoking i.mmarital i.malcohol if _mi_m==0

//dry run model with changes
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex)) y15_alltrauma ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y15_alltrauma `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//m=10
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex)) y15_alltrauma ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y15_alltrauma `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(10) rseed(100) by(sex) noisily 
	
//perfect pred error - y15_alltrauma and y15_anycd for females (sex==0) - added augment command
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex) augment) y15_alltrauma ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex) augment) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y15_alltrauma `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(10) rseed(100) by(sex) noisily 
	
//m=100
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex) augment) y15_alltrauma ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex) augment) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y15_alltrauma `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(100) rseed(100) by(sex) noisily 

* DATA EXPLORATION *
summarize _mi_id _mi_miss _mi_m

//compare mean and summary stats for the original data and compare it with imputed data
tab _mi_m, summarize(y15_alltrauma)
tab _mi_m, summarize(y15_anydis) 
tab _mi_m, summarize(y15_anyanx) 
tab _mi_m, summarize(y15_anydep)
tab _mi_m, summarize(y15_anyadhd)
tab _mi_m, summarize(y15_anycd)
tab _mi_m, summarize(y18_anydis) 
tab _mi_m, summarize(y18_anyanx) 
tab _mi_m, summarize(y18_anydep) 
tab _mi_m, summarize(y18_anyadhd) 
tab _mi_m, summarize(y18_anycd) 
tab _mi_m, summarize(methnicity) 
tab _mi_m, summarize(meduc) 
tab _mi_m, summarize(mdep12)
tab _mi_m, summarize(tcbcl48)
tab _mi_m, summarize(birthweight)
tab _mi_m, summarize(tctspc11)
tab _mi_m, summarize(tctspc15)
tab _mi_m, summarize(y6_anydis)
tab _mi_m, summarize(y6_anyanx)
tab _mi_m, summarize(y6_anydep)
tab _mi_m, summarize(y6_anyadhd)
tab _mi_m, summarize(y6_anycd)
tab _mi_m, summarize(y11_anydis)
tab _mi_m, summarize(y11_anyanx) 
tab _mi_m, summarize(y11_anydep) 
tab _mi_m, summarize(y11_anyadhd) 
tab _mi_m, summarize(y11_anycd) 

//Monte Carlo Error - check whether the Monte Carlo error of B is approximately 10 per cent of its standard error (so one value below coefficient vs SE of the coefficient)
mi estimate, mcerror: logistic y15_anydis i.y15_alltrauma
mi estimate, mcerror: logistic y15_anyanx i.y15_alltrauma
mi estimate, mcerror: logistic y15_anydep i.y15_alltrauma
mi estimate, mcerror: logistic y15_anyadhd i.y15_alltrauma
mi estimate, mcerror: logistic y15_anycd i.y15_alltrauma
mi estimate, mcerror: logistic y15_anydis i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anyanx i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y15_anydep i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y15_anyadhd i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y15_anycd i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y15_anydis i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y15_anyanx i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y15_anydep i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y15_anyadhd i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y15_anycd i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

mi estimate, mcerror: logistic y18_anydis i.y15_alltrauma 
mi estimate, mcerror: logistic y18_anyanx i.y15_alltrauma
mi estimate, mcerror: logistic y18_anydep i.y15_alltrauma
mi estimate, mcerror: logistic y18_anyadhd i.y15_alltrauma
mi estimate, mcerror: logistic y18_anycd i.y15_alltrauma
mi estimate, mcerror: logistic y18_anydis i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anyanx i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anydep i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anyadhd i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anycd i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anydis i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anyanx i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anydep i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anyadhd i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anycd i.y15_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

* IMPUTATION CHECKS *
//checking imputation process to see if need more cycles of chained equations algorithm
use "miM1", clear
save "miM1_trace", replace 

//note: savetrace cannot be combined with the by() command
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex) augment) y15_alltrauma ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex) augment) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y15_alltrauma `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex i.y15_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, rseed(100) chainonly burnin(100) savetrace(m1_imptrace)
	
//check scatterplots for convergence
use m1_imptrace

scatter y15_alltrauma_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y15alltrauma.gph", replace
scatter y15_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y15anydis.gph", replace
scatter y15_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y15anyanx.gph", replace
scatter y15_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y15anydep.gph", replace
scatter y15_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y15anyadhd.gph", replace
scatter y15_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y15anycd.gph", replace
scatter y18_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y18anydis.gph", replace
scatter y18_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y18anyanx.gph", replace
scatter y18_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y18anydep.gph", replace
scatter y18_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y18anyadhd.gph", replace
scatter y18_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y18anycd.gph", replace
scatter methnicity_mean iter, c(1)
graph save "Graph" "[pathname]/m1_methnicity.gph", replace
scatter meduc_mean iter, c(1)
graph save "Graph" "[pathname]/m1_meduc.gph", replace
scatter mdep12_mean iter, c(1)
graph save "Graph" "[pathname]/m1_mdep12.gph", replace
scatter tcbcl48_mean iter, c(1)
graph save "Graph" "[pathname]/m1_tcbcl48.gph", replace
scatter birthweight_mean iter, c(1)
graph save "Graph" "[pathname]/m1_birthweight.gph", replace
scatter tctspc11_mean iter, c(1)
graph save "Graph" "[pathname]/m1_tctspc11.gph", replace
scatter tctspc15_mean iter, c(1)
graph save "Graph" "[pathname]/m1_tctspc15.gph", replace
scatter y6_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y6anydis.gph", replace
scatter y6_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y6anyanx.gph", replace
scatter y6_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y6anydep.gph", replace
scatter y6_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y6anyadhd.gph", replace
scatter y6_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y6anycd.gph", replace
scatter y11_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y11anydis.gph", replace
scatter y11_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y11anyanx.gph", replace
scatter y11_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y11anydep.gph", replace
scatter y11_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y11anyadhd.gph", replace
scatter y11_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m1_y11anycd.gph", replace
	
*************************************************** 

* MULTIPLE IMPUTATION MODEL 2: BINARY TRAUMA @ AGE 18 *

use "finaldata.dta", clear
save "miM2.dta", replace

xtset, clear
mi set flong
mi stset, clear
mi register regular sex msmoking mmarital malcohol fincome
mi register imputed y18_alltrauma y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd methnicity meduc mdep12 tcbcl48 birthweight tctspc6 tctspc11 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd

//dry run model 
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex)) y18_alltrauma ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y18_alltrauma `y6' `y11' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//convergence checks
logistic y18_alltrauma fincome meduc i.methnicity mdep12 tcbcl48 tctspc11 tctspc6 i.y18_anydep i.y18_anydis i.y18_anyadhd i.y18_anyanx i.y18_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anydis fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anydis i.y18_alltrauma i.y11_anydis i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anyanx fincome meduc i.methnicity mdep12 tcbcl48 i.y18_alltrauma i.y11_anyanx i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anydep fincome meduc i.methnicity mdep12 tcbcl48 i.y18_alltrauma i.y11_anydep i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 i.y18_alltrauma i.y11_anyadhd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd i.y18_alltrauma i.y11_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0

//m=10
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex)) y18_alltrauma ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y18_alltrauma `y6' `y11' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(10) rseed(100) by(sex) noisily 
	
//m=100
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex)) y18_alltrauma ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y18_alltrauma `y6' `y11' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(100) rseed(100) by(sex) noisily 
	
* DATA EXPLORATION *
summarize _mi_id _mi_miss _mi_m

//compare mean and summary stats for the original data and compare it with imputed data
tab _mi_m, summarize(y18_alltrauma)
tab _mi_m, summarize(y18_anydis) 
tab _mi_m, summarize(y18_anyanx) 
tab _mi_m, summarize(y18_anydep) 
tab _mi_m, summarize(y18_anyadhd) 
tab _mi_m, summarize(y18_anycd) 
tab _mi_m, summarize(methnicity) 
tab _mi_m, summarize(meduc) 
tab _mi_m, summarize(fincome)
tab _mi_m, summarize(mdep12)
tab _mi_m, summarize(tcbcl48)
tab _mi_m, summarize(birthweight)
tab _mi_m, summarize(tctspc6)
tab _mi_m, summarize(tctspc11)
tab _mi_m, summarize(y6_anydis)
tab _mi_m, summarize(y6_anyanx)
tab _mi_m, summarize(y6_anydep)
tab _mi_m, summarize(y6_anyadhd)
tab _mi_m, summarize(y6_anycd)
tab _mi_m, summarize(y11_anydis)
tab _mi_m, summarize(y11_anyanx) 
tab _mi_m, summarize(y11_anydep) 
tab _mi_m, summarize(y11_anyadhd)
tab _mi_m, summarize(y11_anycd)

//Monte Carlo Error - check whether the Monte Carlo error of B is approximately 10 per cent of its standard error (so one value below coefficient vs SE of the coefficient)
mi estimate, mcerror: logistic y18_anydis i.y18_alltrauma 
mi estimate, mcerror: logistic y18_anyanx i.y18_alltrauma
mi estimate, mcerror: logistic y18_anydep i.y18_alltrauma
mi estimate, mcerror: logistic y18_anyadhd i.y18_alltrauma
mi estimate, mcerror: logistic y18_anycd i.y18_alltrauma
mi estimate, mcerror: logistic y18_anydis i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y18_anyanx i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y18_anydep i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y18_anyadhd i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y18_anycd i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y18_anydis i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y18_anyanx i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y18_anydep i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y18_anyadhd i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y18_anycd i.y18_alltrauma i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

* IMPUTATION CHECKS *
//checking imputation process to see if need more cycles of chained equations algorithm
use "miM2.dta", clear
save "miM2_trace.dta", replace 

//note: savetrace cannot be combined with the by() command
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"

set more off
mi impute chained ///
(logit, omit(`y6' `y11' birthweight i.sex)) y18_alltrauma ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(i.y18_alltrauma `y6' `y11' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex i.y18_alltrauma i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, rseed(100) chainonly burnin(100) savetrace(m2_imptrace)	

//check scatterplots for convergence
use m2_imptrace
scatter y18_alltrauma_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y18alltrauma.gph", replace
scatter y18_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y18anydis.gph", replace
scatter y18_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y18anyanx.gph", replace
scatter y18_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y18anydep.gph", replace
scatter y18_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y18anyadhd.gph", replace
scatter y18_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y18anycd.gph", replace
scatter methnicity_mean iter, c(1)
graph save "Graph" "[pathname]/m2_methnicity.gph", replace
scatter meduc_mean iter, c(1)
graph save "Graph" "[pathname]/m2_meduc.gph", replace
scatter mdep12_mean iter, c(1)
graph save "Graph" "[pathname]/m2_mdep12.gph", replace
scatter tcbcl48_mean iter, c(1)
graph save "Graph" "[pathname]/m2_tcbcl48.gph", replace
scatter birthweight_mean iter, c(1)
graph save "Graph" "[pathname]/m2_birthweight.gph", replace
scatter tctspc6_mean iter, c(1)
graph save "Graph" "[pathname]/m2_tctspc6.gph", replace
scatter tctspc11_mean iter, c(1)
graph save "Graph" "[pathname]/m2_tctspc11.gph", replace
scatter y6_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y6anydis.gph", replace
scatter y6_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y6anyanx.gph", replace
scatter y6_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y6anydep.gph", replace
scatter y6_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y6anyadhd.gph", replace
scatter y6_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y6anycd.gph", replace
scatter y11_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y11anydis.gph", replace
scatter y11_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y11anyanx.gph", replace
scatter y11_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y11anydep.gph", replace
scatter y11_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y11anyadhd.gph", replace
scatter y11_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m2_y11anycd.gph", replace
	
***************************************************

* MULTIPLE IMPUTATION MODEL 3: CTE @ AGE 11 *

use "finaldata.dta", clear
save "miM3.dta", replace

xtset, clear
mi set flong
mi stset, clear
mi register regular sex msmoking mmarital malcohol fincome 
mi register imputed y11_cte y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd methnicity meduc mdep12 tcbcl48 birthweight tctspc6 tctspc11 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd 

//dry run model
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"
	
set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y11_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y11_cte `y6' `y11' `y15' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//convergence checks
logistic y11_cte fincome meduc i.methnicity mdep12 tcbcl48 tctspc11 tctspc6 i.y18_anydep i.y18_anydis i.y18_anyadhd i.y18_anyanx i.y18_anycd i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anydis fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anydis y11_cte i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anyanx fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anyanx y11_cte i.y11_anyanx i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anydep fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anydep y11_cte i.y11_anydep i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anyadhd y11_cte i.y11_anyadhd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd y11_cte i.y11_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anydis fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anydis y11_cte i.y11_anydis i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anyanx fincome meduc i.methnicity mdep12 tcbcl48 y11_cte i.y11_anyanx i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anydep fincome meduc i.methnicity mdep12 tcbcl48 y11_cte i.y11_anydep i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 y11_cte i.y11_anyadhd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd y11_cte i.y11_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0

* y15_anyadhd; predictor y11_anyadhd SE=7.84; remove as auxiliary variable
logistic y15_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anyadhd y11_cte i.msmoking i.mmarital i.malcohol if _mi_m==0
* y15_anycd; predictor y11_anycd SE=3.76; remove as auxiliary variables
logistic y15_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd y11_cte  i.msmoking i.mmarital i.malcohol if _mi_m==0

//new dry run
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"
	
set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y11_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y11_cte `y6' `y11' `y15' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//m=10
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"
	
set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y11_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y11_cte `y6' `y11' `y15' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(10) rseed(100) by(sex) noisily 
	
//m=100
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"
	
set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y11_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y11_cte `y6' `y11' `y15' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(100) rseed(100) by(sex) noisily 
	
* DATA EXPLORATION *
summarize _mi_id _mi_miss _mi_m

//compare mean and summary stats for the original data and compare it with imputed data
tab _mi_m, summarize(y11_cte)
tab _mi_m, summarize(y15_anydis) 
tab _mi_m, summarize(y15_anyanx) 
tab _mi_m, summarize(y15_anydep)
tab _mi_m, summarize(y15_anyadhd)
tab _mi_m, summarize(y15_anycd)
tab _mi_m, summarize(y18_anydis) 
tab _mi_m, summarize(y18_anyanx) 
tab _mi_m, summarize(y18_anydep) 
tab _mi_m, summarize(y18_anyadhd) 
tab _mi_m, summarize(y18_anycd) 
tab _mi_m, summarize(methnicity) 
tab _mi_m, summarize(meduc) 
tab _mi_m, summarize(mdep12)
tab _mi_m, summarize(tcbcl48)
tab _mi_m, summarize(birthweight)
tab _mi_m, summarize(tctspc6)
tab _mi_m, summarize(tctspc11)
tab _mi_m, summarize(y6_anydis)
tab _mi_m, summarize(y6_anyanx)
tab _mi_m, summarize(y6_anydep)
tab _mi_m, summarize(y6_anyadhd)
tab _mi_m, summarize(y6_anycd)
tab _mi_m, summarize(y11_anydis)
tab _mi_m, summarize(y11_anyanx) 
tab _mi_m, summarize(y11_anydep) 
tab _mi_m, summarize(y11_anyadhd) 
tab _mi_m, summarize(y11_anycd) 

//Monte Carlo Error - check whether the Monte Carlo error of B is approximately 10 per cent of its standard error (so one value below coefficient vs SE of the coefficient)
mi estimate, mcerror: logistic y15_anydis y11_cte
mi estimate, mcerror: logistic y15_anyanx y11_cte
mi estimate, mcerror: logistic y15_anydep y11_cte
mi estimate, mcerror: logistic y15_anyadhd y11_cte
mi estimate, mcerror: logistic y15_anycd y11_cte
mi estimate, mcerror: logistic y15_anydis y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anyanx y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anydep y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anyadhd y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anycd y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anydis y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y15_anyanx y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y15_anydep y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y15_anyadhd y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y15_anycd y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

mi estimate, mcerror: logistic y18_anydis y11_cte
mi estimate, mcerror: logistic y18_anyanx y11_cte
mi estimate, mcerror: logistic y18_anydep y11_cte
mi estimate, mcerror: logistic y18_anyadhd y11_cte
mi estimate, mcerror: logistic y18_anycd y11_cte
mi estimate, mcerror: logistic y18_anydis y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anyanx y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anydep y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anyadhd y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anycd y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anydis y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anyanx y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anydep y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anyadhd y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anycd y11_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

* IMPUTATION CHECKS *

//checking imputation process to see if need more cycles of chained equations algorithm
use "miM3.dta", clear
save "miM3_trace.dta", replace 

//note: savetrace cannot be combined with the by() command
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"
	
set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y11_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `auxiliary' `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd `auxiliary' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y11_cte `y6' `y11' `y15' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y11_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, rseed(100) chainonly burnin(100) savetrace(m3_imptrace)

//check scatterplots for convergence
use m3_imptrace
scatter y11_cte_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y11cte.gph", replace
scatter y15_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y15anydis.gph", replace
scatter y15_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y15anyanx.gph", replace
scatter y15_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y15anydep.gph", replace
scatter y15_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y15anyadhd.gph", replace
scatter y15_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y15anycd.gph", replace
scatter y18_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y18anydis.gph", replace
scatter y18_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y18anyanx.gph", replace
scatter y18_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y18anydep.gph", replace
scatter y18_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y18anyadhd.gph", replace
scatter y18_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y18anycd.gph", replace
scatter methnicity_mean iter, c(1)
graph save "Graph" "[pathname]/m3_methnicity.gph", replace
scatter meduc_mean iter, c(1)
graph save "Graph" "[pathname]/m3_meduc.gph", replace
scatter mdep12_mean iter, c(1)
graph save "Graph" "[pathname]/m3_mdep12.gph", replace
scatter tcbcl48_mean iter, c(1)
graph save "Graph" "[pathname]/m3_tcbcl48.gph", replace
scatter birthweight_mean iter, c(1)
graph save "Graph" "[pathname]/m3_birthweight.gph", replace
scatter tctspc6_mean iter, c(1)
graph save "Graph" "[pathname]/m3_tctspc6.gph", replace
scatter tctspc11_mean iter, c(1)
graph save "Graph" "[pathname]/m3_tctspc11.gph", replace
scatter y6_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y6anydis.gph", replace
scatter y6_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y6anyanx.gph", replace
scatter y6_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y6anydep.gph", replace
scatter y6_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y6anyadhd.gph", replace
scatter y6_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y6anycd.gph", replace
scatter y11_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y11anydis.gph", replace
scatter y11_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y11anyanx.gph", replace
scatter y11_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y11anydep.gph", replace
scatter y11_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y11anyadhd.gph", replace
scatter y11_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m3_y11anycd.gph", replace

***************************************************

* MULTIPLE IMPUTATION MODEL 4: CTE @ AGE 15 *

use "finaldata.dta", clear
save "miM4.dta", replace

xtset, clear
mi set flong
mi stset, clear
mi register regular sex msmoking mmarital malcohol fincome
mi register imputed y15_cte y15_anydis y15_anyanx y15_anydep y15_anyadhd y15_anycd y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd methnicity meduc mdep12 tcbcl48 birthweight tctspc11 tctspc15 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd

//dry run model 
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y15_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y15_cte `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//convergence checks
logistic y15_cte fincome meduc i.methnicity mdep12 tcbcl48 tctspc11 i.y18_anydep i.y18_anydis i.y18_anyadhd i.y18_anyanx i.y18_anycd i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd tctspc15 i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anydis fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anydis y15_cte i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anyanx fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anyanx y15_cte i.y11_anyanx i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anydep fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anydep y15_cte i.y11_anydep i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anyadhd y15_cte i.y11_anyadhd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y15_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd y15_cte i.y11_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anydis fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anydis y15_cte i.y11_anydis i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anyanx fincome meduc i.methnicity mdep12 tcbcl48 y15_cte i.y11_anyanx i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anydep fincome meduc i.methnicity mdep12 tcbcl48 y15_cte i.y11_anydep i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 y15_cte i.y11_anyadhd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd y15_cte i.y11_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0

* y15_anyadhd; predictor y11_anyadhd SE=7.59; remove as auxiliary variable
logistic y15_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anyadhd y15_cte i.msmoking i.mmarital i.malcohol if _mi_m==0
* y15_anycd; predictor y11_anycd SE=4.06; remove as auxiliary variables
logistic y15_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd y15_cte i.msmoking i.mmarital i.malcohol if _mi_m==0

//new dry run
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y15_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y15_cte `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//m=10
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y15_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y15_cte `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(10) rseed(10) by(sex) noisily 
	
//m=100
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y15_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y15_cte `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(100) rseed(100) by(sex) noisily 
	
* DATA EXPLORATION *
summarize _mi_id _mi_miss _mi_m

//compare mean and summary stats for the original data and compare it with imputed data
tab _mi_m, summarize(y15_cte)
tab _mi_m, summarize(y15_anydis) 
tab _mi_m, summarize(y15_anyanx) 
tab _mi_m, summarize(y15_anydep)
tab _mi_m, summarize(y15_anyadhd)
tab _mi_m, summarize(y15_anycd)
tab _mi_m, summarize(y18_anydis) 
tab _mi_m, summarize(y18_anyanx) 
tab _mi_m, summarize(y18_anydep) 
tab _mi_m, summarize(y18_anyadhd) 
tab _mi_m, summarize(y18_anycd) 
tab _mi_m, summarize(methnicity) 
tab _mi_m, summarize(meduc) 
tab _mi_m, summarize(mdep12)
tab _mi_m, summarize(tcbcl48)
tab _mi_m, summarize(birthweight)
tab _mi_m, summarize(tctspc11)
tab _mi_m, summarize(tctspc15)
tab _mi_m, summarize(y6_anydis)
tab _mi_m, summarize(y6_anyanx)
tab _mi_m, summarize(y6_anydep)
tab _mi_m, summarize(y6_anyadhd)
tab _mi_m, summarize(y6_anycd)
tab _mi_m, summarize(y11_anydis)
tab _mi_m, summarize(y11_anyanx) 
tab _mi_m, summarize(y11_anydep) 
tab _mi_m, summarize(y11_anyadhd) 
tab _mi_m, summarize(y11_anycd) 

//Monte Carlo Error - check whether the Monte Carlo error of B is approximately 10 per cent of its standard error (so one value below coefficient vs SE of the coefficient)
mi estimate, mcerror: logistic y15_anydis y15_cte 
mi estimate, mcerror: logistic y15_anyanx y15_cte
mi estimate, mcerror: logistic y15_anydep y15_cte 
mi estimate, mcerror: logistic y15_anyadhd y15_cte 
mi estimate, mcerror: logistic y15_anycd y15_cte 
mi estimate, mcerror: logistic y15_anydis y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anyanx y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anydep y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anyadhd y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y15_anycd y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y15_anydis y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y15_anyanx y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y15_anydep y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y15_anyadhd y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y15_anycd y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

mi estimate, mcerror: logistic y18_anydis y15_cte
mi estimate, mcerror: logistic y18_anyanx y15_cte
mi estimate, mcerror: logistic y18_anydep y15_cte
mi estimate, mcerror: logistic y18_anyadhd y15_cte
mi estimate, mcerror: logistic y18_anycd y15_cte
mi estimate, mcerror: logistic y18_anydis y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anyanx y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anydep y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anyadhd y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anycd y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anydis y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anyanx y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anydep y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anyadhd y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anycd y15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

* IMPUTATION CHECKS *
//checking imputation process to see if need more cycles of chained equations algorithm
use "miM4.dta", clear
save "miM4_trace.dta", replace 

//note: savetrace cannot be combined with the by() command
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y15 "i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y15_cte ///
(logit, omit(i.y15_anyanx i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydis ///
(logit, omit(i.y15_anydis i.y15_anydep i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anyanx ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anyadhd i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y15_anydep ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anycd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd `y11' `auxiliary' i.sex) augment) y15_anyadhd ///
(logit, omit(i.y15_anydis i.y15_anyanx i.y15_anydep i.y15_anyadhd `y18' i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd `y11' `auxiliary' i.sex)) y15_anycd ///
(logit, omit(`y15' i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(`y15' i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(`y15' i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y15_cte `y6' `y11' `y15' `y18' mdep12 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `y15' `y18' birthweight i.sex meduc)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y15' `y18' i.sex y15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, rseed(100) chainonly burnin(100) savetrace(m4_imptrace)
	
//check scatterplots for convergence
use m4_imptrace
scatter y15_cte_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y15cte.gph", replace
scatter y15_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y15anydis.gph", replace
scatter y15_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y15anyanx.gph", replace
scatter y15_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y15anydep.gph", replace
scatter y15_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y15anyadhd.gph", replace
scatter y15_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y15anycd.gph", replace
scatter y18_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y18anydis.gph", replace
scatter y18_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y18anyanx.gph", replace
scatter y18_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y18anydep.gph", replace
scatter y18_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y18anyadhd.gph", replace
scatter y18_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y18anycd.gph", replace
scatter methnicity_mean iter, c(1)
graph save "Graph" "[pathname]/m4_methnicity.gph", replace
scatter meduc_mean iter, c(1)
graph save "Graph" "[pathname]/m4_meduc.gph", replace
scatter mdep12_mean iter, c(1)
graph save "Graph" "[pathname]/m4_mdep12.gph", replace
scatter tcbcl48_mean iter, c(1)
graph save "Graph" "[pathname]/m4_tcbcl48.gph", replace
scatter birthweight_mean iter, c(1)
graph save "Graph" "[pathname]/m4_birthweight.gph", replace
scatter tctspc11_mean iter, c(1)
graph save "Graph" "[pathname]/m4_tctspc11.gph", replace
scatter tctspc15_mean iter, c(1)
graph save "Graph" "[pathname]/m4_tctspc15.gph", replace
scatter y6_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y6anydis.gph", replace
scatter y6_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y6anyanx.gph", replace
scatter y6_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y6anydep.gph", replace
scatter y6_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y6anyadhd.gph", replace
scatter y6_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y6anycd.gph", replace
scatter y11_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y11anydis.gph", replace
scatter y11_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y11anyanx.gph", replace
scatter y11_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y11anydep.gph", replace
scatter y11_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y11anyadhd.gph", replace
scatter y11_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m4_y11anycd.gph", replace

***************************************************

* MULTIPLE IMPUTATION MODEL 5: CTE @ AGE 18 *

use "finaldata.dta", clear
save "miM5.dta", replace

xtset, clear
mi set flong
mi stset, clear
mi register regular sex msmoking mmarital malcohol fincome
mi register imputed y18_cte y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd methnicity meduc mdep12 tcbcl48 birthweight tctspc6 tctspc11 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd

//dry run model
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y18_cte ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y18_cte `y6' `y11' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//convergence checks
logistic y18_cte fincome meduc i.methnicity mdep12 tcbcl48 tctspc11 tctspc6 i.y18_anydep i.y18_anydis i.y18_anyadhd i.y18_anyanx i.y18_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anydis fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anydis y18_cte i.y11_anydis i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anyanx fincome meduc i.methnicity mdep12 tcbcl48 y18_cte i.y11_anyanx i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anydep fincome meduc i.methnicity mdep12 tcbcl48 y18_cte i.y11_anydep i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anyadhd fincome meduc i.methnicity mdep12 tcbcl48 y18_cte i.y11_anyadhd i.msmoking i.mmarital i.malcohol if _mi_m==0
logistic y18_anycd fincome meduc i.methnicity mdep12 tcbcl48 i.y6_anycd y18_cte i.y11_anycd i.msmoking i.mmarital i.malcohol if _mi_m==0

//m=10
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y18_cte ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y18_cte `y6' `y11' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(10) rseed(10) by(sex) noisily 

//m=100
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y18_cte ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y18_cte `y6' `y11' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(100) rseed(10) by(sex) noisily 
	
* DATA EXPLORATION *
summarize _mi_id _mi_miss _mi_m

//compare mean and summary stats for the original data and compare it with imputed data
tab _mi_m, summarize(y18_cte)
tab _mi_m, summarize(y18_anydis) 
tab _mi_m, summarize(y18_anyanx) 
tab _mi_m, summarize(y18_anydep) 
tab _mi_m, summarize(y18_anyadhd) 
tab _mi_m, summarize(y18_anycd) 
tab _mi_m, summarize(methnicity) 
tab _mi_m, summarize(meduc) 
tab _mi_m, summarize(mdep12)
tab _mi_m, summarize(tcbcl48)
tab _mi_m, summarize(birthweight)
tab _mi_m, summarize(tctspc6)
tab _mi_m, summarize(tctspc11)
tab _mi_m, summarize(y6_anydis)
tab _mi_m, summarize(y6_anyanx)
tab _mi_m, summarize(y6_anydep)
tab _mi_m, summarize(y6_anyadhd)
tab _mi_m, summarize(y6_anycd)
tab _mi_m, summarize(y11_anydis)
tab _mi_m, summarize(y11_anyanx) 
tab _mi_m, summarize(y11_anydep) 
tab _mi_m, summarize(y11_anyadhd) 
tab _mi_m, summarize(y11_anycd) 

//Monte Carlo Error - check whether the Monte Carlo error of B is approximately 10 per cent of its standard error (so one value below coefficient vs SE of the coefficient)
mi estimate, mcerror: logistic y18_anydis y18_cte 
mi estimate, mcerror: logistic y18_anyanx y18_cte 
mi estimate, mcerror: logistic y18_anydep y18_cte 
mi estimate, mcerror: logistic y18_anyadhd y18_cte 
mi estimate, mcerror: logistic y18_anycd y18_cte 
mi estimate, mcerror: logistic y18_anydis y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anyanx y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anydep y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anyadhd y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome 
mi estimate, mcerror: logistic y18_anycd y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
mi estimate, mcerror: logistic y18_anydis y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anyanx y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anydep y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
mi estimate, mcerror: logistic y18_anyadhd y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48 
mi estimate, mcerror: logistic y18_anycd y18_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48

* IMPUTATION CHECKS *
//checking imputation process to see if need more cycles of chained equations algorithm
use "miM5.dta", clear
save "miM5_trace.dta", replace 

//note: savetrace cannot be combined with the by() command
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local y18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local auxiliary "birthweight tctspc6 tctspc11"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) y18_cte ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `auxiliary' i.sex)) y18_anycd ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex)) tcbcl48 ///
(pmm, knn(10) omit(y18_cte `y6' `y11' `y18' mdep12 tctspc6 tctspc11 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `y18' meduc i.methnicity birthweight i.sex)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `y18' birthweight i.sex)) tctspc11 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `y18' i.sex y18_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, rseed(100) chainonly burnin(100) savetrace(m5_imptrace)	

//check scatterplots for convergence
use m5_imptrace
scatter y18_cte_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y18cte.gph", replace
scatter y18_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y18anydis.gph", replace
scatter y18_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y18anyanx.gph", replace
scatter y18_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y18anydep.gph", replace
scatter y18_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y18anyadhd.gph", replace
scatter y18_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y18anycd.gph", replace
scatter methnicity_mean iter, c(1)
graph save "Graph" "[pathname]/m5_methnicity.gph", replace
scatter meduc_mean iter, c(1)
graph save "Graph" "[pathname]/m5_meduc.gph", replace
scatter mdep12_mean iter, c(1)
graph save "Graph" "[pathname]/m5_mdep12.gph", replace
scatter tcbcl48_mean iter, c(1)
graph save "Graph" "[pathname]/m5_tcbcl48.gph", replace
scatter birthweight_mean iter, c(1)
graph save "Graph" "[pathname]/m5_birthweight.gph", replace
scatter tctspc6_mean iter, c(1)
graph save "Graph" "[pathname]/m5_tctspc6.gph", replace
scatter tctspc11_mean iter, c(1)
graph save "Graph" "[pathname]/m5_tctspc11.gph", replace
scatter y6_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y6anydis.gph", replace
scatter y6_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y6anyanx.gph", replace
scatter y6_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y6anydep.gph", replace
scatter y6_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y6anyadhd.gph", replace
scatter y6_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y6anycd.gph", replace
scatter y11_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y11anydis.gph", replace
scatter y11_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y11anyanx.gph", replace
scatter y11_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y11anydep.gph", replace
scatter y11_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y11anyadhd.gph", replace
scatter y11_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m5_y11anycd.gph", replace

***************************************************

* MULTIPLE IMPUTATION MODEL 6: SENSITIVITY ANALYSES *

//correlations
tetrachoric y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper sex mmarital methnicity malcohol msmoking y6_anydis y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd, pw stats(rho se obs p)

spearman y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper a15_cte p15_cte sex mmarital methnicity malcohol meduc fincome msmoking mdep12 tcbcl48 y6_anydis y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd birthweight tctspc6 tctspc11 tctspc15, stats(rho p)

use "finaldata.dta", clear
save "miM6.dta", replace

xtset, clear
mi set flong
mi stset, clear
mi register regular sex msmoking mmarital malcohol fincome
mi register imputed y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper a15_cte p15_cte methnicity meduc mdep12 tcbcl48 y6_anydis y6_anyanx y6_anydep y6_anyadhd y6_anycd y11_anydis y11_anyanx y11_anydep y11_anyadhd y11_anycd birthweight tctspc6 tctspc11 tctspc15

//dry run model
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local a18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local p18 "i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper"
local auxiliary "birthweight tctspc6 tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex tctspc15)) a15_cte ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) p15_cte ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqhyper `auxiliary' i.sex)) y18_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqtotal ///
(logit, omit(i.y18_anydis i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqemotion ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqconduct ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct `auxiliary' i.sex)) y18_sdqhyper ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 tctspc15 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex tctspc15)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) tcbcl48 ///
(pmm, knn(10) omit(a15_cte p15_cte `y6' `y11' `a18' `p18' mdep12 tctspc6 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' p15_cte meduc i.methnicity birthweight i.sex tctspc15)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' p15_cte birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' a15_cte birthweight i.sex meduc mdep12)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, dryrun
	
//convergence checks
logistic a15_cte meduc i.methnicity mdep12 tcbcl48 tctspc11 tctspc6 i.y18_anydep i.y18_anydis i.y18_anyadhd i.y18_anyanx i.y18_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqtotal i.y18_sdqhyper p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic p15_cte meduc i.methnicity mdep12 tcbcl48 tctspc11 tctspc6 i.y18_anydep i.y18_anydis i.y18_anyadhd i.y18_anyanx i.y18_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqtotal i.y18_sdqhyper a15_cte tctspc15 i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anydis meduc i.methnicity mdep12 tcbcl48 i.y6_anydis i.y11_anydis i.y18_sdqtotal a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anyanx meduc i.methnicity mdep12 tcbcl48 i.y11_anyanx i.y18_sdqemotion a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anydep meduc i.methnicity mdep12 tcbcl48 i.y11_anydep i.y18_sdqemotion a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anyadhd meduc i.methnicity mdep12 tcbcl48 i.y11_anyadhd i.y18_sdqhyper a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_anycd meduc i.methnicity mdep12 tcbcl48 i.y6_anycd i.y11_anycd i.y18_sdqconduct a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_sdqtotal meduc i.methnicity mdep12 tcbcl48 i.y6_anydis i.y11_anydis i.y18_anydis a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_sdqemotion meduc i.methnicity mdep12 tcbcl48 i.y11_anyanx i.y11_anydep i.y18_anydep i.y18_anyanx a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_sdqconduct meduc i.methnicity mdep12 tcbcl48 i.y6_anycd i.y11_anycd i.y18_anycd a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0
logistic y18_sdqhyper meduc i.methnicity mdep12 tcbcl48 i.y11_anyadhd i.y18_anyadhd a15_cte p15_cte i.msmoking i.mmarital i.malcohol fincome if _mi_m==0

//m=10
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local a18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local p18 "i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper"
local auxiliary "birthweight tctspc6 tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex tctspc15)) a15_cte ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) p15_cte ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqhyper `auxiliary' i.sex)) y18_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqtotal ///
(logit, omit(i.y18_anydis i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqemotion ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqconduct ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct `auxiliary' i.sex)) y18_sdqhyper ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 tctspc15 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex tctspc15)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) tcbcl48 ///
(pmm, knn(10) omit(a15_cte p15_cte `y6' `y11' `a18' `p18' mdep12 tctspc6 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' p15_cte meduc i.methnicity birthweight i.sex tctspc15)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' p15_cte birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' a15_cte birthweight i.sex meduc mdep12)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(10) rseed(100) by(sex) noisily 

//m=100
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local a18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local p18 "i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper"
local auxiliary "birthweight tctspc6 tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex tctspc15)) a15_cte ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) p15_cte ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqhyper `auxiliary' i.sex)) y18_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqtotal ///
(logit, omit(i.y18_anydis i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqemotion ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqconduct ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct `auxiliary' i.sex)) y18_sdqhyper ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 tctspc15 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex tctspc15)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) tcbcl48 ///
(pmm, knn(10) omit(a15_cte p15_cte `y6' `y11' `a18' `p18' mdep12 tctspc6 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' p15_cte meduc i.methnicity birthweight i.sex tctspc15)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' p15_cte birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' a15_cte birthweight i.sex meduc mdep12)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, add(100) rseed(100) by(sex) noisily 
	
* DATA EXPLORATION *
summarize _mi_id _mi_miss _mi_m

//compare mean and summary stats for the original data and compare it with imputed data
tab _mi_m, summarize(a15_cte)
tab _mi_m, summarize(p15_cte)
tab _mi_m, summarize(y18_anydis) 
tab _mi_m, summarize(y18_anyanx) 
tab _mi_m, summarize(y18_anydep) 
tab _mi_m, summarize(y18_anyadhd) 
tab _mi_m, summarize(y18_anycd) 
tab _mi_m, summarize(y18_sdqtotal)
tab _mi_m, summarize(y18_sdqemotion)
tab _mi_m, summarize(y18_sdqconduct)
tab _mi_m, summarize(y18_sdqhyper)
tab _mi_m, summarize(methnicity) 
tab _mi_m, summarize(meduc) 
tab _mi_m, summarize(mdep12)
tab _mi_m, summarize(tcbcl48)
tab _mi_m, summarize(birthweight)
tab _mi_m, summarize(tctspc6)
tab _mi_m, summarize(tctspc11)
tab _mi_m, summarize(tctspc15)
tab _mi_m, summarize(y6_anydis)
tab _mi_m, summarize(y6_anyanx)
tab _mi_m, summarize(y6_anydep)
tab _mi_m, summarize(y6_anyadhd)
tab _mi_m, summarize(y6_anycd)
tab _mi_m, summarize(y11_anydis)
tab _mi_m, summarize(y11_anyanx) 
tab _mi_m, summarize(y11_anydep) 
tab _mi_m, summarize(y11_anyadhd) 
tab _mi_m, summarize(y11_anycd) 

//Monte Carlo Error - check whether the Monte Carlo error of B is approximately 10 per cent of its standard error (so one value below coefficient vs SE of the coefficient)
foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, mcerror: logistic `var' a15_cte
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, mcerror: logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, mcerror: logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, mcerror: logistic `var' p15_cte
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, mcerror: logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, mcerror: logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, mcerror: logistic `var' p15_cte
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, mcerror: logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
}

foreach var of varlist y18_anydis y18_anyanx y18_anydep y18_anyadhd y18_anycd {
	mi estimate, mcerror: logistic `var' p15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, mcerror: logistic `var' a15_cte
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, mcerror: logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome
}

foreach var of varlist y18_sdqtotal y18_sdqemotion y18_sdqconduct y18_sdqhyper {
	mi estimate, mcerror: logistic `var' a15_cte i.sex i.msmoking i.mmarital i.malcohol i.methnicity meduc mdep12 fincome tcbcl48
}

* IMPUTATION CHECKS *
//checking imputation process to see if need more cycles of chained equations algorithm
use "miM6.dta", clear
save "miM6_trace.dta", replace 

//note: savetrace cannot be combined with the by() command
local y6 "i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd"
local y11 "i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd"
local a18 "i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd"
local p18 "i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper"
local auxiliary "birthweight tctspc6 tctspc11 tctspc15"

set more off
mi impute chained ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex tctspc15)) a15_cte ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex)) p15_cte ///
(logit, omit(i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anydis ///
(logit, omit(i.y18_anydis i.y18_anydep i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anyanx ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_anydep ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct `auxiliary' i.sex)) y18_anyadhd ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqhyper `auxiliary' i.sex)) y18_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y18_anycd i.y18_sdqemotion i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqtotal ///
(logit, omit(i.y18_anydis i.y18_anyadhd i.y18_anycd `y6' i.y11_anydis i.y11_anyadhd i.y11_anycd i.y18_sdqtotal i.y18_sdqconduct i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqemotion ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anyadhd i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqhyper `auxiliary' i.sex)) y18_sdqconduct ///
(logit, omit(i.y18_anydis i.y18_anyanx i.y18_anydep i.y18_anycd `y6' i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd i.y18_sdqtotal i.y18_sdqemotion i.y18_sdqconduct `auxiliary' i.sex)) y18_sdqhyper ///
(logit, omit(`y6' `y11' tctspc6 i.sex)) methnicity ///
(pmm, knn(10) omit(`y6' `y11' tctspc6 tctspc15 i.sex)) meduc ///
(pmm, knn(10) omit(`y6' `y11' birthweight i.sex tctspc15)) mdep12 ///
(pmm, knn(10) omit(`y6' `y11' i.sex tctspc15)) tcbcl48 ///
(pmm, knn(10) omit(a15_cte p15_cte `y6' `y11' `a18' `p18' mdep12 tctspc6 tctspc11 tctspc15 i.sex)) birthweight ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' p15_cte meduc i.methnicity birthweight i.sex tctspc15)) tctspc6 ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' p15_cte birthweight i.sex)) tctspc11 ///
(pmm, knn(10) omit(`y6' `y11' `a18' `p18' a15_cte birthweight i.sex meduc mdep12)) tctspc15 ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary' i.malcohol)) y6_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y6_anycd ///
(logit, omit(i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anyanx i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydis ///
(logit, omit(i.y6_anydis i.y6_anydep i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anydep i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyanx ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anyadhd i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anyadhd i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anydep ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anycd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anycd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anyadhd ///
(logit, omit(i.y6_anydis i.y6_anyanx i.y6_anydep i.y6_anyadhd i.y11_anydis i.y11_anyanx i.y11_anydep i.y11_anyadhd `a18' `p18' i.sex a15_cte p15_cte i.methnicity meduc mdep12 tcbcl48 `auxiliary')) y11_anycd ///
	= i.sex i.msmoking i.mmarital i.malcohol fincome, rseed(100) chainonly burnin(100) savetrace(m6_imptrace)	

//check scatterplots for convergence
use m6_imptrace
scatter a15_cte_mean iter, c(1)
graph save "Graph" "[pathname]/m6_a15cte.gph", replace
scatter p15_cte_mean iter, c(1)
graph save "Graph" "[pathname]/m6_p15cte.gph", replace
scatter y18_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y18anydis.gph", replace
scatter y18_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y18anyanx.gph", replace
scatter y18_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y18anydep.gph", replace
scatter y18_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y18anyadhd.gph", replace
scatter y18_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y18anycd.gph", replace
scatter y18_sdqtotal_mean iter, c(1)
graph save "Graph" "[pathname]/m6_p18total.gph", replace
scatter y18_sdqemotion_mean iter, c(1)
graph save "Graph" "[pathname]/m6_p18emotion.gph", replace
scatter y18_sdqconduct_mean iter, c(1)
graph save "Graph" "[pathname]/m6_p18conduct.gph", replace
scatter y18_sdqhyper_mean iter, c(1)
graph save "Graph" "[pathname]/m6_p18hyper.gph", replace
scatter methnicity_mean iter, c(1)
graph save "Graph" "[pathname]/m6_methnicity.gph", replace
scatter meduc_mean iter, c(1)
graph save "Graph" "[pathname]/m6_meduc.gph", replace
scatter mdep12_mean iter, c(1)
graph save "Graph" "[pathname]/m6_mdep12.gph", replace
scatter tcbcl48_mean iter, c(1)
graph save "Graph" "[pathname]/m6_tcbcl48.gph", replace
scatter birthweight_mean iter, c(1)
graph save "Graph" "[pathname]/m6_birthweight.gph", replace
scatter tctspc6_mean iter, c(1)
graph save "Graph" "[pathname]/m6_tctspc6.gph", replace
scatter tctspc11_mean iter, c(1)
graph save "Graph" "[pathname]/m6_tctspc11.gph", replace
scatter tctspc15_mean iter, c(1)
graph save "Graph" "[pathname]/m6_tctspc15.gph"
scatter y6_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y6anydis.gph", replace
scatter y6_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y6anyanx.gph", replace
scatter y6_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y6anydep.gph", replace
scatter y6_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y6anyadhd.gph", replace
scatter y6_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y6anycd.gph", replace
scatter y11_anydis_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y11anydis.gph", replace
scatter y11_anyanx_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y11anyanx.gph", replace
scatter y11_anydep_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y11anydep.gph", replace
scatter y11_anyadhd_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y11anyadhd.gph", replace
scatter y11_anycd_mean iter, c(1)
graph save "Graph" "[pathname]/m6_y11anycd.gph", replace

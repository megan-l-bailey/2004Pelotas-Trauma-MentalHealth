Stata code used for imputation and analyses for the manuscript entitled: "Associations between childhood trauma and adolescent psychiatric disorders in the 2004 Pelotas Birth Cohort". The study aimed to investigate cross-sectional and longitudinal associations between childhood trauma exposure and adolescent psychiatric disorders in Brazilian adolescents at ages 15 and 18. Key analyses are as follows:
  1. Logitistic regression - Exposure: cumulative trauma up to age 15; Outcomes: psychiatric disorders at age 15 [cross-sectional].
  2. Logitistic regression - Exposure: cumulative trauma up to age 18; Outcomes: psychiatric disorders at age 18 [cross-sectional].
  3. Population attributable fractions - Exposure: trauma exposure up to age 18 (binary); Outcomes: psychiatric disorders at age 18 [cross-sectional].
  4. Logitistic regression - Exposure: cumulative trauma up to age 11; Outcomes: psychiatric disorders at age 15 [longitudinal].
  5. Logitistic regression - Exposure: cumulative trauma up to age 11; Outcomes: psychiatric disorders at age 18 [longitudinal].
  6. Logitistic regression - Exposure: cumulative trauma up to age 15; Outcomes: psychiatric disorders at age 18 [longitudinal].
  7. Sensitivity analyses to examine sex differences.
  8. Sensitivity analyses to examine potential informant effects.

The following confounders were adjusted for in all analyses: child sex, maternal ethnicity, maternal marital status at birth, maternal alcohol consumption during pregnancy, maternal smoking during pregnancy, maternal years of education at birth, maternal depression at 12-months postpartum, monthly family income at birth, and existing child emotional and behavioural problems at age 4.

There are three Stata do-files:
  1. "Imputation.do": Stata code to run six imputation models (due to perfect prediction errors).
  2. "Imputed_Analyses.do": Stata code to run the above analyses on imputed data (N=4229).
  3. "Complete_Case_Analyses.do": Stata code to run the above analyses using complete cases.

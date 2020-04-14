** CHC EPILEPSY ALGORITHM

** PLEASE READ THE ASSOCIATED WORD DOCUMENT WHICH DESCRIBES
** THE FILTERING APPLIED TO THE DATASET TO RESTRICT IT TO
** EMERGENCY ADMISSIONS, MEDICAL SPECIALTIES AND FINAL 
** EPISODES OF SPELLS BEFORE APPLYING THE ALGORITHM

** EPILEPSY CODES G40X OR G41X IN PRIMARY POSITION
generate ep_g_codes_prim = 0

foreach var of varlist diag_primary_icd {

replace ep_g_codes_prim = 1 if `var'=="G400" |`var'=="G401" |`var'=="G402" |`var'=="G403" |`var'=="G404" |`var'=="G405" |`var'=="G406" |`var'=="G407" |`var'=="G408" |`var'=="G409" |`var'=="G410" |`var'=="G411" |`var'=="G412" |`var'=="G418" |`var'=="G419" 

}

** EPILEPSY CODES G40X OR G41X IN SECONDARY POSITION 
** NB THIS .DO FILE HAS BEEN DESIGNED FOR USE ON A
** DATASET THAT HAS 12 SECONDARY POSITIONS WITH THE
** NAMING CONVENTION diag_nth_secondary_icd
generate ep_g_codes_second = 0

foreach var of varlist diag_1st_secondary_icd diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd  {

replace ep_g_codes_second = 1 if `var'=="G400" |`var'=="G401" |`var'=="G402" |`var'=="G403" |`var'=="G404" |`var'=="G405" |`var'=="G406" |`var'=="G407" |`var'=="G408" |`var'=="G409" |`var'=="G410" |`var'=="G411" |`var'=="G412" |`var'=="G418" |`var'=="G419" 

}

** ASSOCIATED CODES IN PRIMARY POSITION THAT WOULD INDICATE
** A LIKELY EPILEPS ADMISSION IF THERE ARE G40X OR G41X CODES 
** IN ONE OR MORE OF THE SECODNARY POSITIONS
generate ep_assoc_codes = 0

foreach var of varlist diag_primary_icd {

replace ep_assoc_codes = 1 if `var'=="F019" |`var'=="F100" |`var'=="F101" |`var'=="F102" |`var'=="F103" |`var'=="F104" |`var'=="F419" |`var'=="G439" |`var'=="H538" |`var'=="J690" |`var'=="K292" |`var'=="R402" |`var'=="R410" |`var'=="R418" |`var'=="R42X" |`var'=="R451" | ///
`var'=="R51X" |`var'=="R55X" |`var'=="R600" |`var'=="R798" |`var'=="S000" |`var'=="S001" |`var'=="S008" |`var'=="S009" |`var'=="S010" |`var'=="S018" |`var'=="S019" | `var'=="S099" |`var'=="S308" |`var'=="Z038" |`var'=="Z739" 

}


generate epstat = 0

replace epstat = 2 if ep_g_codes_prim==1

replace epstat = 2 if diag_primary_icd=="R568" & ep_g_codes_second==1

replace epstat = 1 if ep_assoc_codes==1 & ep_g_codes_second==1


generate epstat1 = 0

replace epstat1 = 1 if epstat>0


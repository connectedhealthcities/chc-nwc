** CHC COPD algorithm

** PLEASE READ THE ASSOCIATED WORD DOCUMENT WHICH DESCRIBES
** THE FILTERING APPLIED TO THE DATASET TO RESTRICT IT TO
** EMERGENCY ADMISSIONS, MEDICAL SPECIALTIES AND FINAL 
** EPISODES OF SPELLS BEFORE APPLYING THE ALGORITHM

gen diag_icd_1 = diag_primary_icd

gen diag_icd_2 = diag_1st_secondary_icd

gen diag_icd_3 = diag_2nd_secondary_icd


forval i=1(1)3 {

** STATUS 1, 2 and 3

gen status`i' = 0

replace status`i' = 1 if diag_icd_`i' == "J40X" | diag_icd_`i' == "J410" | diag_icd_`i' == "J411" | diag_icd_`i' == "J418" | diag_icd_`i' == "J42X" | diag_icd_`i' == "J430" | diag_icd_`i' == "J431" | diag_icd_`i' == "J432" | diag_icd_`i' == "J438" | diag_icd_`i' == "J439" | diag_icd_`i' == "J440" | diag_icd_`i' == "J441" | diag_icd_`i' == "J448" | diag_icd_`i' == "J449" 

replace status`i' = 2 if diag_icd_`i' == "B59X" | diag_icd_`i' == "J100" | diag_icd_`i' == "J101" | diag_icd_`i' == "J108" | diag_icd_`i' == "J110" | diag_icd_`i' == "J111" | diag_icd_`i' == "J118" | diag_icd_`i' == "J120" | diag_icd_`i' == "J121" | diag_icd_`i' == "J122" | diag_icd_`i' == "J128" | diag_icd_`i' == "J129" | diag_icd_`i' == "J13X" | diag_icd_`i' == "J14X" | diag_icd_`i' == "J150" | /// 
 diag_icd_`i' == "J151" | diag_icd_`i' == "J152" | diag_icd_`i' == "J153" | diag_icd_`i' == "J154" | diag_icd_`i' == "J154" | diag_icd_`i' == "J155" | diag_icd_`i' == "J156" | diag_icd_`i' == "J157" | diag_icd_`i' == "J158" | diag_icd_`i' == "J159" | diag_icd_`i' == "J160" | diag_icd_`i' == "J168" | diag_icd_`i' == "J170" | diag_icd_`i' == "J171" | ///
 diag_icd_`i' == "J172" | diag_icd_`i' == "J173" | diag_icd_`i' == "J178" | diag_icd_`i' == "J180" | diag_icd_`i' == "J181" | diag_icd_`i' == "J182" | diag_icd_`i' == "J188" | diag_icd_`i' == "J189" | diag_icd_`i' == "J200" | diag_icd_`i' == "J201" | diag_icd_`i' == "J202" | diag_icd_`i' == "J203" | diag_icd_`i' == "J204" | diag_icd_`i' == "J205" | ///
 diag_icd_`i' == "J206" | diag_icd_`i' == "J207" | diag_icd_`i' == "J208" | diag_icd_`i' == "J209" | diag_icd_`i' == "J210" | diag_icd_`i' == "J218" | diag_icd_`i' == "J219" | diag_icd_`i' == "J22X" | diag_icd_`i' == "J690" | diag_icd_`i' == "J851" | diag_icd_`i' == "J852" | diag_icd_`i' == "J860" | diag_icd_`i' == "J869" 

replace status`i' = 3 if diag_icd_`i' == "R042" | diag_icd_`i' == "R048" | diag_icd_`i' == "R05X" | diag_icd_`i' == "R060" | diag_icd_`i' == "R062" | diag_icd_`i' == "R064" | diag_icd_`i' == "R066" | diag_icd_`i' == "R068" | diag_icd_`i' == "R070" | diag_icd_`i' == "R071" | diag_icd_`i' == "R072" | diag_icd_`i' == "R073" | diag_icd_`i' == "R074" | diag_icd_`i' == "R091" | /// 
 diag_icd_`i' == "R092" | diag_icd_`i' == "R093" | diag_icd_`i' == "R098" | diag_icd_`i' == "R202" | diag_icd_`i' == "R208" | diag_icd_`i' == "R232" | diag_icd_`i' == "R233" | diag_icd_`i' == "R400" | diag_icd_`i' == "R401" | diag_icd_`i' == "R402" | diag_icd_`i' == "R460" | diag_icd_`i' == "R500" | diag_icd_`i' == "R509" | diag_icd_`i' == "R51X" | ///
 diag_icd_`i' == "R600" | diag_icd_`i' == "R601" | diag_icd_`i' == "R609"  

}


gen statusoutcome = 0

replace statusoutcome = 7 if status1== 2 & status2== 2 & status3== 1 
replace statusoutcome = 6 if status1== 3 & status2== 3 & status3== 1 
replace statusoutcome = 5 if status1== 2 & status2== 3 & status3== 1 
replace statusoutcome = 4 if status1== 3 & status2== 2 & status3== 1
replace statusoutcome = 3 if status1== 3 & status2== 1 
replace statusoutcome = 2 if status1== 2 & status2== 1 
replace statusoutcome = 1 if status1== 1 

gen copdcategory = 0

replace copdcategory = 1 if statusoutcome == 1
replace copdcategory = 2 if statusoutcome == 2 | statusoutcome == 4 | statusoutcome == 5 | statusoutcome == 7 
replace copdcategory = 3 if statusoutcome == 3 | statusoutcome == 6 


gen copdcat1 = 0

replace copdcat1 = 1 if copdcategory>0 & copdcategory!=.
 

drop diag_icd_1 diag_icd_2 diag_icd_3

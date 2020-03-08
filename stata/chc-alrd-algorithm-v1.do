* Connected Health Cities ARLD Algorithm v1.0

**General logic
**Several conditions which need to be satisfied in order to generate a flag for a particular category

**generate condition a = 0
**replace condition a = 1 if condition satisfied
**generate condition b = 0
**replace condition b = 1 if condition satisfied
**generate condition c = 0
**replace condition c = 1 if condition satisfied

**generate category A = 0
**replace category A = 1 if condition a satisfied & condition b satisfied & condition c satisfied

**drop condition a condition b condition c

**tabulate to check


**ARLD Category 1

generate arld_cat1 = 0

foreach var of varlist diag_primary_icd {

replace arld_cat1 = 1 if `var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"

}

label variable arld_cat1 "ARLD Algorithm Iteration Jul 2019 - Category 1"

tabulate arld_cat1



**ARLD Category 2

generate arld_cat2_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat2_a = 1 if `var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K766"|`var'=="K767"|`var'=="K768"|`var'=="K769"|`var'=="K778"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"

}

generate arld_cat2_b = 0

foreach var of varlist diag_1st_secondary_icd {

replace arld_cat2_b = 1 if `var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"

}

generate arld_cat2 = 0

replace arld_cat2 = 1 if arld_cat2_a==1 & arld_cat2_b==1

drop arld_cat2_a arld_cat2_b


label variable arld_cat2 "ARLD Algorithm Iteration Jul 2019 - Category 2"

tabulate arld_cat2




**ARLD Category 3

generate arld_cat3_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat3_a = 1 if `var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K766"|`var'=="K767"|`var'=="K768"|`var'=="K769"|`var'=="K778"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"

}


generate arld_cat3_b = 0

foreach var of varlist diag_1st_secondary_icd {

replace arld_cat3_b = 1 if `var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K766"|`var'=="K767"|`var'=="K768"|`var'=="K769"|`var'=="K778"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"

}


generate arld_cat3_c = 0

foreach var of varlist diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat3_c = 1 if `var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"

}


generate arld_cat3 = 0

replace arld_cat3 = 1 if arld_cat3_a==1 & arld_cat3_b==1 & arld_cat3_c==1

drop arld_cat3_a arld_cat3_b arld_cat3_c


label variable arld_cat3 "ARLD Algorithm Iteration Jul 2019 - Category 3"

tabulate arld_cat3




**ARLD Category 4

generate arld_cat4_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat4_a = 1 if `var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K766"|`var'=="K767"|`var'=="K768"|`var'=="K769"|`var'=="K778"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"

}

generate arld_cat4_b = 0

foreach var of varlist diag_1st_secondary_icd {

replace arld_cat4_b = 1 if `var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"

}

generate arld_cat4_c = 0

foreach var of varlist diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat4_c = 1 if `var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"

}


generate arld_cat4 = 0

replace arld_cat4 = 1 if arld_cat4_a==1 & arld_cat4_b==1 & arld_cat4_c==1

drop arld_cat4_a arld_cat4_b arld_cat4_c


label variable arld_cat4 "ARLD Algorithm Iteration Jul 2019 - Category 4"

tabulate arld_cat4


**ARLD Category 5

generate arld_cat5_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat5_a = 1 if `var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K766"|`var'=="K767"|`var'=="K768"|`var'=="K769"|`var'=="K778"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"

}

generate arld_cat5_b = 0

foreach var of varlist diag_1st_secondary_icd {

replace arld_cat5_b = 1 if `var'!="A418" & `var'!="A419" & `var'!="C220" & `var'!="D65X" & `var'!="D684" & `var'!="D688" & `var'!="D689" & `var'!="D695" & `var'!="D696" & `var'!="E46X" & `var'!="E86X" & `var'!="E871" & `var'!="E872" & `var'!="E876" & `var'!="E877" & `var'!="E878" & `var'!="E512" & `var'!="F058" & `var'!="F059" & `var'!="F100" & `var'!="F101" & `var'!="F102" & `var'!="F103" & `var'!="F104" & `var'!="F105" & `var'!="F106" & `var'!="F107" & `var'!="F108" & `var'!="F109" & `var'!="G92X" & `var'!="G934" & `var'!="G312" & `var'!="G621" & `var'!="G721" & `var'!="I81X" & `var'!="I850" & `var'!="I859" & `var'!="I864" & `var'!="I951" & `var'!="I959" & `var'!="I982" & `var'!="I983" & `var'!="I426" & `var'!="K292" & `var'!="K625" & `var'!="K658" & `var'!="K659" & `var'!="K700" & `var'!="K701" & `var'!="K702" & `var'!="K703" & `var'!="K704" & `var'!="K709" & `var'!="K710" & `var'!="K711" & `var'!="K712" & `var'!="K713" & `var'!="K714" & `var'!="K715" & `var'!="K716" & `var'!="K717" & `var'!="K718" & `var'!="K719" & `var'!="K720" & `var'!="K721" & `var'!="K729" & `var'!="K730" & `var'!="K731" & `var'!="K732" & `var'!="K738" & `var'!="K739" & `var'!="K740" & `var'!="K741" & `var'!="K742" & `var'!="K746" & `var'!="K752" & `var'!="K758" & `var'!="K759" & `var'!="K760" & `var'!="K762" & `var'!="K763" & `var'!="K766" & `var'!="K767" & `var'!="K768" & `var'!="K769" & `var'!="K778" & `var'!="K852" & `var'!="K860" & `var'!="K920" & `var'!="K921" & `var'!="K922" & `var'!="N170" & `var'!="N171" & `var'!="N172" & `var'!="N179" & `var'!="N19X" & `var'!="R101" & `var'!="R103" & `var'!="R104" & `var'!="R160" & `var'!="R17X" & `var'!="R18X" & `var'!="R190" & `var'!="R402" & `var'!="R410" & `var'!="R441" & `var'!="R600" & `var'!="R609" & `var'!="R630" & `var'!="R932" & `var'!="R945" & `var'!="T510" & `var'!="T518" & `var'!="T519" & `var'!="Y910" & `var'!="Y911" & `var'!="Y912" & `var'!="Y913" & `var'!="Y919" & `var'!="Z714"

}

generate arld_cat5_c = 0

foreach var of varlist diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat5_c = 1 if `var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"

}

generate arld_cat5 = 0

replace arld_cat5 = 1 if arld_cat5_a==1 & arld_cat5_b==1 & arld_cat5_c==1

drop arld_cat5_a arld_cat5_b arld_cat5_c


label variable arld_cat5 "ARLD Algorithm Iteration Jul 2019 - Category 5"

tabulate arld_cat5



**ARLD Category 6

generate arld_cat6_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat6_a = 1 if `var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"

}

generate arld_cat6_b = 0

foreach var of varlist diag_1st_secondary_icd {

replace arld_cat6_b = 1 if `var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K766"|`var'=="K767"|`var'=="K768"|`var'=="K769"|`var'=="K778"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"

}

generate arld_cat6_c = 0

foreach var of varlist diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat6_c = 1 if `var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"

}

generate arld_cat6 = 0

replace arld_cat6 = 1 if arld_cat6_a==1 & arld_cat6_b==1 & arld_cat6_c==1

drop arld_cat6_a arld_cat6_b arld_cat6_c



label variable arld_cat6 "ARLD Algorithm Iteration Jul 2019 - Category 6"

tabulate arld_cat6



**ARLD Category 7

generate arld_cat7_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat7_a = 1 if `var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K768"|`var'=="K769"|`var'=="K778"

}

generate arld_cat7_b = 0

foreach var of varlist diag_1st_secondary_icd {

replace arld_cat7_b = 1 if `var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K766"|`var'=="K767"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"

}

generate arld_cat7_c = 0

foreach var of varlist diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat7_c = 1 if `var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"

}

generate arld_cat7 = 0

replace arld_cat7 = 1 if arld_cat7_a==1 & arld_cat7_b==1 & arld_cat7_c==1

drop arld_cat7_a arld_cat7_b arld_cat7_c



label variable arld_cat7 "ARLD Algorithm Iteration Jul 2019 - Category 7"

tabulate arld_cat7



**ARLD Category 8

generate arld_cat8_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat8_a = 1 if `var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K766"|`var'=="K767"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"

}

generate arld_cat8_b = 0

foreach var of varlist diag_1st_secondary_icd {

replace arld_cat8_b = 1 if `var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K768"|`var'=="K769"|`var'=="K778"

}

generate arld_cat8_c = 0

foreach var of varlist diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat8_c = 1 if `var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"

}

generate arld_cat8 = 0

replace arld_cat8 = 1 if arld_cat8_a==1 & arld_cat8_b==1 & arld_cat8_c==1

drop arld_cat8_a arld_cat8_b arld_cat8_c



label variable arld_cat8 "ARLD Algorithm Iteration Jul 2019 - Category 8"

tabulate arld_cat8




**ARLD Category 9

generate arld_cat9_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat9_a = 1 if `var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K768"|`var'=="K769"|`var'=="K778"

}

generate arld_cat9_b = 0

foreach var of varlist diag_1st_secondary_icd diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat9_b = 1 if `var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"

}

generate arld_cat9 = 0

replace arld_cat9 = 1 if arld_cat9_a==1 & arld_cat9_b==1

drop arld_cat9_a arld_cat9_b



label variable arld_cat9 "ARLD Algorithm Iteration Jul 2019 - Category 9"

tabulate arld_cat9



**ARLD Category 10

generate arld_cat10_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat10_a = 1 if `var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"

}

generate arld_cat10_b = 0

foreach var of varlist diag_1st_secondary_icd diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat10_b = 1 if `var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"

}

generate arld_cat10 = 0

replace arld_cat10 = 1 if arld_cat10_a==1 & arld_cat10_b==1

drop arld_cat10_a arld_cat10_b



label variable arld_cat10 "ARLD Algorithm Iteration Jul 2019 - Category 10"

tabulate arld_cat10




**ARLD Category 11

generate arld_cat11_a = 0

foreach var of varlist diag_primary_icd {

replace arld_cat11_a = 1 if `var'!="A418" & `var'!="A419" & `var'!="C220" & `var'!="D65X" & `var'!="D684" & `var'!="D688" & `var'!="D689" & `var'!="D695" & `var'!="D696" & `var'!="E46X" & `var'!="E86X" & `var'!="E871" & `var'!="E872" & `var'!="E876" & `var'!="E877" & `var'!="E878" & `var'!="E512" & `var'!="F058" & `var'!="F059" & `var'!="F100" & `var'!="F101" & `var'!="F102" & `var'!="F103" & `var'!="F104" & `var'!="F105" & `var'!="F106" & `var'!="F107" & `var'!="F108" & `var'!="F109" & `var'!="G92X" & `var'!="G934" & `var'!="G312" & `var'!="G621" & `var'!="G721" & `var'!="I81X" & `var'!="I850" & `var'!="I859" & `var'!="I864" & `var'!="I951" & `var'!="I959" & `var'!="I982" & `var'!="I983" & `var'!="I426" & `var'!="K292" & `var'!="K625" & `var'!="K658" & `var'!="K659" & `var'!="K700" & `var'!="K701" & `var'!="K702" & `var'!="K703" & `var'!="K704" & `var'!="K709" & `var'!="K710" & `var'!="K711" & `var'!="K712" & `var'!="K713" & `var'!="K714" & `var'!="K715" & `var'!="K716" & `var'!="K717" & `var'!="K718" & `var'!="K719" & `var'!="K720" & `var'!="K721" & `var'!="K729" & `var'!="K730" & `var'!="K731" & `var'!="K732" & `var'!="K738" & `var'!="K739" & `var'!="K740" & `var'!="K741" & `var'!="K742" & `var'!="K746" & `var'!="K752" & `var'!="K758" & `var'!="K759" & `var'!="K760" & `var'!="K762" & `var'!="K763" & `var'!="K766" & `var'!="K767" & `var'!="K768" & `var'!="K769" & `var'!="K778" & `var'!="K852" & `var'!="K860" & `var'!="K920" & `var'!="K921" & `var'!="K922" & `var'!="N170" & `var'!="N171" & `var'!="N172" & `var'!="N179" & `var'!="N19X" & `var'!="R101" & `var'!="R103" & `var'!="R104" & `var'!="R160" & `var'!="R17X" & `var'!="R18X" & `var'!="R190" & `var'!="R402" & `var'!="R410" & `var'!="R441" & `var'!="R600" & `var'!="R609" & `var'!="R630" & `var'!="R932" & `var'!="R945" & `var'!="T510" & `var'!="T518" & `var'!="T519" & `var'!="Y910" & `var'!="Y911" & `var'!="Y912" & `var'!="Y913" & `var'!="Y919" & `var'!="Z714"

}

generate arld_cat11_b = 0

foreach var of varlist diag_1st_secondary_icd diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace arld_cat11_b = 1 if `var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"

}

generate arld_cat11 = 0

replace arld_cat11 = 1 if arld_cat11_a==1 & arld_cat11_b==1

drop arld_cat11_a arld_cat11_b



label variable arld_cat11 "ARLD Algorithm Iteration Jul 2019 - Category 11"

tabulate arld_cat11



**ARLD simple - same as Category 1 (primary coded ARLD diagnosis)

generate arld_simp = 0

replace arld_simp = 1 if arld_cat1==1


label var arld_simp "ARLD primary"


**ARLD complex - from Categories 1-10 (algorithm identified ARLD - unmodified)

generate arld_comp = 0

replace arld_comp = 1 if arld_cat1==1 | arld_cat2==1 | arld_cat3==1 | arld_cat4==1 | arld_cat5==1 | arld_cat6==1 | arld_cat7==1 | arld_cat8==1 | arld_cat9==1 | arld_cat10==1

tabulate arld_comp


label var arld_comp "ARLD algorithm"


**Lower ARLD complex - Category 1 not satisfied and from Categories 2-10 (algorithm identified non-primary ARLD - unmodified)

generate low_arld_comp = 0

replace low_arld_comp = 1 if arld_cat1==0 & (arld_cat2==1 | arld_cat3==1 | arld_cat4==1 | arld_cat5==1 | arld_cat6==1 | arld_cat7==1 | arld_cat8==1 | arld_cat9==1 | arld_cat10==1)

tabulate low_arld_comp

label var low_arld_comp "ARLD uplift"


**Co-morbid ARLD - from Category 11

generate cmld = 0

replace cmld = 1 if arld_cat11==1

label var cmld "Co-morbid liver disease"



** alcohol flags (based on list 5)

gen prialc = 0

foreach var of varlist diag_primary_icd {

replace prialc = 1 if `var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"

}

label var prialc "Primary alcohol"


gen anyalc = 0

foreach var of varlist diag_primary_icd diag_1st_secondary_icd diag_2nd_secondary_icd diag_3rd_secondary_icd diag_4th_secondary_icd diag_5th_secondary_icd diag_6th_secondary_icd diag_7th_secondary_icd diag_8th_secondary_icd diag_9th_secondary_icd diag_10th_secondary_icd diag_11th_secondary_icd diag_12th_secondary_icd {

replace anyalc = 1 if `var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"

}

label var anyalc "Any alcohol"



**List 1 - specific ARLD codes

**`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"


**List 2 - liver complications codes + non specific liver disease codes

**`var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K766"|`var'=="K767"|`var'=="K768"|`var'=="K769"|`var'=="K778"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"


**List 3 - non specific liver disease codes

**`var'=="K710"|`var'=="K711"|`var'=="K712"|`var'=="K713"|`var'=="K714"|`var'=="K715"|`var'=="K716"|`var'=="K717"|`var'=="K718"|`var'=="K719"|`var'=="K720"|`var'=="K721"|`var'=="K729"|`var'=="K730"|`var'=="K731"|`var'=="K732"|`var'=="K738"|`var'=="K739"|`var'=="K740"|`var'=="K741"|`var'=="K742"|`var'=="K746"|`var'=="K752"|`var'=="K758"|`var'=="K759"|`var'=="K760"|`var'=="K762"|`var'=="K763"|`var'=="K768"|`var'=="K769"|`var'=="K778"


**List 4 - liver complications codes

**`var'=="A418"|`var'=="A419"|`var'=="C220"|`var'=="D65X"|`var'=="D684"|`var'=="D688"|`var'=="D689"|`var'=="D695"|`var'=="D696"|`var'=="E46X"|`var'=="E86X"|`var'=="E871"|`var'=="E872"|`var'=="E876"|`var'=="E877"|`var'=="E878"|`var'=="F058"|`var'=="F059"|`var'=="G92X"|`var'=="G934"|`var'=="I81X"|`var'=="I850"|`var'=="I859"|`var'=="I864"|`var'=="I951"|`var'=="I959"|`var'=="I982"|`var'=="I983"|`var'=="K625"|`var'=="K658"|`var'=="K659"|`var'=="K766"|`var'=="K767"|`var'=="K920"|`var'=="K921"|`var'=="K922"|`var'=="N170"|`var'=="N171"|`var'=="N172"|`var'=="N179"|`var'=="N19X"|`var'=="R101"|`var'=="R103"|`var'=="R104"|`var'=="R160"|`var'=="R17X"|`var'=="R18X"|`var'=="R190"|`var'=="R402"|`var'=="R410"|`var'=="R441"|`var'=="R600"|`var'=="R609"|`var'=="R630"|`var'=="R932"|`var'=="R945"


**List 5 - alcohol flags

**`var'=="E512"|`var'=="F100"|`var'=="F101"|`var'=="F102"|`var'=="F103"|`var'=="F104"|`var'=="F105"|`var'=="F106"|`var'=="F107"|`var'=="F108"|`var'=="F109"|`var'=="G312"|`var'=="G621"|`var'=="G721"|`var'=="I426"|`var'=="K292"|`var'=="K700"|`var'=="K701"|`var'=="K702"|`var'=="K703"|`var'=="K704"|`var'=="K709"|`var'=="K852"|`var'=="K860"|`var'=="T510"|`var'=="T518"|`var'=="T519"|`var'=="Y910"|`var'=="Y911"|`var'=="Y912"|`var'=="Y913"|`var'=="Y919"|`var'=="Z714"






**NOT List 1

**`var'!="K700"|`var'!="K701"|`var'!="K702"|`var'!="K703"|`var'!="K704"|`var'!="K709"


**NOT Full lists 1-5 

**`var'!="A418"|`var'!="A419"|`var'!="C220"|`var'!="D65X"|`var'!="D684"|`var'!="D688"|`var'!="D689"|`var'!="D695"|`var'!="D696"|`var'!="E46X"|`var'!="E86X"|`var'!="E871"|`var'!="E872"|`var'!="E876"|`var'!="E877"|`var'!="E878"|`var'!="E512"|`var'!="F058"|`var'!="F059"|`var'!="F100"|`var'!="F101"|`var'!="F102"|`var'!="F103"|`var'!="F104"|`var'!="F105"|`var'!="F106"|`var'!="F107"|`var'!="F108"|`var'!="F109"|`var'!="G92X"|`var'!="G934"|`var'!="G312"|`var'!="G621"|`var'!="G721"|`var'!="I81X"|`var'!="I850"|`var'!="I859"|`var'!="I864"|`var'!="I951"|`var'!="I959"|`var'!="I982"|`var'!="I983"|`var'!="I426"|`var'!="K292"|`var'!="K625"|`var'!="K658"|`var'!="K659"|`var'!="K700"|`var'!="K701"|`var'!="K702"|`var'!="K703"|`var'!="K704"|`var'!="K709"|`var'!="K710"|`var'!="K711"|`var'!="K712"|`var'!="K713"|`var'!="K714"|`var'!="K715"|`var'!="K716"|`var'!="K717"|`var'!="K718"|`var'!="K719"|`var'!="K720"|`var'!="K721"|`var'!="K729"|`var'!="K730"|`var'!="K731"|`var'!="K732"|`var'!="K738"|`var'!="K739"|`var'!="K740"|`var'!="K741"|`var'!="K742"|`var'!="K746"|`var'!="K752"|`var'!="K758"|`var'!="K759"|`var'!="K760"|`var'!="K762"|`var'!="K763"|`var'!="K766"|`var'!="K767"|`var'!="K768"|`var'!="K769"|`var'!="K778"|`var'!="K852"|`var'!="K860"|`var'!="K920"|`var'!="K921"|`var'!="K922"|`var'!="N170"|`var'!="N171"|`var'!="N172"|`var'!="N179"|`var'!="N19X"|`var'!="R101"|`var'!="R103"|`var'!="R104"|`var'!="R160"|`var'!="R17X"|`var'!="R18X"|`var'!="R190"|`var'!="R402"|`var'!="R410"|`var'!="R441"|`var'!="R600"|`var'!="R609"|`var'!="R630"|`var'!="R932"|`var'!="R945"|`var'!="T510"|`var'!="T518"|`var'!="T519"|`var'!="Y910"|`var'!="Y911"|`var'!="Y912"|`var'!="Y913"|`var'!="Y919"|`var'!="Z714"|

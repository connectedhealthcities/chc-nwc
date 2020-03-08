# Connected Health Cities ARLD Algorithm v1.0

_Development and validation of diagnostic coding algorithm_

The standard approach for identifying admissions within administrative data is to focus exclusively on the primary (principal) discharge diagnosis code. However, ARLD is a complex condition and can present with a spectrum of symptoms, signs, specific disease complications and with other co-existing alcohol-related disorders. Inadequate identification of liver-related admissions based on primary diagnosis alone has been reported.  Hence, we needed to develop a better method for identifying cohorts of people with ARLD and their relevant emergency admissions from administrative data.  Each care episode contains up to 23 diagnostic codes, classified according to version 10 of the International Classification of Diseases (ICD-10).

First, we flagged admissions with any of the six specific codes for ARLD recorded as primary diagnosis (Table S1) – referred to as _ARLD-Primary** **_admissions and reflecting the standard approach. Next, we extracted admissions where such codes appeared in a non-primary position and created frequency tables of the primary diagnoses recorded for those admissions.  Two clinicians reviewed the tables independently, selecting primary codes compatible with emergency presentations of ARLD.  Any discrepancies were resolved by informal consensus.  This resulted in one code list for ‘_symptoms, signs or complications_’ of ARLD (e.g. jaundice, ascites, oesophageal varices, acute kidney injury, infections/sepsis, encephalopathy; Table S2) and another for ‘_other alcohol-specific conditions_’ (e.g. acute alcohol withdrawal or alcoholic gastritis; Table S3). Primary codes were rejected when judged to indicate that ARLD was not the main reason for admission (e.g. chronic obstructive airways disease).  

We also identified other categories of admission where a code for non-specific liver disease (e.g. other and unspecified cirrhosis of the liver; Table S4) co-existed with a code for an alcohol-specific condition - thereby suggesting the liver disease was alcohol-related.  Using the clinician-generated list for symptoms, signs and complications, we defined which of these admissions were also eligible for inclusion.  An algorithmic procedure was created to screen the dataset to identify admissions with any of the permitted coding combinations, referred to collectively as _ARLD-Algorithm_ admissions. This included ARLD-Primary** **admissions plus the extra admissions identified from alternative coding patterns (ARLD-Uplift). 



**Coding rules for emergency admissions for ARLD**

The list of ICD-10 codes must conform to one of four patterns:

1. **ARLD-specific code<sup>(i)</sup> recorded as primary diagnosis **(ARLD-Primary)

2. **ARLD-specific code recorded as a secondary diagnosis**

All higher order diagnoses must be either:

(A) Symptom, sign or complication<sup>(ii)</sup>, or

(B) Other alcohol-specific diagnosis<sup>(iii)</sup> 

3. **Non-specific liver disease<sup>(iv)</sup> code recorded as a primary diagnosis**

Lower order diagnoses must include one alcohol-specific diagnosis<sup> (iii)</sup>

4. **Non-specific liver disease<sup> (iv)</sup> recorded as a secondary diagnosis**

All higher order diagnoses must be either:

(A) Symptom, sign or complication, or

(B) Other alcohol-specific diagnosis (at least one must be recorded)

**Notes:**

(i)  Seven specific codes for alcohol-related liver disease

(ii) Codes for jaundice, ascites, varices, acute kidney injury, encephalopathy and other relevant diagnoses suggesting admission for ARLD complications

(iii) Codes for other alcohol-specific conditions such as alcohol intoxication, withdrawal and organ-specific disorders (e.g. alcoholic gastritis)

(iv) Codes for liver disease without specific aetiology (e.g. cirrhosis, unspecified)

[Stata Code can be downloaded from GitHub repository](https://github.com/connectedhealthcities/chc-nwc/stata)

**Code lists**

**S1	ICD-10 codes for alcohol-related liver disease**

<sup><strong> </strong></sup>


<table>
  <tr>
   <td>K700
   </td>
   <td>Alcoholic fatty liver
   </td>
  </tr>
  <tr>
   <td>K701
   </td>
   <td>Alcoholic hepatitis
   </td>
  </tr>
  <tr>
   <td>K702
   </td>
   <td>Alcoholic fibrosis and sclerosis of liver
   </td>
  </tr>
  <tr>
   <td>K703
   </td>
   <td>Alcoholic cirrhosis of liver
   </td>
  </tr>
  <tr>
   <td>K704
   </td>
   <td>Alcoholic hepatic failure
   </td>
  </tr>
  <tr>
   <td>K709
   </td>
   <td>Alcoholic liver disease unspecified
   </td>
  </tr>
</table>




**S2	ICD-10 codes for symptoms, signs or complications of liver disease**


<table>
  <tr>
   <td>A418
   </td>
   <td>Other specified septicaemia
   </td>
  </tr>
  <tr>
   <td>A419
   </td>
   <td>Septicaemia, unspecified
   </td>
  </tr>
  <tr>
   <td>C220
   </td>
   <td>Malignant neoplasm, liver cell carcinoma
   </td>
  </tr>
  <tr>
   <td>D65X
   </td>
   <td>Disseminated intravascular coagulation [defibrination syndrome]
   </td>
  </tr>
  <tr>
   <td>D684
   </td>
   <td>Acquired coagulation factor deficiency
   </td>
  </tr>
  <tr>
   <td>D688
   </td>
   <td>Other specified coagulation defects
   </td>
  </tr>
  <tr>
   <td>D689
   </td>
   <td>Coagulation defect, unspecified
   </td>
  </tr>
  <tr>
   <td>D695
   </td>
   <td>Secondary thrombocytopenia
   </td>
  </tr>
  <tr>
   <td>D696
   </td>
   <td>Thrombocytopenia, unspecified
   </td>
  </tr>
  <tr>
   <td>E46X
   </td>
   <td>Unspecified protein-energy malnutrition
   </td>
  </tr>
  <tr>
   <td>E86X
   </td>
   <td>Volume depletion
   </td>
  </tr>
  <tr>
   <td>E871
   </td>
   <td>Hypo-osmolality and hyponatraemia
   </td>
  </tr>
  <tr>
   <td>E872
   </td>
   <td>Acidosis
   </td>
  </tr>
  <tr>
   <td>E876
   </td>
   <td>Hypokalaemia
   </td>
  </tr>
  <tr>
   <td>E877
   </td>
   <td>Fluid overload
   </td>
  </tr>
  <tr>
   <td>E878
   </td>
   <td>Other disorders of electrolyte and fluid balance NEC
   </td>
  </tr>
  <tr>
   <td>F058
   </td>
   <td>Other delirium
   </td>
  </tr>
  <tr>
   <td>F059
   </td>
   <td>Delirium unspecified
   </td>
  </tr>
  <tr>
   <td>G92X
   </td>
   <td>Toxic encephalopathy
   </td>
  </tr>
  <tr>
   <td>G934
   </td>
   <td>Encephalopathy unspecified
   </td>
  </tr>
  <tr>
   <td>I81X
   </td>
   <td>Portal vein thrombosis
   </td>
  </tr>
  <tr>
   <td>I850
   </td>
   <td>Oesophageal varices with bleeding
   </td>
  </tr>
  <tr>
   <td>I859
   </td>
   <td>Oesophageal varices without bleeding
   </td>
  </tr>
  <tr>
   <td>I864
   </td>
   <td>Gastric varices
   </td>
  </tr>
  <tr>
   <td>I951
   </td>
   <td>Orthostatic hypotension
   </td>
  </tr>
  <tr>
   <td>I959
   </td>
   <td>Hypotension unspecified
   </td>
  </tr>
  <tr>
   <td>I982
   </td>
   <td>Oesophageal varices in diseases classified elsewhere
   </td>
  </tr>
  <tr>
   <td>I983
   </td>
   <td>Oesophageal varices with bleeding in diseases classified elsewhere
   </td>
  </tr>
  <tr>
   <td>K625
   </td>
   <td>Haemorrhage of anus and rectum
   </td>
  </tr>
  <tr>
   <td>K658
   </td>
   <td>Peritonitis other
   </td>
  </tr>
  <tr>
   <td>K659
   </td>
   <td>Peritonitis unspecified
   </td>
  </tr>
  <tr>
   <td>K766
   </td>
   <td>Portal hypertension
   </td>
  </tr>
  <tr>
   <td>K767
   </td>
   <td>Hepatorenal syndrome
   </td>
  </tr>
  <tr>
   <td>K920
   </td>
   <td>Haematemesis
   </td>
  </tr>
  <tr>
   <td>K921
   </td>
   <td>Melaena
   </td>
  </tr>
  <tr>
   <td>K922
   </td>
   <td>Gastrointestinal haemorrhage unspecified
   </td>
  </tr>
  <tr>
   <td>N170
   </td>
   <td>Acute renal failure with tubular necrosis
   </td>
  </tr>
  <tr>
   <td>N171
   </td>
   <td>Acute renal failure with acute cortical necrosis
   </td>
  </tr>
  <tr>
   <td>N172
   </td>
   <td>Acute renal failure with medullary necrosis
   </td>
  </tr>
  <tr>
   <td>N179
   </td>
   <td>Acute renal failure, unspecified
   </td>
  </tr>
  <tr>
   <td>N19X
   </td>
   <td>Unspecified renal failure
   </td>
  </tr>
  <tr>
   <td>R101
   </td>
   <td>Pain localized to upper abdomen
   </td>
  </tr>
  <tr>
   <td>R103
   </td>
   <td>Pain localized to other parts of lower abdomen
   </td>
  </tr>
  <tr>
   <td>R104
   </td>
   <td>Other and unspecified abdominal pain
   </td>
  </tr>
  <tr>
   <td>R160
   </td>
   <td>Hepatomegaly not elsewhere classified
   </td>
  </tr>
  <tr>
   <td>R17X
   </td>
   <td>Unspecified jaundice
   </td>
  </tr>
  <tr>
   <td>R18X
   </td>
   <td>Ascites
   </td>
  </tr>
  <tr>
   <td>R190
   </td>
   <td>Intra-abdominal and pelvic swelling mass and lump
   </td>
  </tr>
  <tr>
   <td>R402
   </td>
   <td>Coma unspecified
   </td>
  </tr>
  <tr>
   <td>R410
   </td>
   <td>Disorientation, unspecified
   </td>
  </tr>
  <tr>
   <td>R441
   </td>
   <td>Visual hallucinations
   </td>
  </tr>
  <tr>
   <td>R600
   </td>
   <td>Localized oedema
   </td>
  </tr>
  <tr>
   <td>R609
   </td>
   <td>Oedema unspecified
   </td>
  </tr>
  <tr>
   <td>R630
   </td>
   <td>Anorexia
   </td>
  </tr>
  <tr>
   <td>R932
   </td>
   <td>Abnormal findings diagnostic imaging of liver and biliary tract
   </td>
  </tr>
  <tr>
   <td>R945
   </td>
   <td>Abnormal results of liver function studies
   </td>
  </tr>
</table>




**S3	ICD-10 codes for other alcohol-specific conditions**


<table>
  <tr>
   <td>E512
   </td>
   <td>Wernicke Encephalopathy
   </td>
  </tr>
  <tr>
   <td>F100
   </td>
   <td>Mental & behavioural disorders due to use of alcohol: acute intoxication
   </td>
  </tr>
  <tr>
   <td>F101
   </td>
   <td>Mental and behavioural disorders due to use of alcohol: harmful use
   </td>
  </tr>
  <tr>
   <td>F102
   </td>
   <td>Mental and behavioural disorders due to use of alcohol: dependence syndrome
   </td>
  </tr>
  <tr>
   <td>F103
   </td>
   <td>Mental and behavioural disorders due to use of alcohol: withdrawal stat
   </td>
  </tr>
  <tr>
   <td>F104
   </td>
   <td>Mental & behavioural disorders due alcohol: withdrawal state with delirium
   </td>
  </tr>
  <tr>
   <td>F105
   </td>
   <td>Mental & behavioural disorders due to use of alcohol: psychotic disorder
   </td>
  </tr>
  <tr>
   <td>F106
   </td>
   <td>Mental and behavioural disorders due to use of alcohol: amnesic syndrome
   </td>
  </tr>
  <tr>
   <td>F107
   </td>
   <td>Mental & behavioural disorders due use of alcohol: residual & late-onset psychotic disorder
   </td>
  </tr>
  <tr>
   <td>F108
   </td>
   <td>Mental & behavioural disorders due to use of alcohol: other mental & behavioural disorders
   </td>
  </tr>
  <tr>
   <td>F109
   </td>
   <td>Mental & behavioural disorders due use of alcohol: unspecified mental & behavioural disorder
   </td>
  </tr>
  <tr>
   <td>G312
   </td>
   <td>Degeneration of nervous system due to alcohol
   </td>
  </tr>
  <tr>
   <td>G621
   </td>
   <td>Alcoholic polyneuropathy
   </td>
  </tr>
  <tr>
   <td>G721
   </td>
   <td>Alcoholic myopathy
   </td>
  </tr>
  <tr>
   <td>I426
   </td>
   <td>Alcoholic cardiomyopathy
   </td>
  </tr>
  <tr>
   <td>K292
   </td>
   <td>Alcoholic gastritis
   </td>
  </tr>
  <tr>
   <td>K700
   </td>
   <td>Alcoholic fatty liver
   </td>
  </tr>
  <tr>
   <td>K701
   </td>
   <td>Alcoholic hepatitis
   </td>
  </tr>
  <tr>
   <td>K702
   </td>
   <td>Alcoholic fibrosis and sclerosis of liver
   </td>
  </tr>
  <tr>
   <td>K703
   </td>
   <td>Alcoholic cirrhosis of liver
   </td>
  </tr>
  <tr>
   <td>K704
   </td>
   <td>Alcoholic hepatic failure
   </td>
  </tr>
  <tr>
   <td>K709
   </td>
   <td>Alcoholic liver disease unspecified
   </td>
  </tr>
  <tr>
   <td>K852
   </td>
   <td>Alcohol-induced acute pancreatitis
   </td>
  </tr>
  <tr>
   <td>K860
   </td>
   <td>Alcohol-induced chronic pancreatitis
   </td>
  </tr>
  <tr>
   <td>T510
   </td>
   <td>Toxic Effect of Ethanol
   </td>
  </tr>
  <tr>
   <td>T518
   </td>
   <td>Toxic effect of other alcohols
   </td>
  </tr>
  <tr>
   <td>T519
   </td>
   <td>Toxic effect of alcohol unspecified
   </td>
  </tr>
  <tr>
   <td>Y910
   </td>
   <td>Mild alcohol intoxication
   </td>
  </tr>
  <tr>
   <td>Y911
   </td>
   <td>Moderate alcohol intoxication
   </td>
  </tr>
  <tr>
   <td>Y912
   </td>
   <td>Severe alcohol intoxication
   </td>
  </tr>
  <tr>
   <td>Y913
   </td>
   <td>Very severe alcohol intoxication
   </td>
  </tr>
  <tr>
   <td>Y919
   </td>
   <td>Alcohol involvement not otherwise specified
   </td>
  </tr>
  <tr>
   <td>Z714
   </td>
   <td>Alcohol abuse counselling and surveillance
   </td>
  </tr>
</table>




**S4	ICD-10 codes for liver disease without a cause specified**


<table>
  <tr>
   <td>K710
   </td>
   <td>Toxic liver disease with cholestasis
   </td>
  </tr>
  <tr>
   <td>K711
   </td>
   <td>Toxic liver disease with hepatic necrosis
   </td>
  </tr>
  <tr>
   <td>K712
   </td>
   <td>Toxic liver disease with acute hepatitis
   </td>
  </tr>
  <tr>
   <td>K713
   </td>
   <td>Toxic liver disease with chronic persistent hepatitis
   </td>
  </tr>
  <tr>
   <td>K714
   </td>
   <td>Toxic liver disease with chronic lobular hepatitis
   </td>
  </tr>
  <tr>
   <td>K715
   </td>
   <td>Toxic liver disease with chronic active hepatitis
   </td>
  </tr>
  <tr>
   <td>K716
   </td>
   <td>Toxic liver disease with hepatitis not elsewhere classified
   </td>
  </tr>
  <tr>
   <td>K717
   </td>
   <td>Toxic liver disease with fibrosis and cirrhosis of liver
   </td>
  </tr>
  <tr>
   <td>K718
   </td>
   <td>Toxic liver disease with other disorders of liver
   </td>
  </tr>
  <tr>
   <td>K719
   </td>
   <td>Toxic liver disease unspecified
   </td>
  </tr>
  <tr>
   <td>K720
   </td>
   <td>Acute and subacute hepatic failure
   </td>
  </tr>
  <tr>
   <td>K721
   </td>
   <td>Chronic hepatic failure
   </td>
  </tr>
  <tr>
   <td>K729
   </td>
   <td>Hepatic failure unspecified
   </td>
  </tr>
  <tr>
   <td>K730
   </td>
   <td>Chronic persistent hepatitis not elsewhere classified
   </td>
  </tr>
  <tr>
   <td>K731
   </td>
   <td>Chronic lobular hepatitis not elsewhere classified
   </td>
  </tr>
  <tr>
   <td>K732
   </td>
   <td>Chronic active hepatitis not elsewhere classified
   </td>
  </tr>
  <tr>
   <td>K738
   </td>
   <td>Other chronic hepatitis not elsewhere classified
   </td>
  </tr>
  <tr>
   <td>K739
   </td>
   <td>Chronic hepatitis unspecified
   </td>
  </tr>
  <tr>
   <td>K740
   </td>
   <td>Hepatic fibrosis
   </td>
  </tr>
  <tr>
   <td>K741
   </td>
   <td>Hepatic sclerosis
   </td>
  </tr>
  <tr>
   <td>K742
   </td>
   <td>Hepatic fibrosis with hepatic sclerosis
   </td>
  </tr>
  <tr>
   <td>K746
   </td>
   <td>Other and unspecified cirrhosis of liver
   </td>
  </tr>
  <tr>
   <td>K752
   </td>
   <td>Nonspecific reactive hepatitis
   </td>
  </tr>
  <tr>
   <td>K758
   </td>
   <td>Other specified inflammatory liver diseases
   </td>
  </tr>
  <tr>
   <td>K759
   </td>
   <td>Inflammatory liver disease unspecified
   </td>
  </tr>
  <tr>
   <td>K760
   </td>
   <td>Fatty (change of) liver not elsewhere classified
   </td>
  </tr>
  <tr>
   <td>K762
   </td>
   <td>Central haemorrhagic necrosis of liver
   </td>
  </tr>
  <tr>
   <td>K763
   </td>
   <td>Infarction of liver
   </td>
  </tr>
  <tr>
   <td>K768
   </td>
   <td>Other specified diseases of liver
   </td>
  </tr>
  <tr>
   <td>K769
   </td>
   <td>Liver disease unspecified
   </td>
  </tr>
  <tr>
   <td>K778
   </td>
   <td>Liver disorders in other diseases classified elsewhere
   </td>
  </tr>
  <tr>
   <td>K710
   </td>
   <td>Toxic liver disease with cholestasis
   </td>
  </tr>
</table>

```stata
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


```

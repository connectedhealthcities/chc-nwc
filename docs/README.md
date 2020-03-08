# Connected Health Cities ARLD Algorithm v1.0

_Development and validation of diagnostic coding algorithm_

The standard approach for identifying admissions within administrative data is to focus exclusively on the primary (principal) discharge diagnosis code. However, ARLD is a complex condition and can present with a spectrum of symptoms, signs, specific disease complications and with other co-existing alcohol-related disorders. Inadequate identification of liver-related admissions based on primary diagnosis alone has been reported.  Hence, we needed to develop a better method for identifying cohorts of people with ARLD and their relevant emergency admissions from administrative data.  Each care episode contains up to 23 diagnostic codes, classified according to version 10 of the International Classification of Diseases (ICD-10).

First, we flagged admissions with any of the six specific codes for ARLD recorded as primary diagnosis (Table S1) – referred to as _ARLD-Primary_ admissions and reflecting the standard approach. Next, we extracted admissions where such codes appeared in a non-primary position and created frequency tables of the primary diagnoses recorded for those admissions.  Two clinicians reviewed the tables independently, selecting primary codes compatible with emergency presentations of ARLD.  Any discrepancies were resolved by informal consensus.  This resulted in one code list for ‘_symptoms, signs or complications_’ of ARLD (e.g. jaundice, ascites, oesophageal varices, acute kidney injury, infections/sepsis, encephalopathy; Table S2) and another for ‘_other alcohol-specific conditions_’ (e.g. acute alcohol withdrawal or alcoholic gastritis; Table S3). Primary codes were rejected when judged to indicate that ARLD was not the main reason for admission (e.g. chronic obstructive airways disease).  

We also identified other categories of admission where a code for non-specific liver disease (e.g. other and unspecified cirrhosis of the liver; Table S4) co-existed with a code for an alcohol-specific condition - thereby suggesting the liver disease was alcohol-related.  Using the clinician-generated list for symptoms, signs and complications, we defined which of these admissions were also eligible for inclusion.  An algorithmic procedure was created to screen the dataset to identify admissions with any of the permitted coding combinations, referred to collectively as _ARLD-Algorithm_ admissions. This included ARLD-Primary admissions plus the extra admissions identified from alternative coding patterns (ARLD-Uplift). 



**Coding rules for emergency admissions for ARLD**

The list of ICD-10 codes must conform to one of four patterns:

1. **ARLD-specific code<sup>(i)</sup> recorded as primary diagnosis** (ARLD-Primary)

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

[Stata Code can be downloaded from GitHub repository](https://github.com/connectedhealthcities/chc-nwc/blob/master/stata/chc-alrd-algorithm-v1.do)

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


# Connected Health Cities Epilepsy Algorithm v1.0
Development and validation of diagnostic coding algorithm
Admissions to hospital due to epileptic seizures are common and account for approximately 1.4% of all emergency medical admissions.  The standard approach for identifying admissions within administrative data is to focus exclusively on the primary (principal) discharge diagnosis code. However, extending the analysis to the secondary codes gives a more realistic picture of the number of admissions.  

Hospital data for each admission are always recorded, and the information includes not only the individual's demographics, but also details of their progress through the system and, importantly, the clinical diagnosis. The diagnosis is recorded with a series of ICD10 codes (international coding descriptors - https://icd.who.int/browse10/2016/en) that are entered by coders working from the clinical record after discharge. Clinical records are not didactic, and often diagnoses develop over the course of an admission – and indeed may remain as probable, rather than certain, because of the biological variability with which conditions manifest.

There are further complications in that a single seizure is not necessarily due to epilepsy and, conversely, patients with epilepsy may develop all manner of other conditions that could necessitate admission, at which time the epilepsy is an incidental co-morbidity. Coding is designed to code both the direct cause of each admission and also all co-morbidities, but does not attempt to define the relative importance of any particular code.

Our algorithm is designed as follows:

1. Restricting to emergency admissions
The Secondary Uses Service (SUS) data separate hospital admissions according to whether they are: 
*    emergencies (referred as emergency from clinics, another hospital, GP or the ED); or 
*    elective, i.e. a planned admission for specific investigation or procedure 

Seizures present as unexpected emergencies so the first filter is to restrict the analysis to emergency. The relevant codes for emergency admissions are:

21  
22  
23  
24  
25  
2A  
2B  
2C  
2D  
28  

There will be a very small number of patients admitted electively to have their epilepsy monitored or diagnosed in specialist units but these are not being admitted because of a seizure. This process excludes all those with epilepsy who are admitted for routine procedures ranging from diabetes control to hernia surgery or depression etc. 

2. Restricting to emergencies admitted to "medical wards"  

Each hospital bed is coded with a specialty. When seizure is the primary reason for the admission, hospital processes direct that admission towards a medical bed (i.e. under the care of a physician), rather than any other bed (e.g. surgical, psychiatric, orthopaedic, obstetric etc.). Thus, it is rational to presume that an admission that includes an epilepsy code to any other speciality is using the epilepsy code to describe a co-morbid condition. The list of relevant medical speciality codes are included in appendix 1.


3. Restricting to final episode of spell

The coding system is set out in units of Finished Consultant Episodes, or FCEs. These are defined such that when a patient moves from the care of one consultant to the care of a second, each different consultant's input can be evaluated. Importantly, for our purposes, it is only at the end of a spell, i.e. end of the final episode, when the fullest diagnosis will have been apparent, and that is therefore the episode we use to define the diagnosis of the spell.

4. Identifying those admissions which are likely to be related to epilepsy

The ICD10 codes G40x and G41x describe different subtypes of epilepsy. In addition, there is a symptom code (R568) for an "unexplained convulsion" that may (but not necessarily) point to an epileptic seizure. 

For the cases where an epilepsy code (G40x or G41x) appears in the first position, we make the presumption that epilepsy was the cause of that acute emergency admission to hospital. To create an accurate a cohort as possible, it is necessary to add to these admissions and look at those where the epilepsy code appears in position 2 or later and separate out the 'true' epilepsy-related admissions from those where epilepsy is co-morbid. To do this, we examined the codes that precede the epilepsy codes, and estimated the likelihood that the given admission was likely to be seizure-related.   

This is not an exact science and the process requires physicians who have worked with acute medicine to examine the range of codes recorded for each patient and use their clinical experience to judge what condition, or combination of conditions, is likely to have been the prime reason for that admission. In making their allocation decision, the physicians were asked to consider which medical condition would have taken priority for the individual. Another way of phrasing the question is to ask, "which sub-speciality would you wish this patient to be triaged to as they arrived in hospital?" 
These lists of codings have been reviewed by clinicians in acute medicine, general medicine, neurology and emergency medicine and modified following discussion.

The cohort is therefore defined as the following:

*    Admissions with an epilepsy code (G40x or G41x) in the first position. To be listed first, it is almost certain that the admissions is due to epilepsy
*    Admissions with the unexplained convulsion code (R568) in the first position, provided there is also a G40x or G41x code in a subsequent position. Here, the probability that the admission convulsion was due to epilepsy is high; and
*    Admissions with selected codes (see appendix 2) in the first position, provided there is also a G40x or G41x code in a subsequent position. Here, the probability that the admission was due to epilepsy is high.

The Stata .do file associated with this document does not include code for steps 1 to 3 above as the variable names associated with the filters can change between datasets. The Stata .do file is concerned with step 4. It creates 3 variables:
*    ep_g_codes_prim denotes if there is a G40 or G41x code in the primary position
*    ep_g_codes_second denotes if there is a G40 or G41x code in the secondary position
*    ep_assoc_codes denotes if there is one of the selected codes in appendix 2 in the primary position

A variable named 'epstat' is then created with a default value of 0. This is then given a value of 2 if 'ep_g_codes_prim' is equal to 1, or if there is a R568 code in primary position and 'ep_g_codes_second' is equal to 1. A value of 1 is applied to 'epstat' if both 'ep_assoc_codes' is equal to 1 and 'ep_g_codes_second' is equal to 1.

Finally, a variable named 'epstat1' is created with a default value of zero. This is given a value of 1 if 'epstat' is greater than zero. The epilepsy cohort is defined as those admissions where 'epstat1' is equal to 1. 

## APPENDIX 1: MEDICAL SPECIALTY CODES

The seizures algorithm requires that the treatment speciality is one of the following codes:

180 Accident and Emergency  
192 Critical Care Medicine  
300 General Medicine  
301 Gastroenterology  
302 Endocrinology  
303 Clinical Haematology  
305 Clinical Pharmacology  
314 Rehabilitation  
315 Palliative Medicine  
320 Cardiology  
330 Dermatology  
340 Respiratory Medicine  
350 Infectious Diseases  
361 Nephrology  
370 Medical Oncology  
400 Neurology  
410 Rheumatology  
430 Geriatric Medicine  
820 General Pathology  
823 Haematology  
960 Allied Health Professional Episode  

## APPENDIX 2: ICD10 CODES WHICH DENOTE A PROBABLE EPILEPSY ADMISSION

The seizure algorithm denotes a seizure as probable if one of the following codes is in primary position, and there is a G40x or G41x code in a subsequent position:

F019 - Vascular dementia, unspecified  
F100 - Mental and behavioural disorders due to acute intoxication with alcohol  
F101 - Mental and behavioural disorders due to harmful use of alcohol  
F102 - Mental and behavioural disorders due to alcohol dependence syndrome  
F103 - Mental and behavioural disorders due to withdrawal of alcohol  
F104 - Mental and behavioural disorders and delirium due to withdrawal of alcohol  
F419 - Anxiety disorder, unspecified  
G439 - Migraine, unspecified  
H538 - Other visual disturbances  
J690 - Pneumonitis due to food and vomit  
K292 - Alcoholic gastritis  
R402 - Coma, unspecified  
R410 - Disorientation, unspecified  
R418 - Other & unspecified symptoms & signs involving cognitive function  
R42X - Dizziness and giddiness  
R451 - Restlessness and agitation  
R51X - Headache  
R55X - Syncope and collapse  
R600 - Localized oedema  
R798 - Other specified abnormal findings of blood chemistry  
S000 - Superficial injury of scalp  
S001 - Contusion of eyelid and periocular area  
S008 - Superficial injury of other parts of head  
S009 - Superficial injury of head, part unspecified  
S010 - Open wound of scalp  
S018 - Open wound of other parts of head  
S019 - Open wound of head, part unspecified  
S099 - Unspecified injury of head  
S308 - Other superficial injuries of abdomen, lower back and pelvis  
Z038 - Observation for other suspected diseases and conditions  
Z739 - Problem related to life-management difficulty, unspecified  

# ￼￼￼Connected Health Cities COPD Algorithm v1.0

[Back](readme.md)

[Stata Code can be downloaded from GitHub repository](https://github.com/connectedhealthcities/chc-nwc/blob/master/stata/chc-copd-algorithm-v1.do)

Development and validation of diagnostic coding algorithm
Acute exacerbation of COPD is one of the most common reasons for emergency admission to hospital. The standard approach for identifying admissions within administrative data is to focus exclusively on the primary (principal) discharge diagnosis code. However, extending the analysis to the secondary codes gives a more realistic picture of the number of admissions. 

Hospital data for each admission are always recorded, and the information includes not only the individual's demographics, but also details of their progress through the system and, importantly, the clinical diagnosis. The diagnosis is recorded with a series of ICD10 codes (international coding descriptors - https://icd.who.int/browse10/2016/en) that are entered by coders working from the clinical record after discharge. Clinical records are not didactic, and often diagnoses develop over the course of an admission – and indeed may remain as probable, rather than certain, because of the biological variability with which conditions manifest. 

Our algorithm is designed as follows:

1. Restricting to emergency admissions
The Secondary Uses Service (SUS) data separate hospital admissions according to whether they are: 
*    emergencies (referred as emergency from clinics, another hospital, GP or the ED); or 
*    elective, i.e. a planned admission for specific investigation or procedure 

COPD exacerbations present as unexpected emergencies so the first filter is to restrict the analysis to emergency.  The relevant codes for emergency admissions are:

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

2. Restricting to emergencies admitted to "medical wards"

Each hospital bed is coded with a specialty. When COPD is the primary reason for the admission, hospital processes direct that admission towards a medical bed (i.e. under the care of a physician), rather than any other bed (e.g. surgical, psychiatric, orthopaedic, obstetric etc.). Thus, it is rational to presume that an admission that includes a COPD code to any other speciality is using the COPD code to describe a co-morbid condition. The list of relevant medical speciality codes are included in appendix 1.


3. Restricting to final episode of spell

The coding system is set out in units of Finished Consultant Episodes, or FCEs. These are defined such that when a patient moves from the care of one consultant to the care of a second, each different consultant's input can be evaluated. Importantly, for our purposes, it is only at the end of a spell, i.e. end of the final episode, when the fullest diagnosis will have been apparent, and that is therefore the episode we use to define the diagnosis of the spell.

4. Identifying those admissions which are likely to be related to COPD

We have 3 lists of ICD10 codes used when running our algorithm. These are shown in appendix 2.

The Stata .do file associated with this document does not include code for steps 1 to 3 above as the variable names associated with the filters can change between datasets. The Stata .do file is concerned with step 4. It creates variables as outlined below:
The first step is to assign a new variable called 'status1'. The value for status1 is calculated for each episode as follows:
*    if any of list 1 are in the primary diagnosis field, then status1 = 1
*    if any of list 2 are in the primary diagnosis field, then status1 = 2
*    if any of list 3 are in the primary diagnosis field, then status1 = 3
*    if none of the above conditions are met then status1 = 0

The next step is to assign a new variable called 'status2'. The value for status2 is calculated for each episode as follows:

*    if any of list 1 are in the first secondary diagnosis field, then status2 = 1
*    if any of list 2 are in the first secondary diagnosis field, then status2 = 2
*    if any of list 3 are in the first secondary diagnosis field, then status2 = 3
*    if none of the above conditions are met then status2 = 0

The next step is to assign a new variable called 'status3'. The value for status3 is calculated for each episode as follows:
*    if any of list 1 are in the second secondary diagnosis field, then status3 = 1
*    if any of list 2 are in the second secondary diagnosis field, then status3 = 2
*    if any of list 3 are in the second secondary diagnosis field, then status3 = 3
*    if none of the above conditions are met then status3 = 0

We then add a variable entitled 'statusoutcome'. The value for statusoutcome is based upon the values of status1, status 2 and status 3; and is calculated for each episode as follows

*    if status1 = 2 & status2 = 2 & status3 = 1, then statusoutcome = 7
*    if status1 = 3 & status2 = 3 & status3 = 1, then statusoutcome = 6
*    if status1 = 2 & status2 = 3 & status3 = 1, then statusoutcome = 5
*    if status1 = 3 & status2 = 2 & status3 = 1, then statusoutcome = 4
*    if status1 = 3 & status2 = 1, then statusoutcome = 3
*    if status1 = 2 & status2 = 1, then statusoutcome = 2
*    if status1 = 1, then statusoutcome = 1
*    if none of the above conditions are met then status3 = 0

We then add a variable entitled 'copdcategory'. The value for copdcategory is calculated for each episode as follows:

*    if statusoutcome = 1 then copdcategory = 1
*    if statusoutcome = 2 OR  statusoutcome = 4 OR statusoutcome = 5 OR statusoutcome = 7 then copdcategory = 2
*    if statusoutcome = 3 OR  statusoutcome = 6 then copdcategory = 3
*    if none of the above conditions are met then copdcategory = 0

We then add a variable entitled 'copdcat1'. The value for copdcat1 is calculated for each episode as follows:

*    if copdcategory > 0 then copdcat1 = 1
*    if copdcategory = 0 then copdcat1 = 0

The admissions where copdcat1 are equal to 1 are, therefore, our defined cohort of COPD admissions. 

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
  
## APPENDIX 2: ICD10 CODES WHICH DENOTE A PROBABLE COPD ADMISSION

**List 1:**

J40X    Bronchitis not specified as acute or chronic  
J410    Simple chronic bronchitis  
J411    Mucopurulent chronic bronchitis  
J418    Mixed simple and mucopurulent chronic bronchitis  
J42X    Unspecified chronic bronchitis  
J430    MacLeod s syndrome  
J431    Panlobular emphysema  
J432    Centrilobular emphysema  
J438    Other emphysema  
J439    Emphysema unspecified  
J440    Chronic obstruct pulmonary dis with acute lower resp infec  
J441    Chron obstruct pulmonary dis wth acute exacerbation unspec  
J448    Other specified chronic obstructive pulmonary disease  
J449    Chronic obstructive pulmonary disease unspecified  

**List 2:**
B59X    Pneumocystosis
J100    Influenza with pneumonia influenza virus identified
J101    Influenza with oth resp manifest influenza virus identified
J108    Influenza with other manifest influenza virus identified
J110    Influenza with pneumonia virus not identified
J111    Influenza with oth resp manifestation virus not identified
J118    Influenza with other manifestations virus not identified
J120    Adenoviral pneumonia
J121    Respiratory syncytial virus pneumonia
J122    Parainfluenza virus pneumonia
J128    Other viral pneumonia
J129    Viral pneumonia unspecified
J13X    Pneumonia due to Streptococcus pneumoniae
J14X    Pneumonia due to Haemophilus influenzae
J150    Pneumonia due to Klebsiella pneumoniae
J151    Pneumonia due to Pseudomonas
J152    Pneumonia due to staphylococcus
J153    Pneumonia due to streptococcus group B
J154    Pneumonia due to other streptococci
J155    Pneumonia due to Escherichia coli
J156    Pneumonia due to other aerobic Gram-negative bacteria
J157    Pneumonia due to Mycoplasma pneumoniae
J158    Other bacterial pneumonia
J159    Bacterial pneumonia unspecified
J160    Chlamydial pneumonia
J168    Pneumonia due to other specified infectious organisms
J170    Pneumonia in bacterial diseases classified elsewhere
J171    Pneumonia in viral diseases classified elsewhere
J172    Pneumonia in mycoses
J173    Pneumonia in parasitic diseases
J178    Pneumonia in other diseases classified elsewhere
J180    Bronchopneumonia unspecified
J181    Lobar pneumonia unspecified
J182    Hypostatic pneumonia unspecified
J188    Other pneumonia organism unspecified
J189    Pneumonia unspecified
J200    Acute bronchitis due to Mycoplasma pneumoniae
J201    Acute bronchitis due to Haemophilus influenzae
J202    Acute bronchitis due to streptococcus
J203    Acute bronchitis due to coxsackievirus
J204    Acute bronchitis due to parainfluenza virus
J205    Acute bronchitis due to respiratory syncytial virus
J206    Acute bronchitis due to rhinovirus
J207    Acute bronchitis due to echovirus
J208    Acute bronchitis due to other specified organisms
J209    Acute bronchitis unspecified
J210    Acute bronchiolitis due to respiratory syncytial virus
J218    Acute bronchiolitis due to other specified organisms
J219    Acute bronchiolitis unspecified
J22X    Unspecified acute lower respiratory infection
J690    Pneumonitis due to food and vomit
J851    Abscess of lung with pneumonia
J852    Abscess of lung without pneumonia
J860    Pyothorax with fistula
J869    Pyothorax without fistula

**List 3:**
R042    Haemoptysis
R048    Haemorrhage from other sites in respiratory passages
R05X    Cough
R060    Dyspnoea
R062    Wheezing
R064    Hyperventilation
R066    Hiccough
R068    Other and unspecified abnormalities of breathing
R070    Pain in throat
R071    Chest pain on breathing
R072    Precordial pain
R073    Other chest pain
R074    Chest pain unspecified
R091    Pleurisy
R092    Respiratory arrest
R093    Abnormal sputum
R098    Oth spec symptoms and signs involving circ and resp systems
R202    Paraesthesia of skin
R208    Other and unspecified disturbances of skin sensation
R232    Flushing
R233    Spontaneous ecchymoses
R400    Somnolence
R401    Stupor
R402    Coma unspecified
R460    Very low level of personal hygiene
R500    Fever with chills
R509    Fever unspecified
R51X    Headache
R600    Localized oedema
R601    Generalized oedema
R609    Oedema unspecified

[Back](readme.md)

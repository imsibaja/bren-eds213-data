# Arctic Shorebird Demographics Network - Snow Survey Data

---------------------------------------------------------------------------------
## DATA & FILE OVERVIEW
---------------------------------------------------------------------------------

### 1. File List

Each data file is a `.csv` (except for one `.kmz` file) with the prefix `ASDN_`. Descriptions below:

	- Bird_captures
	- Bird_eggs
	- Bird_nests
	- Bird_resights
	- Bird_sexes
	- Camp_info
	- Camp_staff
	- Daily_pred_lemm
	- Daily_species
	- Daily_species_effort
	- Geodata
	- Invert_biomass
	- Lemming_counts
	- Lemming_nests
	- Lemming_trap
	- Pred_nests
	- Pred_point_counts
	- Snow_survey
	- Study_Plot	(KMZ file)
	- Surface_water
	- Weather_HOBO
	- Weather_precip_manual
	- Weather_snow_manual

### Relationship between files, if important

This dataset is derived from a larger observation dataset containing records of species observed daily at Arctic field camps. 

### Are there multiple versions of the dataset?

Yes. Each updated version is assigned a unique DOI through the NSF Arctic Data Center. Users are advised to cite the version used in their work.


-----------------------------------------------------------------------------------------------
## DATA-SPECIFIC INFORMATION FOR:

***data/processed/snow_survey_fixed.csv :***
-----------------------------------------------------------------------------------------------

Number of variables: 11

Number of observations: 22631

Variable List: 

```
Site	Four-letter code of site at which data were collected
Year	Year in which data were collected
Date	Date of observation
Plot	Name of study plot on which survey was conducted
Location	Name of dedicated snow-survey location, if applicable
Snow_cover	Percent cover of snow, including slush
Water_cover	Percent cover of water
Land_cover	Percent cover of exposed land
Total_cover	Total sum (to check the above percents; should always sum to 100)
Observer	Person who conducted the survey
Notes	Any relevant comments on the survey
```

Missing data codes: ```NA```

Snow, Water, and Land cover are all expressed as percentages of the total area surveyed. The total cover should always sum to 100%.
If one of the three cover types is missing, the other two should sum to 100%. 
If two of the three cover types are missing, the third should be 100%. 
If all three are missing, the total cover will be NA.

---------------------------------------------------------------------------------
## SHARING / ACCESS INFORMATION
---------------------------------------------------------------------------------

### Licenses / Restrictions on Data

This work is licensed under the Creative Commons Attribution 4.0 International License. 

Please acknowledge this dataset and the authors in any analysis, publication, presentation, or other output that uses these data.

### Links to other publicly accessible locations of the data:

Original data and documentation available at:  
https://arcticshorebirds.org/data


### Recommended Citation


If you use the full dataset, we suggest you cite it as:

Lanctot, RB, SC Brown, and BK Sandercock. 2016. Arctic Shorebird Demographics Network. NSF Arctic Data Center. doi: INSERT HERE.

If you use data from only one or a few sites, we suggest you cite data for each site as per this example, using the corresponding site PIs as the authors:

Lanctot, RB and ST Saalfeld. 2016. Barrow, 2014. Arctic Shorebird Demographics Network. NSF Arctic Data Center. doi: INSERT HERE.

---

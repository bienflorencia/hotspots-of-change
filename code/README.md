# Data process

For each species, the following order to run the code should be followed:

  1. The first code to run is the '[species_1_dataGeneration.qmd](/code/species/species_1_dataGeneration.qmd)'. Four new files will be created: 
  - PA blobs for time1 and time2 (`PA_*species*_time1_blobs` and `PA_species_time2_blobs`)
  - PO rasters for time1 and time2 (`PO_species_time1_raster` and `PO_species_time2_raster`).  

  3. Then run '[species_2_variableSelection.qmd](/code/species/species_2_variableSelection.qmd)' to get the best predictors for our model. The predictors will be: `cov.1`, `cov.2`, `cov.3`, and `cov.4`.  

  2. Next, run the '[species_3_dataPreparation.qmd](/code/species/)' to prepare the data for the model. Four new files will be created:    
  - PO data for time1 and time2 (`PO_species_time1.model.data` and `PO_species_time2.model.data`) 
  - PA data for time1 and time2 (`PA_species_time1.model.data` and `PA_species_time2.model.data`) 
  
  4. Run the model with '[species_4_modelRun.qmd](/code/species/species_4_modelRun.qmd)'. Two new files will be created:    
  - The JAGS model(`SPECIES_model.txt`)  
  - The model output (`species_model.rds`)   
  
  5. And, finally, create the output figures with '[species_5_modelOutputs.qmd](/code/species/species_5_modelOutputs.qmd)'. 


# Workflow (2) Analysis for *Pteronura brasiliensis*

For each species, the following order to run the code should be followed:

  i. The first code to run is the `pbrasiliensis_1_dataGeneration.qmd` [html](/hotspots-of-change/code/Pteronura%20brasiliensis/pbrasiliensis_1_dataGeneration.html). Four new files will be created: 
  - PA blobs for time1 and time2 (`PA_species_time1_blobs` and `PA_species_time2_blobs`).  
  - PO rasters for time1 and time2 (`PO_species_time1_raster` and `PO_species_time2_raster`).  

  ii. After, run `pbrasiliensis_2_variableSelection.qmd` [html](/hotspots-of-change/code/Pteronura%20brasiliensis/pbrasiliensis_2_variableSelection.html) to get the best predictors for the modeled species. The predictors will be: `cov.1`, `cov.2`, `cov.3`, and `cov.4`.  

  iii. Then run the `pbrasiliensis_3_dataPreparation.qmd` [html](/hotspots-of-change/code/Pteronura%20brasiliensis/pbrasiliensis_3_dataPreparation.html) code with the selected predictors to prepare the data for the model. Four new files will be created:    
  - PO data for time1 and time2 (`PO_pbrasiliensis_time1.model.data` and `PO_pbrasiliensis_time2.model.data`).  
  - PA data for time1 and time2 (`PA_pbrasiliensis_time1.model.data` and `PA_pbrasiliensis_time2.model.data`).  
  
  iv. Run the model with `pbrasiliensis_4_modelRun.qmd` [html](/hotspots-of-change/code/Pteronura%20brasiliensis/pbrasiliensis_4_modelRun.html). Two new files will be created:    
  - The JAGS model(`pbrasiliensis_model.txt`)  
  - The model output (`pbrasiliensis_model.rds`) - ***caution** this is a >5GB file*  
  
  v. And, finally, create the output figures with `pbrasiliensis_5_modelOutputs.qmd` [html](/hotspots-of-change/code/Pteronura%20brasiliensis/pbrasiliensis_5_modelOutputs.html). The html output will show all the results, plus a new file will be created:    
  - The model diagnostics (`docs/pbrasiliensis_model_diagnostics.pdf`).  


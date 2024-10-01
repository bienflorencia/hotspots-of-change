# Workflow (2) Analysis for *Leopardus wiedii*

  i. The first code to run is the `lwiedii_1_dataGeneration.qmd` [html](/hotspots-of-change/code/Leopardus%20wiedii/lwiedii_1_dataGeneration.html). Four new files will be created: 
  - PA blobs for time1 and time2 (`PA_lwiedii_time1_blobs` and `PA_lwiedii_time2_blobs`).  
  - PO rasters for time1 and time2 (`PO_lwiedii_time1_raster` and `PO_lwiedii_time2_raster`).  

  ii. After, run `lwiedii_2_variableSelection.qmd` [html](/hotspots-of-change/code/Leopardus%20wiedii/lwiedii_2_variableSelection.html) to get the best predictors for the modeled species. The predictors will be: `cov.1`, `cov.2`, `cov.3`, and `cov.4`.  

  iii. Then run the `lwiedii_3_dataPreparation.qmd` [html](/hotspots-of-change/code/Leopardus%20wiedii/lwiedii_3_dataPreparation.html) code with the selected predictors to prepare the data for the model. Four new files will be created:    
  - PO data for time1 and time2 (`PO_lwiedii_time1.model.data` and `PO_lwiedii_time2.model.data`).  
  - PA data for time1 and time2 (`PA_lwiedii_time1.model.data` and `PA_lwiedii_time2.model.data`).  
  
  iv. Run the model with `lwiedii_4_modelRun.qmd`  [html](/hotspots-of-change/code/Leopardus%20wiedii/lwiedii_4_modelRun.html). Two new files will be created:    
  - The JAGS model(`lwiedii_model.txt`)  
  - The model output (`lwiedii_model.rds`) - ***caution** this is a >5GB file*  
  
  v. And, finally, create the output figures with `lwiedii_5_modelOutputs.qmd` [html](/hotspots-of-change/code/Leopardus%20wiedii/lwiedii_5_modelOutputs.html). The html output will show all the results, plus a new file will be created:    
  - The model diagnostics (`docs/lwiedii_model_diagnostics.pdf`).  


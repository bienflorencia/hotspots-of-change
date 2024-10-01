# Workflow (2) Analysis for *Eira barbara*

  i. The first code to run is the `ebarbara_1_dataGeneration.qmd` [html](/hotspots-of-change/code/Eira%20barbara/ebarbara_1_dataGeneration.html). Four new files will be created: 
  - PA blobs for time1 and time2 (`PA_ebarbara_time1_blobs` and `PA_ebarbara_time2_blobs`).  
  - PO rasters for time1 and time2 (`PO_ebarbara_time1_raster` and `PO_ebarbara_time2_raster`).  

  ii. After, run `ebarbara_2_variableSelection.qmd` [html](/hotspots-of-change/code/Eira%20barbara/ebarbara_2_variableSelection.html) to get the best predictors for the modeled species. The predictors will be: `cov.1`, `cov.2`, `cov.3`, and `cov.4`.  

  iii. Then run the `ebarbara_3_dataPreparation.qmd` [html](/hotspots-of-change/code/Eira%20barbara/ebarbara_3_dataPreparation.html) code with the selected predictors to prepare the data for the model. Four new files will be created:    
  - PO data for time1 and time2 (`PO_ebarbara_time1.model.data` and `PO_ebarbara_time2.model.data`).  
  - PA data for time1 and time2 (`PA_ebarbara_time1.model.data` and `PA_ebarbara_time2.model.data`).  
  
  iv. Run the model with `ebarbara_4_modelRun.qmd` [html](/hotspots-of-change/code/Eira%20barbara/ebarbara_4_modelRun.html). Two new files will be created:    
  - The JAGS model(`ebarbara_model.txt`)  
  - The model output (`ebarbara_model.rds`) - ***caution** this is a >5GB file*  
  
  v. And, finally, create the output figures with `ebarbara_5_modelOutputs.qmd` [html](/hotspots-of-change/code/Eira%20barbara/ebarbara_5_modelOutputs.html). The html output will show all the results, plus a new file will be created:    
  - The model diagnostics (`docs/ebarbara_model_diagnostics.pdf`).  


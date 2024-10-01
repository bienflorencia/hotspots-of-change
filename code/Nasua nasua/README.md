# Workflow (2) Analysis for *Nasua nasua*

  i. The first code to run is the `nnasua_1_dataGeneration.qmd` [html](/hotspots-of-change/code/Nasua%20nasua/nnasua_1_dataGeneration.html). Four new files will be created: 
  - PA blobs for time1 and time2 (`PA_nnasua_time1_blobs` and `PA_nnasua_time2_blobs`).  
  - PO rasters for time1 and time2 (`PO_nnasua_time1_raster` and `PO_nnasua_time2_raster`).  

  ii. After, run `nnasua_2_variableSelection.qmd` [html](/hotspots-of-change/code/Nasua%20nasua/nnasua_2_variableSelection.html) to get the best predictors for the modeled species. The predictors will be: `cov.1`, `cov.2`, `cov.3`, and `cov.4`.  

  iii. Then run the `nnasua_3_dataPreparation.qmd` [html](/hotspots-of-change/code/Nasua%20nasua/nnasua_3_dataPreparation.html) code with the selected predictors to prepare the data for the model. Four new files will be created:    
  - PO data for time1 and time2 (`PO_nnasua_time1.model.data` and `PO_nnasua_time2.model.data`).  
  - PA data for time1 and time2 (`PA_nnasua_time1.model.data` and `PA_nnasua_time2.model.data`).  
  
  iv. Run the model with `nnasua_4_modelRun.qmd` [html](/hotspots-of-change/code/Nasua%20nasua/nnasua_4_modelRun.html). Two new files will be created:    
  - The JAGS model(`nnasua_model.txt`)  
  - The model output (`nnasua_model.rds`) - ***caution** this is a >5GB file*  
  
  v. And, finally, create the output figures with `nnasua_5_modelOutputs.qmd` [html](/hotspots-of-change/code/Nasua%20nasua/nnasua_5_modelOutputs.html). The html output will show all the results, plus a new file will be created:    
  - The model diagnostics (`docs/nnasua_model_diagnostics.pdf`).  


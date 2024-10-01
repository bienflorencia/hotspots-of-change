# Workflow (2) Analysis for *Cerdocyon thous*

  i. The first code to run is the `cthous_1_dataGeneration.qmd` [html](/code/Cerdocyon%20thous/cthous_1_dataGeneration.html). Four new files will be created: 
  - PA blobs for time1 and time2 (`PA_cthous_time1_blobs` and `PA_cthous_time2_blobs`).  
  - PO rasters for time1 and time2 (`PO_cthous_time1_raster` and `PO_cthous_time2_raster`).  

  ii. After, run `cthous_2_variableSelection.qmd` [html](/code/Cerdocyon%20thous/cthous_2_variableSelection.html) to get the best predictors for the modeled species. The predictors will be: `cov.1`, `cov.2`, `cov.3`, and `cov.4`.  

  iii. Then run the `cthous_3_dataPreparation.qmd` [html](/code/Cerdocyon%20thous/cthous_3_dataPreparation.html) code with the selected predictors to prepare the data for the model. Four new files will be created:    
  - PO data for time1 and time2 (`PO_cthous_time1.model.data` and `PO_cthous_time2.model.data`).  
  - PA data for time1 and time2 (`PA_cthous_time1.model.data` and `PA_cthous_time2.model.data`).  
  
  iv. Run the model with `cthous_4_modelRun.qmd` [html](/code/Cerdocyon%20thous/cthous_4_modelRun.html). Two new files will be created:    
  - The JAGS model(`cthous_model.txt`)  
  - The model output (`cthous_model.rds`) - ***caution** this is a >5GB file*  
  
  v. And, finally, create the output figures with `cthous_5_modelOutputs.qmd` [html](/code/Cerdocyon%20thous/cthous_5_modelOutputs.html). The html output will show all the results, plus a new file will be created:    
  - The model diagnostics (`docs/cthous_model_diagnostics.pdf`).  


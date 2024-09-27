# Workflow

See species folders: [*Cerdocyon thous*](Cerdocyon%20thous), [*Chrysocyon brachyurus*](Chrysocyon%20brachyurus), [*Eira barbara*](Eira%20barbara), [*Herpailurus yagouaroundi*](Herpailurus%20yagouaroundi), [*Leopardus pardalis*](Leopardus%20pardalis), [*Leopardus wiedii*](Leopardus%20wiedii), [*Nasua nasua*](Nasua%20nasua), and [*Pteronura brasiliensis*](Pteronura%20brasiliensis).

For each species, the following order to run the code should be followed:

  1. The first code to run is the `*species*_1_dataGeneration.qmd`. Four new files will be created: 
  - PA blobs for time1 and time2 (`PA_species_time1_blobs` and `PA_species_time2_blobs`).  
  - PO rasters for time1 and time2 (`PO_species_time1_raster` and `PO_species_time2_raster`).  

  3. After, run `*species*_2_variableSelection.qmd` to get the best predictors for the modeled species. The predictors will be: `cov.1`, `cov.2`, `cov.3`, and `cov.4`.  

  2. Then run the `*species*_3_dataPreparation.qmd` code with the selected predictors to prepare the data for the model. Four new files will be created:    
  - PO data for time1 and time2 (`PO_*species*_time1.model.data` and `PO_*species*_time2.model.data`).  
  - PA data for time1 and time2 (`PA_*species*_time1.model.data` and `PA_*species*_time2.model.data`).  
  
  4. Run the model with `*species*_4_modelRun.qmd`. Two new files will be created:    
  - The JAGS model(`*species*_model.txt`)  
  - The model output (`*species*_model.rds`) - ***caution** this is a >5GB file*  
  
  5. And, finally, create the output figures with `*species*_5_modelOutputs.qmd`. The html output will show all the results, plus a new file will be created:    
  - The model diagnostics (`docs/*species*_model_diagnostics.pdf`).  


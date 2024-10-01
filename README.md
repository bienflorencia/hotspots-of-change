# Hotspots of change - Neotropical carnivores

## A continental-wide decline of occupancy and diversity in five Neotropical carnivores

*Florencia Grattarola <a dir="ltr" href="http://orcid.org/0000-0001-8282-5732" target="_blank"><img class="is-rounded" src="https://upload.wikimedia.org/wikipedia/commons/0/06/ORCID_iD.svg" width="15"></a>, Kateřina Tschernosterová, Petr Keil <a dir="ltr" href="http://orcid.org/0000-0003-3017-1858" target="_blank"><img class="is-rounded" src="https://upload.wikimedia.org/wikipedia/commons/0/06/ORCID_iD.svg" width="15"></a>*

This repository (https://github.com/bienflorencia/hotspots-of-change) includes the data, code, model and outputs for our work on mapping the temporal change, the areas where gains and losses accumulated for all species (hotspots of change), and calculating the temporal species turnover and change in spatial turnover. 


### Species

![](/docs/readme.png)

Photo credits **iNaturalist.org**: jaguarundi (*Herpailurus yagouaroundi*) by @hhulsberg, ocelot (*Leopardus pardalis*) by @cotingidae, crab-eating fox (*Cerdocyon thous*) by @farpost, maned wolf (*Chrysocyon brachyurus*) by @constanzamcl, tayra (*Eira barbara*) by @christoph_moning, margay (*Leopardus wiedii*) by @bigsam, coati (*Nasua nasua*) by @douglasmeyer, and giant river otter (*Pteronura brasiliensis*) by @npdowling. 

---

## 1) **Source data**: the *raw* data sources

- 32 literature sources digitised for this study: [`data/raw/OWN_literature_extraction.csv`](data/raw/data_Kaca.csv).   
- GBIF.org. (2024). 'Occurrence Download Neotropical Carnivores'. https://doi.org/10.15468/dl.67zvau 
- Nagy-Reis et al. (2020). 'NEOTROPICAL CARNIVORES: A Data Set on Carnivore Distribution in the Neotropics'. *Ecology* 101(11): e03128. https://doi.org/10.1002/ecy.3128 

## 2) **Underlying data**: the data we generated

### Tables

- [`data/data_PO.csv`](data/data_PO.csv): a csv file with the cleaned, standardised and harmonised presence-only data.  
- [`data/data_PA.csv`](data/data_PA.csv): a csv file with the cleaned, standardised and harmonised presence-absence data.  
- [`data/carnivores.csv`](data/carnivores.csv): a csv file with the carnivore species list extracted from the [Mammal Diversity Database](https://doi.org/10.5281/zenodo.5945626), including the family, taxon key from GBIF and IUCN conservation status.  

### Spatial files

- [`data/latam_raster.tif`](data/latam_raster.tif): a raster file with 2 layers; `latam` a raster of 100x100 km cell resolution of Latin America, and `countries`: a raster of 100x100 km cell resolution of the countries of Latin America.  
- [`data/latam.gpkg`](data/latam.gpkg): a geopackage with 3 layers; `countries`: a multi polygon sf file for the 56 countries of Latin America, `latam` a single polygon that combines all countries of Latin America, and `latam_land` a single polygon that combines all the landmass countries of Latin America (excluding islands).  

### Other files

- [`docs/digitised_references.bib`](docs/digitised_references.bib): BibTeX bibliographical database file with the 32 literature references digitised and included in our database.  
- `docs/*species*_model_diagnostics.pdf`: PDF files with the JAGS model diagnostics output (one per *species*).
- `models/*species*_model.txt`: text files with the JAGS models used for each *species*.  

## 3) **Extended Data**: the code we used to process the data

For each species: *Cerdocyon thous*, *Chrysocyon brachyurus*, *Eira barbara*, *Herpailurus yagouaroundi*, *Leopardus pardalis*, *Leopardus wiedii*, *Nasua nasua*, and *Pteronura brasiliensis*, these are the steps in the workflow:   

1. Prepare data
   1. Clean PO and PA data for all species: [`code/1_1_clean_PO_PA_data.qmd`](code/1_1_clean_PO_PA_data.qmd) | [html](/hotspots-of-change/code/1_1_clean_PO_PA_data.html)
   2. Create range maps distance to the edge as a covariate: [`code/1_2_create_range_map_covariate.qmd`](code/1_2_create_range_map_covariate.qmd) | [html](/hotspots-of-change/code/1_2_create_range_map_covariate.html) 
   3. Visualise PO grid-cells and PA blobs: [`code/1_3_visualise_grids_and_blobs.qmd`](code/1_3_visualise_grids_and_blobs.qmd) | [html](/hotspots-of-change/code/1_3_visualise_grids_and_blobs.html)
2. Analyse species by species (see species folders: [*Cerdocyon thous*](code/Cerdocyon%20thous), [*Chrysocyon brachyurus*](code/Chrysocyon%20brachyurus), [*Eira barbara*](code/Eira%20barbara), [*Herpailurus yagouaroundi*](code/Herpailurus%20yagouaroundi), [*Leopardus pardalis*](code/Leopardus%20pardalis), [*Leopardus wiedii*](code/Leopardus%20wiedii), [*Nasua nasua*](code/Nasua%20nasua), and [*Pteronura brasiliensis*](code/Pteronura%20brasiliensis)
   1. Data Generation: `*species*_1_dataGeneration.qmd`
   2. Variable Selection: `*species*_2_variableSelection.qmd`
   3. Data preparation for modelling: `*species*_3_dataPreparation.qmd`
   4. Model run: `*species*_4_modelRun.qmd`
   5. Model outputs: `*species*_5_modelOutputs.qmd`
3. Calculate hotspots of change
   1. Sample from the posterior: [`3_1_sampling_from_posterior.R`](code/3_1_sampling_from_posterior.R)
   2. Species richness, change and beta diversity: [`3_2_species_richness_change_and_beta_diversity.qmd`](code/3_2_species_richness_change_and_beta_diversity.qmd) | [html](/hotspots-of-change/code/3_2_species_richness_change_and_beta_diversity.html) 

Also, finde here the JAGS models used for each species: [`models`](models/).

## LICENCE

**Data** are available under the terms of the Creative Commons Attribution 4.0 International licence CC-BY 4.0 (https://creativecommons.org/licenses/by/4.0/legalcode.en).   

**Code** is available under the terms of the GPL-3.0 licence (https://www.gnu.org/licenses/gpl-3.0.html). 

## CITATION

> Grattarola F. (2024) A continental-wide decline of occupancy and diversity in five Neotropical carnivores. *Zenodo*. [DOI from Zenodo provided once the GitHub repository is archived]. [Data/Code]

> Grattarola F., Tschernosterová K., & Keil P. (2024) A continental-wide decline of occupancy and diversity in five Neotropical carnivores. *Global Ecology and Conservation*. https://doi.org/10.1016/j.gecco.2024.e03226

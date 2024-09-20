# Hotspots of change - Neotropical carnivores

## A continental-wide decline of occupancy and diversity in five charismatic Neotropical carnivores

*Florencia Grattarola, Kateřina Tschernosterová & Petr Keil*

This repository includes the data, code, model and outputs for our work on mapping the temporal change, the areas where gains and losses accumulated for all species (hotspots of change), and calculating the spatial and temporal dissimilarity. 

```mermaid
  flowchart TD
    subgraph prepare data
    a1("`clean PO and PA for all species`")-->a2("`create range maps distance to the edge`")
    a2("`create range maps distance to the edge`")-->a3("`visualise PO grid-cells and PA blobs`")
    end
    subgraph analyse species by species
    b1("`data generation`")-->b2("`variable Selection`")
    b2("`variable Selection`")-->b3("`data preparation for modelling`")
    b3("`data preparation for modelling`")-->b4("`model run`")
    b4("`model run`")-->b5("`model outputs`")
    end
    subgraph caluclate hotspots of change
    c1("`sample from the posterior`")-->c2("`species richness, change and beta diversity`")
    end
    a3 --> b1
    b5 --> c1
```

### Species

![](/docs/readme.png)

Photo credits **iNaturalist.org**: jaguarundi (*Herpailurus yagouaroundi*) by @hhulsberg, ocelot (*Leopardus pardalis*) by @cotingidae, crab-eating fox (*Cerdocyon thous*) by @farpost, maned wolf (*Chrysocyon brachyurus*) by @constanzamcl, tayra (*Eira barbara*) by @christoph_moning, margay (*Leopardus wiedii*) by @bigsam, coati (*Nasua nasua*) by @douglasmeyer, and giant river otter (*Pteronura brasiliensis*) by @npdowling.  

library(tidyverse)
# sample 1000 values 
# n.keep <- nnasua_model$BUGSoutput$n.keep
# n.gridcells <- ncol(nnasua_P.pred)

# I need a n.sample X n.gridcells matrix
# 1000 4360

pbrasiliensis_model <- readRDS('D:/Flo/JAGS_models/pbrasiliensis_model.rds')

pbrasiliensis_P.pred <- pbrasiliensis_model$BUGSoutput$sims.list$P.pred
n.sample <- 1000

pbrasiliensis_P.pred_sample <- pbrasiliensis_P.pred[sample(nrow(pbrasiliensis_P.pred), 
                                               size = n.sample), ]
saveRDS(pbrasiliensis_P.pred_sample, 'data/pbrasiliensis_P.pred_sample.rds')

rm(pbrasiliensis_model)

##############

lwiedii_model <- readRDS('D:/Flo/JAGS_models/lwiedii_model.rds')

lwiedii_P.pred <- lwiedii_model$BUGSoutput$sims.list$P.pred
n.sample <- 1000

lwiedii_P.pred_sample <- lwiedii_P.pred[sample(nrow(lwiedii_P.pred), 
                                                   size = n.sample), ]
saveRDS(lwiedii_P.pred_sample, 'data/lwiedii_P.pred_sample.rds')

rm(lwiedii_model)

##############

lpardalis_model <- readRDS('D:/Flo/JAGS_models/lpardalis_model.rds')

lpardalis_P.pred <- lpardalis_model$BUGSoutput$sims.list$P.pred
n.sample <- 1000

lpardalis_P.pred_sample <- lpardalis_P.pred[sample(nrow(lpardalis_P.pred), 
                                                           size = n.sample), ]
saveRDS(lpardalis_P.pred_sample, 'data/lpardalis_P.pred_sample.rds')

rm(lpardalis_model)

##############

# hyagouaroundi_model <- readRDS('D:/Flo/JAGS_models/hyagouaroundi_model.rds')
hyagouaroundi_model <- readRDS('big_data/hyagouaroundi_model.rds')


hyagouaroundi_P.pred <- hyagouaroundi_model$BUGSoutput$sims.list$P.pred
n.sample <- 1000

hyagouaroundi_P.pred_sample <- hyagouaroundi_P.pred[sample(nrow(hyagouaroundi_P.pred), 
                                                 size = n.sample), ]
saveRDS(hyagouaroundi_P.pred_sample, 'data/hyagouaroundi_P.pred_sample.rds')

rm(hyagouaroundi_model)

##############

ebarbara_model <- readRDS('D:/Flo/JAGS_models/ebarbara_model.rds')

ebarbara_P.pred <- ebarbara_model$BUGSoutput$sims.list$P.pred
n.sample <- 1000

ebarbara_P.pred_sample <- ebarbara_P.pred[sample(nrow(ebarbara_P.pred), 
                                                       size = n.sample), ]
saveRDS(ebarbara_P.pred_sample, 'data/ebarbara_P.pred_sample.rds')

rm(ebarbara_model)

##############

cbrachyurus_model <- readRDS('D:/Flo/JAGS_models/cbrachyurus_model.rds')

cbrachyurus_P.pred <- cbrachyurus_model$BUGSoutput$sims.list$P.pred
n.sample <- 1000

cbrachyurus_P.pred_sample <- cbrachyurus_P.pred[sample(nrow(cbrachyurus_P.pred), 
                                             size = n.sample), ]
saveRDS(cbrachyurus_P.pred_sample, 'data/cbrachyurus_P.pred_sample.rds')

rm(cbrachyurus_model)

##############

cthous_model <- readRDS('D:/Flo/JAGS_models/cthous_model.rds')

cthous_P.pred <- cthous_model$BUGSoutput$sims.list$P.pred
n.sample <- 1000

cthous_P.pred_sample <- cthous_P.pred[sample(nrow(cthous_P.pred), 
                                             size = n.sample), ]
saveRDS(cthous_P.pred_sample, 'data/cthous_P.pred_sample.rds')

rm(cthous_model)

##############

nnasua_model <- readRDS('D:/Flo/JAGS_models/nnasua_model.rds')

nnasua_P.pred <- nnasua_model$BUGSoutput$sims.list$P.pred
n.sample <- 1000

nnasua_P.pred_sample <- nnasua_P.pred[sample(nrow(nnasua_P.pred), 
                                             size = n.sample), ]
saveRDS(nnasua_P.pred_sample, 'data/nnasua_P.pred_sample.rds')

rm(nnasua_model)



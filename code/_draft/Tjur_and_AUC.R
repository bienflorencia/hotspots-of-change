library(spatstat)
library(sp)
library(maptools)
library(rgeos)
library(raster)
library(gstat)
#-------
library(jagsUI) # interface to JAGS
library(tidyverse)


# make randomness reproducible
set.seed(1234567)  

#--------------------------------------------------------------------
# Environment
size=100
env <- im(matrix(0, size, size), xrange=c(0,1), yrange=c(0,1))
xy <- expand.grid(x = env$xcol, y = env$yrow)
g.dummy <- gstat(formula=z~1, locations=~x+y, dummy=T, beta=0,
                 model=vgm(psill=0.1, range=50, model='Exp'), nmax=20)
env <- predict(g.dummy, newdata=xy, nsim=1)

sp::gridded(env) <- ~x+y
env <- as.im(raster(env))
# scale the env. variable
env <- (env - min(env))
env <- env / max(env)

#--------------------------------------------------------------------
# Parameters
alpha <- 0  # intercept of the environment-intensity relationship
beta <- 10 # slope of the environment-intensity relationship
true.params <- c(alpha = alpha, beta = beta)

#--------------------------------------------------------------------
# True point pattern
# point process intensity lambda as a function of environment
lambda <- exp(alpha + beta*env)

# sample points using inhomogeneous poisson point process
PTS <- rpoispp(lambda)
PTS.sp <- as(object=PTS, "SpatialPoints")

#--------------------------------------------------------------------
# Generate presence-absence survey locations (polygons)
# number of survey locations
N.surv <- 50

# generate the polygons
X <- rThomas(kappa = 50,  scale = 0.2, mu = 5, win=owin(xrange=c(0,1), yrange=c(0,1)))
PLS <- dirichlet(X)
PLS.sub <- PLS[sample(1:length(PLS$tiles), size=N.surv)]

# convert tesselation to sp class
PLS.sp <- as(PLS.sub, "SpatialPolygons")

# calculate area, coordinates, abundance, and incidence in each polygon
PLS.area <- gArea(PLS.sp, byid=T)
PLS.coords <- data.frame(coordinates(PLS.sp))

names(PLS.coords) <- c("X","Y")
PLS.abund <- unlist(lapply(X = over(PLS.sp, PTS.sp, returnList = TRUE), FUN = length))
PLS.y <- 1*(PLS.abund > 0)
y <- unname(PLS.y)

thr <- seq(0, 1, 0.05)

# extract environmental variables
PLS.env <- raster::extract(x = raster(env), y = PLS.sp, fun = mean)[,1]

jags.data <- list(n = N.surv,
                  y = y,
                  area = unname(PLS.area),
                  env = PLS.env,
                  thr = thr)

plot(PLS.sp, col = jags.data$y)
plot(PTS.sp, add=T, pch = 19, col = "red")


# JAGS code
cat('model
  {
    # PRIORS --------------------------------------------------

    ## Effect of sampling effort in PA data
    alpha ~ dnorm(0, 0.01)
    beta ~ dnorm(0, 0.01)

    # LIKELIHOOD --------------------------------------------------

    for (i in 1:n)
    {
        # the probability of presence
        cloglog(psi[i]) <- alpha + beta*env[i] + log(area[i])

        # presences and absences come from a Bernoulli distribution
        y[i] ~ dbern(psi[i])    

    # POSTERIOR PREDICTIVE CHECK  --------------------------------
    # Fit assessments: Tjur R-Squared (fit statistic for logistic regression)
        pres[i] <- ifelse(y[i] > 0, psi[i], 0)
        absc[i] <- ifelse(y[i] == 0, psi[i], 0)
    }
    # Discrepancy measures for entire data set
    pres.n <- sum(y[] > 0)
    absc.n <- sum(y[] == 0)
    r2_tjur <- abs(sum(pres[])/pres.n - sum(absc[])/absc.n)
    
    # AUC
    for (t in 1:length(thr)) {
        sens[t] <- sum((psi > thr[t]) && (y==1))/pres.n   #tpr (sensitivity)
        spec[t] <- sum((psi < thr[t]) && (y==0))/absc.n   
        fpr[t] <- 1 - spec[t]                             #fpr (1-specificity)
    }
    auc <- sum((sens[2:length(sens)]+sens[1:(length(sens)-1)])/2 * 
    -(fpr[2:length(fpr)] - fpr[1:(length(fpr)-1)]))
    
  }
', file = 'code/_draft/r2tujr.txt')

# Run
fitted.model <- jagsUI::jags(data=jags.data,
                             model.file='code/_draft/r2tujr.txt',
                             parameters.to.save=c('alpha', 'beta',
                                                  'psi', 'y.new',
                                                  'r2_tjur',
                                                  'sens', 'spec', 'fpr', 'auc'),
                             n.chains=3,
                             n.iter=20000,
                             n.thin=1,
                             n.burnin=2000,
                             parallel=TRUE,
                             DIC = FALSE)


# Checks

MCMCvis::MCMCplot(object = fitted.model,
                  params = c('alpha', 'beta'));
points(true.params, 2:1, pch=19, col="red")

MCMCvis::MCMCtrace(object = fitted.model,
                  params = c('alpha', 'beta'), pdf = FALSE)

## Tjur's R2

psi <- fitted.model$mean$psi
y <- jags.data$y
pred <- data.frame(y, psi)

r2_tjur <- round(fitted.model$mean$r2_tjur, 3)

ggplot(pred, aes(x=y, y=psi, col=y)) +
  geom_jitter(height = 0, width = .05, size=2)  +
  scale_x_continuous(breaks=seq(0,1,0.25)) + scale_colour_binned() +
  labs(x='observed', y=latex2exp::TeX('$psi$'), title='Presence-absence') +
  stat_summary(
    fun = mean,
    geom = "errorbar",
    aes(ymax = ..y.., ymin = ..y..),
    width = 0.2, size=2) +
  theme_bw() + theme(legend.position = 'none')+
  annotate(geom="text", x=0.5, y=0.5,
           label=paste('Tjur R-squared = ', r2_tjur))

R2.Tjur <- function(Y.obs, Y.pred){
  Y.obs <- as.matrix(Y.obs)
  Y.pred <- as.matrix(Y.pred)
  r2 <- numeric(ncol(Y.obs))
  for(i in 1:ncol(Y.obs)){
    r2[i] <- unname(diff(tapply(Y.pred[,i], Y.obs[,i], mean, na.rm = TRUE)))
  }
  return(r2)
}
R2.Tjur(jags.data$y, fitted.model$mean$psi)



## AUC
### AUC (area under the reciever operator characteristic curve) is a rank-based rule that gives a high score when the predicted probabilities related to the successes (y[j]=1) are consistently higher than the probabilities associated with failures (y[j]=0).

###  true positive rate (TPR) and true negative rate (TNR)
#<script src="https://gist.github.com/johnbaums/098bb760422801d10aed.js"></script>
# python - Manually calculate AUC - Stack Overflow
# You can divide the space into 2 parts: a triangle and a trapezium. The triangle will have area TPR*FRP/2 , the trapezium (1-FPR)*(1+TPR)/2 = 1/2 - FPR/2 + TPR/2 - TPR*FPR/2 . The total area is 1/2 - FPR/2 + TPR/2 . This is how you can get it, having just 2 points

sens <- fitted.model$mean$sens
fpr <- fitted.model$mean$fpr
auc.jags <- fitted.model$mean$auc

plot(fpr, sens, type='o', pch=20, 
     xlab='1 - Specificity', ylab='Sensitivity')
text(x=0.5, y=0.5, paste0('AUC= ', round(auc.jags,3)))
sum((sens[-1]+sens[-length(sens)])/2 * -diff(fpr)) # auc

fitted.model$mean$auc



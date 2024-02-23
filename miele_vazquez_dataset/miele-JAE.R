#################################################
### DATA LOAD
#################################################
load("miele-JAE.RData")

#################################################
### DATA DISCRETIZATION
## (to use dynSBM with multinomial distributions)
#################################################
par(mfrow=c(2,1))
K <- 3 
discretized.networks <- array(0, dim=c(18,255,255))
discretized.networks[,1:59,] <- directed.networks[,1:59,]
discretized.networks[,60:255,] <- directed.networks[,60:255,]
discretized.networks[discretized.networks>0 & discretized.networks<0.2] <- -1L
discretized.networks[discretized.networks>=0.2 & discretized.networks<0.8] <- -2L
discretized.networks[discretized.networks>=0.8] <- -3L
discretized.networks <- -discretized.networks

################################################
### MODEL ESTIMATION (can take a long time)
################################################
library(dynsbm)
list.dynsbm <- select.dynsbm(discretized.networks, Qmin=2, Qmax=8,
                             edge.type="discrete", K=3,
                             nstart=100, nb.cores=4, directed=T,
                             bipartition=c(rep(1,59),rep(2,196)), fixed.param=TRUE)
dynsbm <- list.dynsbm[[3]]


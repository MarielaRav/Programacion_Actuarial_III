completos <- function(directorio, id){
  numid <- length(id)
  n_obs <- vector("numeric", numid)
  
  for (i in 1:numid){
    id0 <- sprintf("%03d", id[i])
    id1 <- paste(id0, ".csv", sep = "")
    dir <- paste(directorio, id1, sep = "/")
    bd <- read.csv(dir)
    n_obs[i] <- sum(complete.cases(bd))
  }
  df <- data.frame(id, n_obs)
  df
}
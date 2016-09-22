mediacontaminante <- function(directorio, contaminante, id){
  numid <- length(id)
  pro <- vector("numeric", numid)
  cont <- vector("numeric", numid)
  
  if (contaminante == "sulfato"){
    col <- 2
  } else if (contaminante == "nitrato"){
    col <- 3
  }
  
  for(i in 1:numid){
    id0 <- sprintf("%03d", id[i])
    id1 <- paste(id0, ".csv", sep="")
    dir <- paste(directorio, id1, sep="/")
    bd <- read.csv(dir)
    cont[i] <- sum(complete.cases(bd[,col]))
    med0 <- mean(bd[,col], na.rm = T)
    pro[i] <- cont[i]*med0
  }
  resultado <- sum(pro)/sum(cont)
  resultado
}
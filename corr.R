corr <- function(directorio, horizonte){
  ad <- list.files(directorio)
  n <- length(ad)
  cont <- 0
  bd0 <- vector("numeric")
  resultado <- vector("numeric")

  for (i in 1:n){
    dir <- paste(directorio, ad[i], sep="/")
    bd <- read.csv(dir)
    k <- sum(complete.cases(bd))
    if (k > horizonte){
      cont <- cont + 1
      bd0[cont] <- ad[i]
    }
  }
  
  if (cont == 0){
    stop("Ningún archivo cumple con los requisitos.")
  }
  x <- length(bd0)
  
  for (i in 1:x){
    dir <- paste(directorio, bd0[i], sep="/")
    bd <- read.csv(dir)
    sulf <- bd[,2]
    nitr <- bd[,3]
    resultado[i] <- cor(sulf, nitr, use = "complete.obs")
  }
  resultado
  
}

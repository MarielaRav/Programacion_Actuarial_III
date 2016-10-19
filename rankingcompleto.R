rankingcompleto <- function(resultado, num = "mejor"){
      setwd("~/GitHub/Programacion_Actuarial_III/Calidad de Hospitales - data")
      data <- read.table("outcome-of-care-measures.csv", header = T, sep = ",")
      
      if(!(resultado=="ataque" | resultado=="falla" | resultado=="neumonia")){
            stop("resultado inválido")
      }
      
      if(resultado=="ataque"){
            data1 <- data[, 11]
      } else if(resultado=="falla"){
            data1 <- data[, 17]
      } else{
            data1 <- data[, 23]
      }
      data2 <- data[, 2]
      spl <- split(data1, data[, 7])
      spl2 <- split(data2, data[, 7])
      hospital <- vector(mode = "character")
      
      for(i in levels(data[, 7])){
            suppressWarnings(sp1 <- as.numeric(as.character(unlist(spl[i], use.names = F))))
            sp2 <- as.character(unlist(spl2[i], use.names = F))
            ord <- order(sp1, sp2, na.last = NA)
            if(num=="mejor"){
                  hospital[i] <- sp2[ord[1]]
            } else if(num=="peor"){
                  hospital[i] <- sp2[ord[length(ord)]]
            } else if(is.numeric(num) & num < length(ord)){
                  hospital[i] <- sp2[ord[num]]
            } else{
                  hospital[i] <- NA
            }
      }
      df <- data.frame(unlist(hospital, use.names = F), unique(data[, 7]))
      names(df) <- c("hospital", "estado")
      df
}
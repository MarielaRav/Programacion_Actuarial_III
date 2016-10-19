rankhospital <- function(estado, resultado, num = "mejor"){
      setwd("~/GitHub/Programacion_Actuarial_III/Calidad de Hospitales - data")
      data <- read.table("outcome-of-care-measures.csv", header = T, sep = ",",
                         stringsAsFactors = F)
      
      if(!is.element(estado, data[, 7])){
            stop("estado inválido")
      }
      if(!(resultado=="ataque" | resultado=="falla" | resultado=="neumonia")){
            stop("resultado inválido")
      }
      
      if(resultado=="ataque"){
            data1 <- data[data[, 7] == estado, 11]
      } else if(resultado=="falla"){
            data1 <- data[data[, 7] == estado, 17]
      } else{
            data1 <- data[data[, 7] == estado, 23]
      }
      data2 <- data[data[, 7] == estado, 2]
      
      suppressWarnings(ord <- order(as.numeric(data1), data2, na.last = NA))
      if(num=="mejor"){
            hospital <- data2[ord[1]]
      } else if(num=="peor"){
            hospital <- data2[ord[length(ord)]]
      } else if(is.numeric(num) & num < length(ord)){
            hospital <- data2[ord[num]]
      } else{
            hospital <- NA
      }
      hospital
}
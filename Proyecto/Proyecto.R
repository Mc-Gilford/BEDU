#Obtenemos la ruta de donde nos ubicamos
getwd()
#Colocamos la ruta a donde iremos
#setwd("BEDU/DataScience/Postworks/Poswork 1/BEDU/Proyecto/")

#install.packages("dplyr")
library(dplyr)

datos<-read.csv("Consolidado para R-ENOE-Indicadores estratégicos-enero2005-diciembre2020.csv")
class(datos)
summary(datos)

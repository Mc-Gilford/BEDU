#Obtenemos la ruta de donde nos ubicamos
getwd()
#Colocamos la ruta a donde iremos
#setwd("BEDU/DataScience/Postworks/Poswork 1/BEDU/Proyecto/")

#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr)
library(ggplot2)

datos<-read.csv("Consolidado para R-ENOE-Indicadores estratégicos-enero2005-diciembre2020.csv")
class(datos)
summary(datos)
dim(datos)

datos<-group_by(datos, datos$Año)
datos
dim(datos)
View(datos)
names(datos)
str(datos)

datos <- mutate(datos, Año=as.numeric(Año))

datos <- mutate(datos, as.numeric())
str(datos)
datos<-as.data.frame(gsub(" ","",datos))
View(datos)
#columnas, filas
datos[1,]

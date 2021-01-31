#Obtenemos la ruta de donde nos ubicamos
getwd()
#Colocamos la ruta a donde iremos
#setwd("BEDU/DataScience/Postworks/Poswork 1/BEDU/Proyecto/")

#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr)
library(ggplot2)

datos<-read.csv("Consolidado para R-ENOE-Indicadores estratégicos-enero2005-diciembre2020.csv")
head(datos)
class(datos)
summary(datos)
dim(datos)

datos %>%  group_by(Año) %>% summarise(mean = mean(Población.total), sum = sum(Población.de.15.años.y.más), n = n())
datos
View(datos)
names(datos)
str(datos)


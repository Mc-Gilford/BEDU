#Primer Postwork 
library(dplyr)

#Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos
# los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php
bbva1920 <- read.csv("SP1.csv")
#Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles
#anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)
goals <- select(bbva1920,FTHG,FTAG)
goals
#Consulta cómo funciona la función table en R al ejecutar en la consola ?table
homegoals <- table(goals$FTHG)
outgoals <- table(goals$FTAG)
hogoals <- table(goals)

#Posteriormente elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:

#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...)
#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...)
#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como
# visitante anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)

hogoals

#Probabilidad Marginales

#Probabilidad marginal de equipo que juega en casa:

homegoalsprob <- prop.table(x=homegoals)

homegoalsprob


#Obtener el tam de los registros
n<-length(goals$FTAG)
n
#Probabilidad Marginal de Goles Equipos Visitantes
sumf<-outgoals/n
sumf
sum(sumf) #La suma de todas las probabilidades de goles Visitantes debe ser 1, con lo cual se comprueba que el calculo es correcto

#O se puede realizar de la siguiente manera
outgoalsprob <- prop.table(x=outgoals)

outgoalsprob





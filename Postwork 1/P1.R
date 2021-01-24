#Primer Postwork 
#Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos
# los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

#Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles
#anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)

#Consulta cómo funciona la función table en R al ejecutar en la consola ?table

#Posteriormente elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:

#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...)
#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...)
#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como
# visitante anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)



#Probabilidad Marginales
#Obtener el tam de los registros
n<-length(EquiposVisita)
n
#Probabilidad Marginal de Goles Equipos Visitantes
sumf<-sumf/n
sumf
sum(sumf) #La suma de todas las probabilidades de goles Visitantes debe ser 1, con lo cual se comprueba que el calculo es correcto
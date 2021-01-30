#Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

#Obten una mejor idea de las características de los data frames al usar las funciones: str, head, View y summary

#Con la función select del paquete dplyr selecciona únicamente las columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para cada uno de los data frames. (Hint: también puedes usar lapply).

#Asegúrate de que los elementos de las columnas correspondientes de los nuevos data frames sean del mismo tipo (Hint 1: usa as.Date y mutate para arreglar las fechas). Con ayuda de la función rbind forma un único data frame que contenga las seis columnas mencionadas en el punto 3 (Hint 2: la función do.call podría ser utilizada).
getwd()
setwd("BEDU/DataScience/Postworks/Poswork 1/BEDU/Postwork 2/")

#POST-WORK SESION 2
#CARGAMOS LIBRERIA DPLYR
suppressWarnings(suppressMessages(library(dplyr)))
#IMPORTANDO LOS DATOS
#U1 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
#IMPORTANDO LOS DATASETS
#dataset1 <- read.csv(file = U1)

#1 Importar los archivos

datos1718 <- read.csv("1718.csv")
datos1819 <- read.csv("1819.csv")
datos1920 <- read.csv("1920.csv")

# 2: Obten una mejor idea de las características de los DF

#Datos 2017-2018

str(datos1718)

head(datos1718)

View(datos1718)

summary(datos1718)

#Datos 2018-2019

str(datos1819)

head(datos1819)

View(datos1819)

summary(datos1819)

#Datos 2019-2020

str(datos1920)

head(datos1920)

View(datos1920)

summary(datos1920)

# VERIFICAMOS EL TIPO DE DATOS QUE HAY EN CADA DATASET USANDO STR, HEAD, VIEW, SUMMARY
#str(dataset1)

#Aplicaremos el select para seleccionar las columnas que deseamos tener RJs
#Podemos realizar el siguiente comando para leer todos los archivos
#dir()
#lista <- lapply(dir(), read.csv) 
lista
#Usaremos el siguiente comando para juntar los datos, en una lista y realizar el select
lista<-list(datos1718,datos1819,datos1920)
lista
lista <- lapply(lista, select, Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR)
lista

str(lista)

#aplicamos el rbind

bbva1720 <- do.call(rbind,lista)
head(bbva1720)

str(bbva1720)
#Actualizamos los tipos de datos (date)
bbva1720 <- mutate(bbva1720, Date = as.Date(Date, "%d-%m-%Y"))
str(bbva1720)


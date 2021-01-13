Primeradivision<-read.csv("BEDU/DataScience/Programacion y Estadistica con R/Sesion 1/Postwork/SP1.csv")
Primeradivision
length(Primeradivision)
colnames(Primeradivision)
#FTHG Goles FTAG Goles en contra
#[archivo$release_year > 2015, ]
EquiposEncasa <- Primeradivision$FTHG
EquiposEncasa
length(EquiposEncasa)
EquiposVisita <- Primeradivision$FTAG
EquiposVisita
length(EquiposVisita)
?table
Tabla<-table(EquiposCasa=EquiposEncasa, EquiposVis=EquiposVisita)
Tabla
m<-cbind(EquiposEncasa,EquiposVisita)
m<-rbind(EquiposEncasa,EquiposVisita)
m
sumf <-apply(Tabla,1,sum)#Filas 
sumc <-apply(Tabla,2,sum)#Columnnas
sumf
sumc
#Probabilidad Marginales
#Obtener el tam de los registros
n<-length(EquiposEncasa)
n
#Probabilidad Marginal de Goles Equipos Visitantes
sumf<-sumf/n
sumf
sum(sumf) #La suma de todas las probabilidades de goles Visitantes debe ser 1
#Probabilidad Marginal de Goles Equipos en Casa
sumc<-sumc/n
sumc
sum(sumc) #La suma de todas las probabilidades de goles en Casa debe ser 1

#Probabilidad conjunta
Pconjunta<- Tabla/n
Pconjunta
sumf<-apply(Pconjunta,1,sum)
sumc<-apply(Pconjunta,2,sum)
#Ya sea sumando todas las columnas o filas nos debe de dar 1, es lo que hacemos en la siguiente parte, que nos indica
#que hemos hecho las operaciones correctas
sumf
sumc
sum(sumc)
sum(sumf)

#Tabla
#which.max(EquiposEncasa)
#which.min(EquiposEncasa)
#EquiposEncasa[5]

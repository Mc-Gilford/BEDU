#Obtenemos la ruta de donde nos ubicamos
getwd()
#Colocamos la ruta a donde iremos
#setwd("BEDU/DataScience/Postworks/Poswork 1/BEDU/Proyecto/")

#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("forecast")
#install.packages("tseries")
library(dplyr)
library(ggplot2)
library(forecast)
library(tseries)

#Desactivar notación científica
options(scipen = 999)

datos<-read.csv("Consolidado para R-ENOE-Indicadores estratégicos-enero2005-diciembre2020.csv")
head(datos)
class(datos)
summary(datos)
dim(datos)
#Obtenemos la poblacion total de personas en el pais, y la poblacion que tiene 15 a;os o mas
PromedioAnual<-datos %>%  group_by(Año) %>% summarise(PromedioTotal = mean(Población.total), Promedio15oMAS = mean(Población.de.15.años.y.más), n = n())
PromedioAnual<-as.data.frame(PromedioAnual)
class(PromedioAnual)
PromedioAnual
datos

#Graficamos la poblacion junto con su creciemnto
ggplot(PromedioAnual, aes(x=PromedioTotal, y=Promedio15oMAS)) + geom_line(color="blue") + 
   labs(x = "Poblacion General", 
        y = "Poblacion Mayor a 15 años",
        title = paste("Poblacion Adolescente-Adulta", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
   geom_line(color = "#ed6381") + theme(plot.title = element_text(size=12)) +
   theme(axis.text.x = element_text(face = "bold", color="#3424bc" , size = 10, angle = 45, hjust = 1),
         axis.text.y = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1))  # color, Ángulo y estilo de las abcisas y ordenadas
 # color, Ángulo y estilo de las abcisas y ordenadas



#Hacemos el analisis de la Poblacion Economica Activa y de la no activa mediante los siguientes graficos
PEAPNEA <- select(datos,  	Población.económicamente.activa..PEA.:PNEA.No.disponible)
PEAPNEA

#Hacemos la agrupacion por anio para que la graficas, sean un poco mas limpias para ver si existen patrones

PoblacionesEconomicas<-NULL
PoblacionesEconomicas<-datos %>%  group_by(Año) %>% summarise(PEAactiva = mean(Población.económicamente.activa..PEA.), 
                                                              PNEAactiva = mean(Población.no.económicamente.activa..PNEA.),
                                                              PEAOcupada = mean(PEA.Ocupada),PNEA = mean(PNEA.No.disponible),
                                                              PEAdesocupada = mean(PEA.Desocupada), PNEAdesocupada=mean(PNEA.Disponible),
                                                              n = n())
PoblacionesEconomicas<-as.data.frame(PoblacionesEconomicas)

PoblacionesEconomicas

ggplot(PEAPNEA, aes(x=Población.económicamente.activa..PEA., y=Población.no.económicamente.activa..PNEA.)) + geom_line(color="blue") + 
   labs(x = "Poblacion economica activa (PEA)", 
        y = "Poblacion economica no activa(PNEA)",
        title = paste("Poblacion economica", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
   geom_line(color = "#ed6381") + theme(plot.title = element_text(size=12)) +
   theme(axis.text.x = element_text(face = "bold", color="#ab24bc" , size = 10, angle = 45, hjust = 1),
         axis.text.y = element_text(face = "bold", color="#993333" , size = 10, angle = 45, hjust = 1))
#grafica realizada por a;o
   ggplot(PoblacionesEconomicas, aes(x=PEAactiva, y=PNEAactiva)) + geom_line(color="#acd322") + 
   labs(x = "Poblacion economica activa (PEA)", 
        y = "Poblacion economica no activa(PNEA)",
        title = paste("Poblacion economica", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
   geom_line(color = "#ed6381") + theme(plot.title = element_text(size=12)) +
   theme(axis.text.x = element_text(face = "bold", color="#ab24bc" , size = 10, angle = 45, hjust = 1),
         axis.text.y = element_text(face = "bold", color="#221b33" , size = 10, angle = 45, hjust = 1))  
   #cada a;o de poblacion economica activa
   ggplot(PoblacionesEconomicas, aes(x=Año, y=PEAactiva)) + geom_line(color="#acd322") + 
      labs(x = "Año", 
           y = "Poblacion Economica Activa",
           title = paste("Poblacion economica Activa Ocupados anualmente", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
      geom_line(color = "#ed6381") + theme(plot.title = element_text(size=12)) +
      theme(axis.text.x = element_text(face = "bold", color="#ab24bc" , size = 12, angle = 45, hjust = 1),
            axis.text.y = element_text(face = "bold", color="#221b33" , size = 12, angle = 45, hjust = 1))  
   #cada a;o de poblacion economica activa
   ggplot(PoblacionesEconomicas, aes(x=Año, y=PNEAactiva)) + geom_line(color="#acd322") + 
      labs(x = "Año", 
           y = "Poblacion Economica No Activa",
           title = paste("Poblacion economica no activa Ocupados actualmente", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
      geom_line(color = "#ed6381") + theme(plot.title = element_text(size=12)) +
      theme(axis.text.x = element_text(face = "bold", color="#ab24bc" , size = 12, angle = 45, hjust = 1),
            axis.text.y = element_text(face = "bold", color="#221b33" , size = 12, angle = 45, hjust = 1))  
   
#Veremos la poblacion economica ativa ocupada y la poblocion economica no ocupada
ggplot(PEAPNEA, aes(x=PEA.Ocupada, y=PNEA.No.disponible)) + geom_line(color="blue") + 
   labs(x = "PEA Ocupada", 
        y = "PNEA Ocupada",
        title = paste("Poblacion economica estado", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
   geom_line(color = "#aa24bc") + theme(plot.title = element_text(size=12)) +
   theme(axis.text.x = element_text(face = "bold", color="#aa24bc" , size = 10, angle = 45, hjust = 1),
         axis.text.y = element_text(face = "bold", color="#fd3c33" , size = 10, angle = 45, hjust = 1))  
#Grafica realizada por a;o
ggplot(PoblacionesEconomicas, aes(x=PEAdesocupada, y=PNEAdesocupada)) + geom_line(color="#aff722") + 
   labs(x = "Poblacion economica activa (PEA)", 
        y = "Poblacion economica no activa(PNEA)",
        title = paste("Poblacion economica Desocupada", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
   geom_line(color = "#ed6381") + theme(plot.title = element_text(size=12)) +
   theme(axis.text.x = element_text(face = "bold", color="#db24bc" , size = 10, angle = 45, hjust = 1),
         axis.text.y = element_text(face = "bold", color="#e11b23" , size = 10, angle = 45, hjust = 1))  

ggplot(PoblacionesEconomicas, aes(x=Año, y=PEAdesocupada)) + geom_line(color="#acd322") + 
   labs(x = "Año", 
        y = "Poblacion Economica Activa",
        title = paste("Poblacion economica Activa desocupados anualmente", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
   geom_line(color = "#ed6381") + theme(plot.title = element_text(size=12)) +
   theme(axis.text.x = element_text(face = "bold", color="#ab24bc" , size = 12, angle = 45, hjust = 1),
         axis.text.y = element_text(face = "bold", color="#221b33" , size = 12, angle = 45, hjust = 1))  
#cada a;o de poblacion economica activa
ggplot(PoblacionesEconomicas, aes(x=Año, y=PNEAdesocupada)) + geom_line(color="#acd322") + 
   labs(x = "Año", 
        y = "Poblacion Economica No Activa desocupados",
        title = paste("Poblacion economica no activa actualmente", format(Sys.time(), tz="America/Mexico_City",usetz=TRUE))) +
   geom_line(color = "#ed6381") + theme(plot.title = element_text(size=12)) +
   theme(axis.text.x = element_text(face = "bold", color="#ab24bc" , size = 12, angle = 45, hjust = 1),
         axis.text.y = element_text(face = "bold", color="#221b33" , size = 12, angle = 45, hjust = 1))  


###Aqui seguir añadiendo



View(datos)
names(datos)
str(datos)

######################################################################
#Modelaje de series de tiempo
######################################################################
empleo <- datos
attach(empleo)

#Escenario sobre efecto de la pandemia suponiendo que dure 12 meses más
covid_reg_for<-rep(1,12)

######################################################################

#Análisis general de impacto en el empleo

#Creación de series de tiempo

empleo_ts = ts(PEA.Ocupada/1000000, start = 2005, frequency = 12)
covid_reg = ts(COVID.19, start = 2005, frequency = 12)

#Exploración inicial

plot(empleo_ts, xlab = "", ylab = "")
title(main = "Empleo en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

empleo_arima <-auto.arima(empleo_ts, xreg = covid_reg)
summary(empleo_arima)

#Evaluación del modelo

acf(resid(empleo_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(empleo_arima)

#Pronóstico del modelo

empleo_for <-forecast(empleo_arima,xreg=covid_reg_for,h=12)
empleo_for
plot(empleo_for)
title(main = "",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Insertar en tabla de medias

media_empleo_2019<-round(mean(empleo[169:180,"PEA.Ocupada"])/1000000,2)
media_empleo_2020<-round(mean(empleo[181:192,"PEA.Ocupada"])/1000000,2)
media_empleo_2021<-round(mean(empleo_for$fitted,2))

#Creación de tabla de medias

tabla_de_medias <-data.frame(rbind(c("Empleo", media_empleo_2019,media_empleo_2020,media_empleo_2021)))
colnames(tabla_de_medias)<-c("Serie", "Media 2019 (millones)","Media 2020 (millones)","Media 2021(pronóstico | millones)")   

######################################################################

#Análisis por sector económico
##Primario

primario_ts = ts(Primario/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(primario_ts, xlab = "", ylab = "")
title(main = "Empleo del sector primario en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

primario_arima <-auto.arima(primario_ts, xreg = covid_reg)
summary(primario_arima)

#Evaluación del modelo

acf(resid(primario_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(primario_arima)

#Pronóstico del modelo

primario_for <-forecast(primario_arima,xreg=covid_reg_for,h=12)
primario_for
plot(primario_for)
title(main = "",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_primario_2019<-round(mean(empleo[169:180,"Primario"]/1000000),2)
media_primario_2020<-round(mean(empleo[181:192,"Primario"]/1000000),2)
media_primario_2021<-round(primario_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Sector Primario", media_primario_2019,media_primario_2020,media_primario_2021))


##Secundario

secundario_ts = ts(Secundario/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(secundario_ts, xlab = "", ylab = "")
title(main = "Empleo del sector secundario en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

secundario_arima <-auto.arima(secundario_ts, xreg = covid_reg)
summary(secundario_arima)

#Evaluación del modelo

acf(resid(secundario_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(secundario_arima)

#Pronóstico del modelo

secundario_for <-forecast(secundario_arima,xreg=covid_reg_for,h=12)
secundario_for
plot(secundario_for)
title(main = "",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_secundario_2019<-round(mean(empleo[169:180,"Secundario"]/1000000),2)
media_secundario_2020<-round(mean(empleo[181:192,"Secundario"]/1000000),2)
media_secundario_2021<-round(secundario_for$mea,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Sector Secundario", media_secundario_2019,media_secundario_2020,media_secundario_2021))

##Terciario

terciario_ts = ts(Terciario/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(Terciario_ts, xlab = "", ylab = "")
title(main = "Empleo del sector terciario en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

terciario_arima <-auto.arima(terciario_ts, xreg = covid_reg)
summary(terciario_arima)

#Evaluación del modelo

acf(resid(terciario_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(terciario_arima)

#Pronóstico del modelo

terciario_for <-forecast(terciario_arima,xreg=covid_reg_for,h=12)
terciario_for
plot(terciario_for)
title(main = "",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_terciario_2019<-round(mean(empleo[169:180,"Terciario"]/1000000),2)
media_terciario_2020<-round(mean(empleo[181:192,"Terciario"]/1000000),2)
media_terciario_2021<-round(terciario_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Sector Terciario", media_terciario_2019,media_terciario_2020,media_terciario_2021))

##########################################################

#Análisis por nivel de ingreso
##Hasta 1 Salario Mínimo

salario1_ts = ts(Hasta.un.salario.mínimo/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(salario1_ts, xlab = "", ylab = "")
title(main = "Empleo de personas con ingresos de hasta 1 salario mínimo en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

salario1_arima <-auto.arima(salario1_ts, xreg = covid_reg)
summary(salario1_arima)

#Evaluación del modelo

acf(resid(salario1_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(salario1_arima)

#Pronóstico del modelo

salario1_for <-forecast(salario1_arima,xreg=covid_reg_for,h=12)
salario1_for
plot(salario1_for)
title(main = "",
      ylab = "Número de mexicanos empleados por ingreso (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_salario1_2019<-round(mean(empleo[169:180, "Hasta.un.salario.mínimo"]/1000000),2)
media_salario1_2020<-round(mean(empleo[181:192,"Hasta.un.salario.mínimo"]/1000000),2)
media_salario1_2021<-round(salario1_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Hasta 1 Salario Mínimo", media_salario1_2019,media_salario1_2020,media_salario1_2021))

##De 1 a 2 salarios mínimos

salario2_ts = ts(Más.de.1.hasta.2.salarios.mínimos/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(salario2_ts, xlab = "", ylab = "")
title(main = "Empleo de personas con ingresos de 1 a 2 salarios mínimos en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

salario2_arima <-auto.arima(salario2_ts, xreg = covid_reg)
summary(salario2_arima)

#Evaluación del modelo

acf(resid(salario2_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(salario2_arima)

#Pronóstico del modelo

salario2_for <-forecast(salario2_arima,xreg=covid_reg_for,h=12)
salario2_for
plot(salario2_for)
title(main = "",
      ylab = "Número de mexicanos empleados por ingreso (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_salario2_2019<-round(mean(empleo[169:180, "Más.de.1.hasta.2.salarios.mínimos"]/1000000),2)
media_salario2_2020<-round(mean(empleo[181:192,"Más.de.1.hasta.2.salarios.mínimos"]/1000000),2)
media_salario2_2021<-round(salario2_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("De 1 a 2 Salarios Mínimos", media_salario2_2019,media_salario2_2020,media_salario2_2021))



##De 2 a 3 salarios mínimos

salario3_ts = ts(Más.de.2.hasta.3.salarios.mínimos/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(salario3_ts, xlab = "", ylab = "")
title(main = "Empleo de personas con ingresos de 2 a 3 salarios mínimos en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

salario3_arima <-auto.arima(salario3_ts, xreg = covid_reg)
summary(salario3_arima)

#Evaluación del modelo

acf(resid(salario3_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(salario3_arima)

#Pronóstico del modelo

salario3_for <-forecast(salario3_arima,xreg=covid_reg_for,h=12)
salario3_for
plot(salario3_for)
title(main = "",
      ylab = "Número de mexicanos empleados por ingreso (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_salario3_2019<-round(mean(empleo[169:180, "Más.de.2.hasta.3.salarios.mínimos"]/1000000),2)
media_salario3_2020<-round(mean(empleo[181:192,"Más.de.2.hasta.3.salarios.mínimos"]/1000000),2)
media_salario3_2021<-round(salario3_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("De 2 a 3 Salarios Mínimos", media_salario3_2019,media_salario3_2020,media_salario3_2021))

##De 3 a 5 salarios mínimos

salario4_ts = ts(Más.de.3.hasta.5.salarios.mínimos/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(salario4_ts, xlab = "", ylab = "")
title(main = "Empleo de personas con ingresos de 3 a 5 salarios mínimos en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

salario4_arima <-auto.arima(salario4_ts, xreg = covid_reg)
summary(salario4_arima)

#Evaluación del modelo

acf(resid(salario4_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(salario4_arima)

#Pronóstico del modelo

salario4_for <-forecast(salario4_arima,xreg=covid_reg_for,h=12)
salario4_for
plot(salario4_for)
title(main = "",
      ylab = "Número de mexicanos empleados por ingreso (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_salario4_2019<-round(mean(empleo[169:180, "Más.de.3.hasta.5.salarios.mínimos"]/1000000),2)
media_salario4_2020<-round(mean(empleo[181:192,"Más.de.3.hasta.5.salarios.mínimos"]/1000000),2)
media_salario4_2021<-round(salario4_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("De 3 a 5 Salarios Mínimos", media_salario4_2019,media_salario4_2020,media_salario4_2021))

#Más de 5 salarios minimos

salario5_ts = ts(Más.de.5.salarios.mínimos/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(salario5_ts, xlab = "", ylab = "")
title(main = "Empleo de personas con ingresos de más de 5 salarios mínimos en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

salario5_arima <-auto.arima(salario5_ts, xreg = covid_reg)
summary(salario5_arima)

#Evaluación del modelo

acf(resid(salario5_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(salario5_arima)

#Pronóstico del modelo

salario5_for <-forecast(salario5_arima,xreg=covid_reg_for,h=12)
salario5_for
plot(salario5_for)
title(main = "",
      ylab = "Número de mexicanos empleados por ingreso (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_salario5_2019<-round(mean(empleo[169:180, "Más.de.5.salarios.mínimos"]/1000000),2)
media_salario5_2020<-round(mean(empleo[181:192,"Más.de.5.salarios.mínimos"]/1000000),2)
media_salario5_2021<-round(salario5_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Más de 5 salarios mínimos", media_salario5_2019,media_salario5_2020,media_salario5_2021))

##########################################################

#Análisis por tipo de unidad económica del Ámbito no agropecuario
##Micronegocios

micro_ts = ts(Micronegocios/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(micro_ts, xlab = "", ylab = "")
title(main = "Empleo de personas dentro de Micronegocios en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

micro_arima <-auto.arima(micro_ts, xreg = covid_reg)
summary(micro_arima)

#Evaluación del modelo

acf(resid(micro_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(micro_arima)

#Pronóstico del modelo

micro_for <-forecast(micro_arima,xreg=covid_reg_for,h=12)
micro_for
plot(micro_for)
title(main = "",
      ylab = "Número de mexicanos empleados por tamaño de unidad económica (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_micro_2019<-round(mean(empleo[169:180, "Micronegocios"]/1000000),2)
media_micro_2020<-round(mean(empleo[181:192,"Micronegocios"]/1000000),2)
media_micro_2021<-round(micro_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Micronegocios", media_micro_2019,media_micro_2020,media_micro_2021))

##Pequeños negocios

pequeños_ts = ts(Pequeños.establecimientos/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(pequeños_ts, xlab = "", ylab = "")
title(main = "Empleo de personas dentro de Pequeños negocios en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

pequeños_arima <-auto.arima(pequeños_ts, xreg = covid_reg)
summary(pequeños_arima)

#Evaluación del modelo

acf(resid(pequeños_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(pequeños_arima)

#Pronóstico del modelo

pequeños_for <-forecast(pequeños_arima,xreg=covid_reg_for,h=12)
pequeños_for
plot(pequeños_for)
title(main = "",
      ylab = "Número de mexicanos empleados por tamaño de unidad económica (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_pequeños_2019<-round(mean(empleo[169:180, "Pequeños.establecimientos"]/1000000),2)
media_pequeños_2020<-round(mean(empleo[181:192,"Pequeños.establecimientos"]/1000000),2)
media_pequeños_2021<-round(pequeños_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Pequeños Negocios", media_pequeños_2019,media_pequeños_2020,media_pequeños_2021))

##Medianos negocios

medianos_ts = ts(Medianos.establecimientos/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(medianos_ts, xlab = "", ylab = "")
title(main = "Empleo de personas dentro de Medianos negocios en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

medianos_arima <-auto.arima(medianos_ts, xreg = covid_reg)
summary(medianos_arima)

#Evaluación del modelo

acf(resid(medianos_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(medianos_arima)

#Pronóstico del modelo

medianos_for <-forecast(medianos_arima,xreg=covid_reg_for,h=12)
medianos_for
plot(medianos_for)
title(main = "",
      ylab = "Número de mexicanos empleados por tamaño de unidad económica (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_medianos_2019<-round(mean(empleo[169:180, "Medianos.establecimientos"]/1000000),2)
media_medianos_2020<-round(mean(empleo[181:192,"Medianos.establecimientos"]/1000000),2)
media_medianos_2021<-round(medianos_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Medianos Negocios", media_medianos_2019,media_medianos_2020,media_medianos_2021))

##Grandes negocios

grandes_ts = ts(Grandes.establecimientos/1000000, start = 2005, frequency = 12)


#Exploración inicial

plot(grandes_ts, xlab = "", ylab = "")
title(main = "Empleo de personas dentro de Grandes negocios en México",
      ylab = "Número de mexicanos empleados (millones)",
      xlab = "AÑO")

#Creación del modelo ARIMAX

grandes_arima <-auto.arima(grandes_ts, xreg = covid_reg)
summary(grandes_arima)

#Evaluación del modelo

acf(resid(grandes_arima), main = "")
title(main = "Autocorrelaciones para los Residuales del Ajuste",
      sub = expression(x[t]==x[t-1]+w[t]-0.33*w[t-1]))

checkresiduals(grandes_arima)

#Pronóstico del modelo

grandes_for <-forecast(grandes_arima,xreg=covid_reg_for,h=12)
grandes_for
plot(grandes_for)
title(main = "",
      ylab = "Número de mexicanos empleados por tamaño de unidad económica (millones)",
      xlab = "AÑO")

#Insertar resultados en la tabla de medias

media_grandes_2019<-round(mean(empleo[169:180, "Grandes.establecimientos"]/1000000),2)
media_grandes_2020<-round(mean(empleo[181:192,"Grandes.establecimientos"]/1000000),2)
media_grandes_2021<-round(grandes_for$mean,2)
tabla_de_medias <-rbind(tabla_de_medias,c("Grandes Negocios", media_grandes_2019,media_grandes_2020,media_grandes_2021))



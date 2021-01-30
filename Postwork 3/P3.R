#POSTWORKS 3
#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)

#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)

#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

#Realiza lo siguiente:
#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa
#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante.
#Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.

#install.packages("ggplot2")
library(ggplot2)



#Jose Grafico 3
ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl") +  # Lo divide por el núm de cilindros
  xlab('Núm Acilindros')+  # Nombre en los ejes
  ylab('Caballos de Fuerza')
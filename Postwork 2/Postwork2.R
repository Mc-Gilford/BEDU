#POST-WORK SESION 2
#CARGAMOS LIBRERIA DPLYR
suppressWarnings(suppressMessages(library(dplyr)))
#IMPORTANDO LOS DATOS
U1 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
#IMPORTANDO LOS DATASETS
dataset1 <- read.csv(file = U1)
# VERIFICAMOS EL TIPO DE DATOS QUE HAY EN CADA DATASET USANDO STR, HEAD, VIEW, SUMMARY
str(dataset1)
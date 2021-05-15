#Sys.setlocale("LC_ALL","pt_BR.UTF-8")

library(dplyr)
source("ganttrify.R")

atividades <- read.csv(file="cronograma.csv",head=TRUE)

cronogramaplot <- ganttrify(project = atividades, by_date = TRUE,
          project_start_date = "2021-01",
          hide_wp = FALSE,
          font_family = "")
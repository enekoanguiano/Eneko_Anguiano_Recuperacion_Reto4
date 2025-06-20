library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)
library(naniar)

datos <- read.csv("C:/Users/nenek/Downloads/netflix_recuperacion.csv")

summary(datos$release_year)

desvicacion <- sd(datos$release_year, na.rm=TRUE)

length(unique(datos$listed_in))

vis_miss(datos)

datos_imputado <- kNN(datos, k=5)
datos_imputado <- datos_imputado[, !grepl("_imp$", colnames(datos_imputado))]

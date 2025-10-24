library(readxl)
library(ggplot2)
library(ggalt)

data <- read_excel("/home/rstudio/projects/base-de-datos-violencia-intrafamiliar-ano-2024_v3.xlsx")

data_fp <- data[, c("HEC_MES", "HEC_DEPTO", "VIC_EDAD", "VIC_ESCOLARIDAD",
                    "VIC_EST_CIV", "VIC_TRABAJA", "AGR_EDAD", "AGR_ESCOLARIDAD")]

data_fp[is.na(data_fp)] <- -1

cluster <- kmeans(data_fp, centers = 3)

ggplot(data_fp, aes(x = VIC_EDAD, y = AGR_EDAD, color =as.factor(cluster$cluster)))+
  geom_point()+
  geom_point(data = as.data.frame(cluster$centers), aes(x = VIC_EDAD, y = AGR_EDAD), color="black", size=4, shape=17)+
  labs(title = "Relación entre Edad de la Víctima y del Agresor") +
  theme_minimal()


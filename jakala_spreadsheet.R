###Cleaning Jakala ### 

library(dplyr)
library(openxlsx)
library(tidyverse)

iscritti <- REPORT_ISCRITTI_445963_20211119_06_46_06

iscritti <- iscritti %>% mutate(PRESENTATORE = str_sub(PRESENTATORE,8,-1))

iscritti$DATA <- 0

iscritti$ORA <- 0

iscritti <- iscritti %>% separate(DT_REG, c("DATA", "ORA"), " ")

iscritti$DATA <- as.Date(iscritti$DATA)

write.xlsx(iscritti, "iscritti.xlsx")

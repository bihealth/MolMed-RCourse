library(tidyverse)
library(readxl)

labres <- read_csv("labresults_wide.csv") |>
  separate_wider_delim(SUBJ.TP, ".", names=c("SUBJ", "TP"))
  

expr <- read_excel("expression_data_vaccination_example.xlsx")

labres_2 <- merge(expr, labres, by="SUBJ") |>
  filter(TP == "D1") |>
  filter(ARM %in% c("FLUAD", "PLACEBO")) |>
  mutate(ARM = c(FLUAD="vaccine", PLACEBO="placebo")[ARM]) |>
  select(SUBJ, ARM, AGE, SEX, CRP, NEUT)

library(writexl)
write_xlsx(labres_2, "labres_selected_simple.xlsx")

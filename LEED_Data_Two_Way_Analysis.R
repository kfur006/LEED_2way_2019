## LEED Data Analysis
## 2-way table (Region and ANZSCO)

## Library
#library(googlesheets)
#library(googledrive)
library(tidyverse)
library(magrittr)
library(readxl)
library(zoo)
library("XML")
library("methods")

## Data
LEED <- read_xlsx("C:/Users/kfur006/Desktop/Random Data/LEED/LEED_Data_Two_Way.xlsx",
                  sheet = 1)
names(LEED)

as.Date(LEED$TS_Quarter)
LEED %>% filter(`All Industries Ind` !=0) %>% 
  ggplot(data = ., aes(x = TS_Quarter, y = `Mean earnings of full quarter jobs`)) +
  geom_line()

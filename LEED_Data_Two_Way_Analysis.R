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
library(scales)
library(RColorBrewer)

## Data
LEED <- read_xlsx("C:/Users/kfur006/Desktop/Random Data/LEED/LEED_Data_Two_Way.xlsx",
                  sheet = 1) %>% 
  mutate(TS_Quarter2 = as.Date(TS_Quarter2))
names(LEED)
str(LEED)
sort(unique(LEED$TS_Quarter2))

LEED %>% filter(`All Industries Ind` !=0,
                `All Region Ind` != 0) %>% 
  ggplot(data = ., aes(x = TS_Quarter2, y = `Total filled jobs`)) +
  geom_line(size = 2) +
  theme(text = element_text(size = 15, face = "bold")) +
  labs(title = "Total Filled Job (2009 - 2018)",
       x = "Time",
       y = "Tootal Filled Job",
       caption = "Data: Stats NZ")


colourCount = length(unique(LEED$`Sub Region`))
getPalette = colorRampPalette(brewer.pal(8, "Accent"))(colourCount)

LEED %>% filter(`All Industries Ind` !=0,
                `All Region Ind` == 0) %>% 
  ggplot(data = ., aes(x = TS_Quarter2, y = `Total filled jobs`, color = `Sub Region`)) +
  geom_line(size = 2) +
  scale_y_continuous(labels = comma) +
  scale_fill_manual(values = getPalette) +
  theme(text = element_text(size = 15, face = "bold")) +
  labs(title = "Total Filled Job (2009 - 2018)",
       x = "Time",
       y = "Tootal Filled Job",
       caption = "Data: Stats NZ",
       colour = "Region")

names(LEED)
City = "Auckland"
LEED %>% filter(`All Industries Ind` == 0,
                `Main Category` != 0,
                `Sub Region` == City) %>% 
  ggplot(data = ., aes(x = TS_Quarter2, y = `Total filled jobs`, color = `Main Category`)) +
  geom_line(size = 2) +
  scale_y_continuous(labels = comma) +
  scale_fill_manual(values = getPalette) +
  theme(text = element_text(size = 15, face = "bold")) +
  labs(title = paste(City, "Total Filled Job (2009 - 2018)"),
       x = "Time",
       y = "Tootal Filled Job",
       caption = "Data: Stats NZ",
       colour = "Category")

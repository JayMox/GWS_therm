#script to clean data scraped from MBWW website
#downloaded 1/23/18

rm(list = ls())
library(dplyr)
library(tidyverse)
#prep bench
dd <- "/Users/jmoxley/Documents/GitTank/GWS_therm/data"

#get data
load(file.path(paste(dd, "raw_MBWW.RData", sep="/")))

#issues re: 
sc <- raw %>% filter(map_lgl(page.df, function(x){ncol(x) == 1}))

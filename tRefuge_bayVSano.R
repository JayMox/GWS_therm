#thermal refuge sampling in monterey bay
library(ncdf4)
library(raster)
library(rasterVis)
library(maptools)
library(maps)
library(spatial)

library(lubridate)
library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(dplyr)

#rm(list = ls())


#set up data drive
dd <- "/Users/jmoxley/Documents/MBA_GWS/RemoteSensingData/mbay_G1SST"
setwd(dd)

#read in data
mbay2010 <- brick("jplG1SST_mbay_2010-06-21.nc", varname = "SST")
mbay2011 <- brick("jplG1SST_mbay_2011-06-21.nc", varname = "SST")
mbay2012 <- brick("jplG1SST_mbay_2012-06-21.nc", varname = "SST")
mbay2013 <- brick("jplG1SST_mbay_2013-06-21.nc", varname = "SST")
mbay2014 <- brick("jplG1SST_mbay_2014-06-21.nc", varname = "SST")
mbay2015 <- brick("jplG1SST_mbay_2015-06-21.nc", varname = "SST")
mbay2016 <- brick("jplG1SST_mbay_2016-06-21.nc", varname = "SST")
mbay2017 <- brick("jplG1SST_mbay_2017-06-21.nc", varname = "SST")

#sampling locs
locs <- SpatialPointsDataFrame(coords = data.frame(lon = c(-121.925, -122.335), lat = c(36.95, 37.1)), data = data.frame(site = c("inside", "outside")))

#custom function to build data frame from point sampled raster data
mbay_samplr <- function(rast, samplocs){
  #extract data
  df <- data.frame(t(extract(rast, locs, df = TRUE))) 
  df$date <- as.POSIXct(as.numeric(sapply(strsplit(rownames(df), split = "X"), "[", 2)), 
                        origin = "1970-01-01 00:00:00", tz = "UTC")
  df$jday <- as.numeric(julian(df$date))
  df$year <- as.numeric(year(df$date))
  df$yday <- as.integer(yday(df$date))
  
  return(data.frame(df))
}
#origin for date conversion is fixed at 1970 01 01 00:00:00

#Build data frame
df10 <- mbay_samplr(mbay2010, locs);    #why is 2010 have a time value in it?? sampling midday? 
df11 <- mbay_samplr(mbay2011, locs);
df12 <- mbay_samplr(mbay2012, locs);
df13 <- mbay_samplr(mbay2013, locs);
df14 <- mbay_samplr(mbay2014, locs);
df15 <- mbay_samplr(mbay2015, locs);
df16 <- mbay_samplr(mbay2016, locs);
df17 <- mbay_samplr(mbay2017, locs);
#COMBINE
df <- bind_rows(df10, df11, df12, df13, df14, df15, df16, df17)
colnames(df) <- c("NMBay", "Ano", "date", "jday", "year")
df <- df[complete.cases(df),]

#boxplots
mdf <- melt(df, id.vars = c("date", "jday", "year"), measure.vars = c("NMBay", "Ano"), variable.name = "site", value.name = "SST")
ggplot(data = mdf, aes(x= site, y = SST)) +
  geom_boxplot(aes(color = site)) + facet_grid(year~month(date)) +
  coord_flip()

#calculate daily delta
df <- mutate(df, deltaT = NMBay - Ano)

ggplot(df, aes(x=date))+
  geom_line(aes(y=NMBay),color = "yellow")+
  geom_line(aes(y=Ano),color = "gray")+
  geom_smooth(aes(y=NMBay),color = "red", se = FALSE, span = 0.2, method="loess")+
  geom_smooth(aes(y=Ano),color = "blue", se = FALSE, span = 0.2, method="loess")0






+
  facet_wrap(~year,ncol=1)





#

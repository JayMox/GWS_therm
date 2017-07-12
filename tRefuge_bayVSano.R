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
df <- mutate(df, month = month(date)); 

df <- merge(df, data.frame(month = seq(1, 12, by = 1), 
                           month_lab = factor(c("Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"))), sort = F)
df$month_lab <- factor(df$month_lab, levels(df$month_lab) <- c("Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"))


ggplot(df, aes(x=date))+
  geom_line(aes(y=NMBay),color = "yellow")+
  geom_line(aes(y=Ano),color = "gray")+
  geom_smooth(aes(y=NMBay),color = "red", se = FALSE, span = 0.2, method="loess")+
  geom_smooth(aes(y=Ano),color = "blue", se = FALSE, span = 0.2, method="loess")

Tref_summary <- ddply(df, .(month, year), summarize, month_lab = unique(month_lab), max_diff = max(deltaT, na.rm = T))
Mean_maxdiffs <- ddply(Tref_summary, .(month), summarize, mean_maxdiff = mean(max_diff, na.rm = TRUE), month_lab = unique(month_lab))

#mean/median plots
ggplot(data = ddply(df, .(month, year), summarize,  mlab = unique(month_lab),  mean_diff = mean(deltaT, na.rm = T), max_diff = max(deltaT, na.rm=T))) + 
  geom_point(aes(x = mlab, y = mean_diff)) + theme_bw()

ggplot() + 
  geom_point(data = Mean_maxdiffs, aes(x = month_lab, y = mean_maxdiff, color = "red", size = 2), show.legend = F) + theme_bw() + 
  scale_y_continuous(limits = c(0, 4))

ggplot() + 
  geom_point(data = filter(ddply(df, .(month, year), summarize, mlab = unique(month_lab), mean_diff = mean(deltaT, na.rm = T)), year == 2011), 
             aes(x = mlab, y = mean_diff, size = 3, colour = "red"), show.legend  = F) + labs(title = "Thermal differences between N.Monterey Bay and Santa Cruz", x = "Month", y = "Mean Difference in Water Temperature (Celsius)")
                                            
                                                                            
#MAPS
raster_map <- data.frame(rasterToPoints(mbay2011[[35]])) #convert to x/y array
ggplot() +
  geom_raster(data = raster_map, aes(x,y,fill=X1311552000), show.legend = T) +
  theme_void() +
  scale_fill_distiller(palette = "RdYlBu") +
  coord_fixed() +
  geom_point(data = data.frame(locs), aes(x = lon, y = lat))
ggsave


ggplot(data = filter(ddply(df, .(month, year), summarize,  mlab = unique(month_lab),  mean_diff = mean(deltaT, na.rm = T)), year != )) + geom_line(aes(x = mlab, y = mean_diff, group = year, color = year)) 









#

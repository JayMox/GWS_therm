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

rm(list = ls())

#set up data drive
dd <- "/Users/jmoxley/Documents/MBA_GWS/RemoteSensingData/mbay_G1SST"
setwd(dd)

#import 2014 netcdf
mbay2014 <- brick("jplG1SST_mbay_2014-06-21.nc", varname = "SST")
#sample locs
locs <- SpatialPointsDataFrame(coords = data.frame(lon = c(-121.925, -122.335), lat = c(36.95, 37.1)), data = data.frame(site = c("inside", "outside")))
#get origin for time conversion
nc <- nc_open("jplG1SST_mbay_2014-06-21.nc")
orgdate <- ncatt_get(nc, varid = "time")$time_origin

##########MAPPING
image(mbay2014, useRaster = TRUE, col = {"blue"}); points(locs)
ext <- zoom(mbay2014)   #define a zoomed in extent w/ clicking
plot(mbay2014[[1]], col = topo.colors(50))

#plotting in geom_raster
raster_map <- data.frame(rasterToPoints(mbay2014[[1]])) #convert to x/y array
ggplot() +
  geom_raster(data = raster_map, aes(x,y,fill=X1403308800), show.legend = T) +
  theme_void() +
  scale_fill_distiller(palette = "RdYlBu") +
  coord_fixed() +
  geom_point(data = data.frame(locs), aes(x = lon, y = lat))
ggsave
  

############EXTRACTING DATA
#ample vals
df14 <- data.frame(t(extract(mbay2014, locs, data.frame=TRUE)))
colnames(df14) <- c("NMBay", "Ano")
#convert dates to interpretible
df14$date <- as.POSIXct(as.numeric(sapply(strsplit(rownames(df14), split = "X"), "[", 2)), origin = "1970-01-01 00:00:00", tz = "UTC")
#this takes every second element of a list from the rownames, and converts based on origin
df14$jday <- as.numeric(julian(sc$date))


###############PLOTTING
#flatten data
tmp <- melt(df14, id.vars = c("date", "jday"), measure.vars = c("NMBay", "Ano"), variable.name = "site", value.name = "SST")

ggplot(data = tmp, aes(x= site, y = SST)) + geom_boxplot(notch = TRUE) + facet_wrap(~month(date))





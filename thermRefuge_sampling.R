#thermal refuge sampling in monterey bay
library(ncdf4)
library(raster)
library(rasterVis)
library(maptools)
library(maps)
library(spatial)

rm(list = ls())

#set up data drive
dd <- "/Users/jmoxley/Documents/MBA_GWS/RemoteSensingData/mbay_G1SST"
setwd(dd)

#import 2014 netcdf
mbay2014 <- brick("jplG1SST_mbay_2014-06-21.nc")
#sample locs
locs <- SpatialPointsDataFrame(coords = data.frame(lon = c(-121.925, -122.335), lat = c(36.95, 37.1)), data = data.frame(site = c("inside", "outside")))

#view map
image(mbay2014); points(locs)
ext <- zoom(mbay2014)   #define a zoomed in extent w/ clicking



#sample vals
sc <- extract(mbay2014, locs, data.frame=TRUE)
sc2 <- getValues(mbay2014, locs)

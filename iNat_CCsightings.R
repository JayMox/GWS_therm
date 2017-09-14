#iNat data extraction
#see vignette here: https://ropensci.org/blog/blog/2014/03/26/rinat

library(rinat)
library(rgdal)
library(ggplot2)
library(lubridate)
library(gridExtra)

dir_spatial

#get data for sightings in Northern/Central CA
mbay_bounds <- c(37.00, -122.5, 36.5, -121.25)
cc <- get_inat_obs(query = "Carcharodon carcharias", bounds = mbay_bounds)
cat(paste("The number of records found in your bunding box:", dim(cc)[1],
          sep = " "))
#reclass dates 
cc$observed_on <- as.Date(cc$observed_on)
cc$month <- factor(month(cc$observed_on), levels = c(seq(1:12), NA))

#get gis data
dir_spatial <- "../GIS"
land50 <- readOGR(dsn = dir_spatial, layer = "ne_10m_land", stringsAsFactors = FALSE)
#build basemap
basemap <- ggplot()+ 
  geom_polygon(data = land50,aes(x=long,y=lat, group = group), size = 3)+
  coord_fixed(xlim=c(mbay_bounds[2], mbay_bounds[4]), ylim=c(mbay_bounds[1], mbay_bounds[3]))+
  theme_classic()+
  theme(panel.border = element_rect(colour = "black", fill = NA, size = 1),,
        panel.background = element_rect(fill = NA))+
  xlab(NULL) + ylab(NULL)

#plot sightings
p <- basemap + geom_point(data=cc, aes(x=longitude, y = latitude, colour = month))+
  theme(legend.position="bottom")
q <- ggplot() + geom_bar(data=cc, aes(x = month, fill = month))
r <- ggplot() + geom_bar(data=cc, aes(x=year(observed_on)))
grid.arrange(p,arrangeGrob(q,r, ncol=2),nrow=2)

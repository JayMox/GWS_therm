library(rgdal)
library(TeleFunc)

map2<-readOGR("/home/cfwhite/Desktop/WS Internal Temp/Map/Map2","North_America")
map3<-readOGR("/home/cfwhite/Desktop/WS Internal Temp/Map/USNation","cb_2016_us_nation_20m")
map4<-readOGR("/home/cfwhite/Desktop/WS Internal Temp/Map/US_States","cb_2016_us_state_20m")
map5<-readOGR("/home/cfwhite/Desktop/WS Internal Temp/Map/US_States","cb_2016_us_state_5m")
#map5<-readOGR("/home/cfwhite/Desktop/WS Internal Temp/Map/US_Coastline","us_medium_shoreline")


setwd("/home/cfwhite/Desktop")
tiff("StudySite.tiff",height=7,width=7,units="in",res=400)

layout(matrix(c(1,2,1,1),byrow=TRUE,nrow=2),
       widths=c(3,2), heights=c(2,3))

par(mar=c(0,0,0,0))
plot(map5,xlim=c(-122.8,-121.8),ylim=c(36.9,38.5),col="grey70",border="grey40",lwd=1,bg="white")

#plot(map4,xlim=c(-122.7,-122.3),ylim=c(37.0,38.2),col="grey70",border="grey60")
points(-122.3364,37.1085,bg = rgb(21,133,107,maxColorValue = 246),pch=21,cex=4,lwd=2)
points(-123.0020,37.6984,bg = rgb(21,133,107,maxColorValue = 246),pch=21,cex=4,lwd=2)
points(-122.9982,38.2401,bg = rgb(21,133,107,maxColorValue = 246),pch=21,cex=4,lwd=2)
scaleBar2(x=-123.2816,y=37.00339,max=75,unit="km",nbreaks=4,cex = 2,font = 2)



par(mar=c(0,0,0,0))
plot(map2,xlim=c(-130,-63),ylim=c(20,60),col="grey90",border="grey80",bg="white")
plot(map4,add=TRUE,col="grey70",border="grey60")
plot(map3,add=TRUE,col=NA,border="grey40",lwd=1.5)
#points(-123,37,col=rgb(21,133,107,maxColorValue = 246),pch=16,cex=2)
polygon(x = c(-123.5921,-123.5921, -121.4079, -121.4079),
        y = c(36.8360, 38.5640,38.5640,36.8360),
        col=NA,
        border =rgb(21,133,107,maxColorValue = 246),lwd=2)
box(col=rgb(21,133,107,maxColorValue = 246),lwd=6)

dev.off()






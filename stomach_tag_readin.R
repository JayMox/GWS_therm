#data input, June 2017
#script to read in all the data and build .RData file
#built from Connor's InternalStomachTemperature.R script 
rm(list=ls())

#set up data drives here
#dd <- "/Volumes/HELLBENDY/MBA_GWS/stomachT"
dd <- "/Volumes/UNTITLED/stomachT"
setwd(dd)

#open a null data frame
df <- data.frame()

#read in first deployment
###############################################
start<-as.POSIXct("2007-10-24 18:39:30",tz="UTC")
end<-as.POSIXct("2007-10-30 11:39:13",tz="UTC")-500

dat<-read.table(paste(dd, "00_PAT_20071024_InternalPAT.tab", sep = "/"))
dat$date<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$date>start & dat$date<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[1],lwd=4)


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="00_PAT_20071024"))
save(dat, file = "00_PAT_20071024_InternalPAT.RData")
###################################################


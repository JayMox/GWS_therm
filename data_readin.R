#data input, June 2017
#script to read in all the data and build .RData file
#built from Connor's InternalStomachTemperature.R script 

#set up data drives here

#read in first deployment
###############################################
###########################################
start<-as.POSIXct("2008-11-07 16:11:29",tz="UTC")
end<-as.POSIXct("2008-11-15 18:41:40",tz="UTC")-500

dat<-read.table("/Volumes/HELLBENDY/MBA_GWS/data_handoff/StomachTags/1_Beaker_20081107/RawAssData/1_Breaker_20081107_InternalPAT.tab")
dat$date<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600

lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[2],lwd=4)




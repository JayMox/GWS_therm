#data input, June 2017
#script to read in all the data and build .RData file
#built from Connor's InternalStomachTemperature.R script 
rm(list=ls())

#set up data drives here
#dd <- "/Volumes/HELLBENDY/MBA_GWS/stomachT"
dd <- "/Volumes/UNTITLED/stomachT"
setwd(dd)

#open a null data frame
datAll<-NULL

#read in first deployment
###############################################
start<-as.POSIXct("2007-10-24 18:39:30",tz="UTC")
end<-as.POSIXct("2007-10-30 11:39:13",tz="UTC")-500

dat<-read.table(paste(dd, "00_PAT_20071024_InternalPAT.tab", sep = "/"))
dat$date<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$date>start & dat$date<end),]
dat$id <- "00_PAT_20071024"

#plot call
time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600  #time index
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[1],lwd=4)

#append and svae individual file
datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="00_PAT_20071024"))
save(dat, file = "00_PAT_20071024_InternalPAT.RData")
###################################################

###########################################
start<-as.POSIXct("2008-11-07 16:11:29",tz="UTC")
end<-as.POSIXct("2008-11-15 18:41:40",tz="UTC")-500

dat<-read.table(paste(dd, "1_Beaker_20081107_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]
dat$shark <- "1_Beaker_20081107"

#plot call
time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[2],lwd=4)

#save and append
datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="1_Beaker_20081107"))
save(dat, file = "1_Beaker_20081107_InternalPAT.RData")

#########################################

#########################################
start<-as.POSIXct("2009-09-24 18:52:11",tz="UTC")
end<-as.POSIXct("2009-09-29 08:41:34",tz="UTC")-500

dat<-read.table(paste(dd, "2_Beaker_20090924_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]
dat$shark <- "2_Beaker_20090924"

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[3],lwd=4)

datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="2_Beaker_20090924"))
save(dat, file = "2_Beaker_20090924_InternalPAT.RData")

#########################################
#################################
start<-as.POSIXct("2009-10-21 16:10:24",tz="UTC")
end<-as.POSIXct("2009-10-24 07:36:12",tz="UTC")-(500+(4.5*3600))

dat<-read.table(paste(dd, "3_Animal_20091021_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]
dat$shark <- "3_Animal_20091021"

#plot call
time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[4],lwd=4)

#append and save
datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="3_Animal_20091021"))
save(dat, file = "3_Animal_20091021_InternalPAT.RData")
###############################################

###############################################
start<-as.POSIXct("2010-10-08 22:21:06",tz="UTC")
end<-as.POSIXct("2010-10-16 21:03:54",tz="UTC")-500

dat<-read.table(paste(dd, "4_Animal_20101008_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]
dat$shark <- "4_Animal_20101008"

#plot call
time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[5],lwd=4)

#append and save
datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="4_Animal_20101008"))
save(dat, file = "4_Animal_20101008_InternalPAT.RData")

###############################################

###############################################
start<-as.POSIXct("2010-11-01 16:00:42",tz="UTC")
end<-as.POSIXct("2010-11-03 16:49:48",tz="UTC")-500

dat<-read.table(paste(dd, "5_Pepe_20101101_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]
dat$shark <- "5_Pepe_20101101"

#plot call
time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[6],lwd=4)

#save and append
datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="5_Pepe_20101101"))
save(dat, file = "5_Pepe_20101101_InternalPAT.RData")
###############################################

###############################################
start<-as.POSIXct("2010-11-05 17:32:05",tz="UTC")
end<-as.POSIXct("2010-11-09 23:03:44",tz="UTC")-500

dat<-read.table(paste(dd, "6_Pepe_20101105_InternalTemp.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]
dat$shark <- "6_Pepe_20101105"

#plot call
time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[7],lwd=4)

#append and save
datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="6_Pepe_20101105"))
save(dat, file = "6_Pepe_20101105_InternalTemp.RData")

###############################################

###############################################
start<-as.POSIXct("2011-10-01 00:32:05",tz="UTC")
end<-as.POSIXct("2011-10-05 02:23:06",tz="UTC")-500

dat<-read.table(paste(dd, "7_Animal_20111001_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]
dat$shark <- "7_Animal_20111001"

#plot call
time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,,col=rainbow(9)[8],lwd=4)

#append and save
datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="7_Animal_20111001"))
save(dat, file = "7_Animal_20111001_InternalPAT.RData")
###############################################

###############################################
start<-as.POSIXct("2011-10-18 17:48:51",tz="UTC")
end<-as.POSIXct("2011-10-31 20:41:27",tz="UTC")-500

dat<-read.table(paste(dd, "8_Animal_20111018_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]
dat$shark <- "8_Animal_20111018"

#plot call
time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[9],lwd=4)

#append and save
datAll<-rbind(datAll,data.frame(TagOnTime=time,Temp=dat$External.Temperature,shark="8_Animal_20111018"))
save(dat, file = "8_Animal_20111018_InternalPAT.RData")
###############################################


#All Sharks Internal Time series plots

#Plotting the stomach temperatures of each shark using the PAT tag data
#not very efficient but it works....

linecol<-c(rgb(166,206,227,maxColorValue = 256), rgb(31,120,180,maxColorValue = 256), rgb(178,223,138,maxColorValue = 256), 
           rgb(51,160,44,maxColorValue = 256), rgb(251,154,153,maxColorValue = 256), rgb(227,26,28,maxColorValue = 256),
           rgb(255,127,0,maxColorValue = 256), rgb(253,191,111,maxColorValue = 256), rgb(202,178,214,maxColorValue = 256))
dir<-"/media/cfwhite/Sauron" 

datAll<-NULL

#x11()
setwd("/home/cfwhite/Desktop")

tiff("StomachTempTimeSeries2.tiff",width=10,height=7,units='in',res=600)
par(mar=c(5,5,1,1))
plot(0, type="n",ylim=c(23,29),xlim=c(0,200),
     ylab=" ",las=1,xlab=" ",cex.axis=1.5,bty="l",yaxt="n",xaxt="n")
axis(side=1,at=seq(-50,250,by=50),cex.axis=1.5,lwd=4)
axis(side=2,at=seq(22,30,by=1),cex.axis=1.5,lwd=4,las=1)
mtext(text = "Hours Post Ingestion",side=1,cex=2,line=3)
mtext(text = "Stomach Temperature (c)", side=2,cex=2,line=3.5)
#abline(v=seq(0,length.out=10,by=24))

#Adding the individuals from goldman 1996
s1<-c(24.6,26.2,26.5,27.3,26.4)
s2<-c(24.8,26.5,26.3,26.1,25.9,26.2,25.9,26.4,26.4,26.3)
s3<-c(25.1,26.8,26.2,26.5,26.4,25.9,24.7)
lines(s1~I(c(1,2,3,4,5)*24 - 12),col="grey40",lwd=2,lty=2)
lines(s2~I(c(1,2,3,4,5,6,7,8,9,10)*24 - 12),col="grey40",lwd=2,lty=2)
lines(s3~I(c(1,2,3,4,5,6,7)*24 - 12),col="grey40",lwd=2,lty=2)

###############################################
start<-as.POSIXct("2007-10-24 18:39:30",tz="UTC")
end<-as.POSIXct("2007-10-30 11:39:13",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/00_PAT_20071024/00_PAT_20071024_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,col=linecol[1],lwd=3)


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="00_PAT_20071024"))


###########################################
start<-as.POSIXct("2008-11-07 16:11:29",tz="UTC")
end<-as.POSIXct("2008-11-15 18:41:40",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/1_Beaker_20081107/RawAssData/1_Beaker_20081107_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600

lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,col=linecol[2],lwd=3)


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="1_Beaker_20081107"))


#########################################
start<-as.POSIXct("2009-09-24 18:52:11",tz="UTC")
end<-as.POSIXct("2009-09-29 08:41:34",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/2_Beaker_20090924/RawAssData/2_Beaker_20090924_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,col=linecol[3],lwd=3)

datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="2_Beaker_20090924"))


#################################
start<-as.POSIXct("2009-10-21 16:10:24",tz="UTC")
end<-as.POSIXct("2009-10-24 07:36:12",tz="UTC")-(500+(4.5*3600))

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/3_Animal_20091021/RawAssData/3_Animal_20091021_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,col=linecol[4],lwd=3)


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="3_Animal_20091021"))

###############################################
start<-as.POSIXct("2010-10-08 22:21:06",tz="UTC")
end<-as.POSIXct("2010-10-16 21:03:54",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/4_Animal_20101008/RawAssData/4_Animal_20101008_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
points(128,23.5,bg=rgb(21,133,107,maxColorValue = 246),pch=23,cex=1.9,col="grey50")
lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,col=linecol[5],lwd=3)


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="4_Animal_20101008"))


###############################################
start<-as.POSIXct("2010-11-01 16:00:42",tz="UTC")
end<-as.POSIXct("2010-11-03 16:49:48",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/5_Pepe_20101101/RawAssData/5_Pepe_20101101_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,col=linecol[6],lwd=3)


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="5_Pepe_20101101"))



###############################################
start<-as.POSIXct("2010-11-05 17:32:05",tz="UTC")
end<-as.POSIXct("2010-11-09 23:03:44",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/6_Pepe_20101105/RawAssData/6_Pepe_20101105_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,col=linecol[7],lwd=3)
polygon(x = c(1000000, 1100000,1100000, 1000000)/(3600*5),y=c(25.5,25.5,26.15,26.15),lwd=4,border=rgb(21,133,107,maxColorValue = 246))




datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="6_Pepe_20101105"))


###############################################
start<-as.POSIXct("2011-10-01 00:32:05",tz="UTC")
end<-as.POSIXct("2011-10-05 02:23:06",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/7_Animal_20111001/RawAssData/7_Animal_20111001_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,,col=linecol[8],lwd=3)


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="7_Animal_20111001"))



###############################################
start<-as.POSIXct("2011-10-18 17:48:51",tz="UTC")
end<-as.POSIXct("2011-10-31 20:41:27",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/8_Animal_20111018/RawAssData/8_Animal_20111018_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,1800)/1800)~time,col=linecol[9],lwd=3)

datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,shark="8_Animal_20111018"))



#legend("topright",
#       legend=list.files(paste(dir,"/MBA_GWS/StomachTags/",sep=""))[c(1,2,4,5,6,7,8,9,10)],
#       fill=rainbow(9))





#arrows(x0=c(1,2,3,4,5)*24 - 12, x1=c(1,2,3,4,5)*24 - 12,
#       y0=s1-c(.3,.2,.2,.2,.1),y1=s1+c(.3,.2,.2,.2,.1),code=3,length=.2,angle=90)
#arrows(x0=c(1,2,3,4,5,6,7,8,9,10)*24 - 12, x1=c(1,2,3,4,5,6,7,8,9,10)*24 - 12,
#       y0=s2-c(.5,.2,.3,.2,.2,.2,.2,.2,.2,.2),y1=s2+c(.5,.2,.3,.2,.2,.2,.2,.2,.2,.2),code=3,length=.2,angle=90)
#arrows(x0=c(1,2,3,4,5,6,7)*24 - 12, x1=c(1,2,3,4,5,6,7)*24 - 12,
#       y0=s3-c(.4,.2,.2,.2,.2,.3,.3),y1=s3+c(.4,.2,.2,.2,.2,.3,.3),code=3,length=.2,angle=90)



dev.off()


#All Sharks Internal Time series plots

#Plotting the stomach temperatures of each shark using the PAT tag data
#not very efficient but it works....

dir<-"/media/cfwhite/Sauron" 



datAll<-NULL


TBPeriod<-NULL


###############################################
start<-as.POSIXct("2007-10-24 18:39:30",tz="UTC")
end<-as.POSIXct("2007-10-30 11:39:13",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/00_PAT_20071024/00_PAT_20071024_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600

datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth, shark="00_PAT_20071024"))
TBPeriod<-c(NA,TBPeriod)

###########################################
start<-as.POSIXct("2008-11-07 16:11:29",tz="UTC")
end<-as.POSIXct("2008-11-15 18:41:40",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/1_Beaker_20081107/RawAssData/1_Beaker_20081107_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth,shark="1_Beaker_20081107"))

dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/1_Beaker_20081107/1_Beaker_20081107_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)])
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)]))



#########################################
start<-as.POSIXct("2009-09-24 18:52:11",tz="UTC")
end<-as.POSIXct("2009-09-29 08:41:34",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/2_Beaker_20090924/RawAssData/2_Beaker_20090924_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600

datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth,shark="2_Beaker_20090924"))

dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/2_Beaker_20090924/2_Beaker_20090924_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)])
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)]))


#################################
start<-as.POSIXct("2009-10-21 16:10:24",tz="UTC")
end<-as.POSIXct("2009-10-24 07:36:12",tz="UTC")-(500+(4.5*3600))

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/3_Animal_20091021/RawAssData/3_Animal_20091021_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600

datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth,shark="3_Animal_20091021"))

dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/3_Animal_20091021/3_Animal_20091021_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)])
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)]))


###############################################
start<-as.POSIXct("2010-10-08 22:21:06",tz="UTC")
end<-as.POSIXct("2010-10-16 21:03:54",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/4_Animal_20101008/RawAssData/4_Animal_20101008_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth,shark="4_Animal_20101008"))

dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/4_Animal_20101008/4_Animal_20101008_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)])
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)]))


###############################################
start<-as.POSIXct("2010-11-01 16:00:42",tz="UTC")
end<-as.POSIXct("2010-11-03 16:49:48",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/5_Pepe_20101101/RawAssData/5_Pepe_20101101_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth,shark="5_Pepe_20101101"))


dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/5_Pepe_20101101/5_Pepe_20101101_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)],na.rm=TRUE)
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)],na.rm=TRUE))

###############################################
start<-as.POSIXct("2010-11-05 17:32:05",tz="UTC")
end<-as.POSIXct("2010-11-09 23:03:44",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/6_Pepe_20101105/RawAssData/6_Pepe_20101105_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth,shark="6_Pepe_20101105"))
dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/6_Pepe_20101105/6_Pepe_20101105_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)])
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)]))

###############################################
start<-as.POSIXct("2011-10-01 00:32:05",tz="UTC")
end<-as.POSIXct("2011-10-05 02:23:06",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/7_Animal_20111001/RawAssData/7_Animal_20111001_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600


datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth,shark="7_Animal_20111001"))

dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/7_Animal_20111001/7_Animal_20111001_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)])
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)]))


###############################################
start<-as.POSIXct("2011-10-18 17:48:51",tz="UTC")
end<-as.POSIXct("2011-10-31 20:41:27",tz="UTC")-500

dat<-read.table(paste(dir,"/MBA_GWS/StomachTags/8_Animal_20111018/RawAssData/8_Animal_20111018_InternalPAT.tab",sep=""))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600

datAll<-rbind(datAll,data.frame(Time=time,Temp=dat$External.Temperature,Depth = dat$Depth,shark="8_Animal_20111018"))

dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/8_Animal_20111018/8_Animal_20111018_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)])
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)]))



###################33

SharkLengths<-c(4.9, 4, 3.4, 3.95, 3,4.95,4.85,4.55,4.6)
Ration<-c(NA,NA,1.83,1.17,4.98,1.56,2.23,1.81+2.15,2.41)

sharks<-unique(datAll$shark)

Summary<-NULL
for(i in 1:length(sharks)){
  datShark <- datAll[which(datAll$shark==sharks[i]),]
  
  D1<-mean(datShark$Temp[datShark$Time<24 & datShark$Time>3])
  D1D<-mean(datShark$Depth[datShark$Time<24 & datShark$Time>3])
  D1SD<-sd(datShark$Temp[datShark$Time<24 & datShark$Time>3])
  Summary<-rbind(Summary,data.frame(Shark = sharks[i],
                                    Length = SharkLengths[i],
                                    Ration = Ration[i],
                                    TempD1 = D1,
                                    DepthD1 = D1D,
                                    TempD1SD = D1SD)
                 )
}


linecol<-c(rgb(166,206,227,maxColorValue = 256), rgb(31,120,180,maxColorValue = 256), rgb(178,223,138,maxColorValue = 256), 
           rgb(51,160,44,maxColorValue = 256), rgb(251,154,153,maxColorValue = 256), rgb(227,26,28,maxColorValue = 256),
           rgb(255,127,0,maxColorValue = 256), rgb(253,191,111,maxColorValue = 256), rgb(202,178,214,maxColorValue = 256))


m<-lm(TempD1~Length,data=Summary)


setwd("/home/cfwhite/Desktop")
tiff("TemperaturevSharkSize.tiff",height=7,width=7,units='in',res=400)
par(mar=c(6,8,1,1),bty="l")
plot(TempD1~Length,data=Summary,type="n",
     las=1,ylab=" ",xlab=" ",yaxt="n",xaxt="n",
     ylim=c(23.5,28.5),xlim=c(3,5))

arrows(y0=Summary$TempD1-Summary$TempD1SD,y1=Summary$TempD1+Summary$TempD1SD,
       x0=Summary$Length,x1=Summary$Length,code=3,length=.1,angle=90,lwd=2.5)

points(TempD1~Length,data=Summary,
     pch=21,cex=2.3,bg=linecol,
     col="grey50",lwd=2)
axis(side=1,at=seq(3,5,by=0.5),cex.axis=1.9,las=1,lwd=4)
axis(side=2,at=seq(24,28,by=1),cex.axis=1.9,las=1,lwd=4)
mtext(side=1,text="Estimated Length (m)",cex=2.5,line=4)
mtext(side=2, text = "Stomach Temperature (C)",cex=2.5,line=5)
abline(m,col=rgb(21,133,107,maxColorValue = 246),lwd=7,lty=2)
box(which="plot", bty="l",lwd=4)
dev.off()



m<-lm(TempD1~Ration,data=Summary)

setwd("/home/cfwhite/Desktop")
tiff("TemperaturevRationSize.tiff",height=7,width=7,units='in',res=400)
par(mar=c(6,8,1,1),bty="l")
plot(TempD1~Ration,data=Summary,type="n",
     las=1,ylab=" ",xlab=" ",yaxt="n",xaxt="n",
     ylim=c(23.5,28.5),xlim=c(1,5))

arrows(y0=Summary$TempD1-Summary$TempD1SD,y1=Summary$TempD1+Summary$TempD1SD,
       x0=Summary$Ration,x1=Summary$Ration,code=3,length=.1,angle=90,lwd=2.5)

points(TempD1~Ration,data=Summary,
       pch=21,cex=2,bg=linecol,
       col="grey50",lwd=2)
axis(side=1,at=seq(1,5,by=1),cex.axis=1.9,las=1,lwd=4)
axis(side=2,at=seq(24,28,by=1),cex.axis=1.9,las=1,lwd=4)
mtext(side=1,text="Ration Size (Kg)",cex=2.5,line=4)
mtext(side=2, text = "Stomach Temperature (C)",cex=2.5,line=5)
abline(m,col=rgb(21,133,107,maxColorValue = 246),lwd=7,lty=2)
box(which="plot", bty="l",lwd=4)
dev.off()






m<-lm(TempD1~DepthD1,data=Summary)

setwd("/home/cfwhite/Desktop")
tiff("TemperaturevRDepth.tiff",height=7,width=7,units='in',res=400)
par(mar=c(6,8,1,1),bty="l")
plot(TempD1~DepthD1,data=Summary,type="n",
     las=1,ylab=" ",xlab=" ",yaxt="n",xaxt="n",
     ylim=c(23.5,28.5),xlim=c(5,25))

arrows(y0=Summary$TempD1-Summary$TempD1SD,y1=Summary$TempD1+Summary$TempD1SD,
       x0=Summary$DepthD1,x1=Summary$DepthD1,code=3,length=.1,angle=90,lwd=2.5)

points(TempD1~DepthD1,data=Summary,
       pch=21,cex=2,bg=linecol,
       col="grey50",lwd=2)
axis(side=1,at=seq(0,25,by=5),cex.axis=1.9,las=1,lwd=4)
axis(side=2,at=seq(24,28,by=1),cex.axis=1.9,las=1,lwd=4)
mtext(side=1,text="Depth (m)",cex=2.5,line=4)
mtext(side=2, text = "Stomach Temperature (C)",cex=2.5,line=5)
abline(m,col=rgb(21,133,107,maxColorValue = 246),lwd=7,lty=2)
box(which="plot", bty="l",lwd=4)
dev.off()





m<-lm(Summary$TempD1~TBPeriod)

setwd("/home/cfwhite/Desktop")
tiff("TemperaturevTBD.tiff",height=7,width=7,units='in',res=400)
par(mar=c(6,8,1,1),bty="l")
plot(Summary$TempD1~TBPeriod,type="n",
     las=1,ylab=" ",xlab=" ",yaxt="n",xaxt="n",
     ylim=c(23.5,28.5),xlim=c(2,4))

arrows(y0=Summary$TempD1-Summary$TempD1SD,y1=Summary$TempD1+Summary$TempD1SD,
       x0=TBPeriod,x1=TBPeriod,code=3,length=.1,angle=90,lwd=2.5)

points(Summary$TempD1~TBPeriod,
       pch=21,cex=2,bg=linecol,
       col="grey50",lwd=2)
axis(side=1,at=seq(1,5,by=.5),cex.axis=1.9,las=1,lwd=4)
axis(side=2,at=seq(24,28,by=1),cex.axis=1.9,las=1,lwd=4)
mtext(side=1,text="Tail Beat Duration",cex=2.5,line=4)
mtext(side=2, text = "Stomach Temperature (C)",cex=2.5,line=5)
abline(m,col=rgb(21,133,107,maxColorValue = 246),lwd=7,lty=2)
box(which="plot", bty="l",lwd=4)
dev.off()






# m<-lm(TempD1~Ration,data=Summary)
# 
# setwd("/home/cfwhite/Desktop")
# tiff("TemperaturevRationSize.tiff",height=7,width=7,units='in',res=400)
# par(mar=c(6,8,1,1),bty="l")
# plot(TempD1~Ration,data=Summary,type="n",
#      las=1,ylab=" ",xlab=" ",yaxt="n",xaxt="n",
#      ylim=c(23.5,28.5),xlim=c(1,5))
# 
# arrows(y0=Summary$TempD1-Summary$TempD1SD,y1=Summary$TempD1+Summary$TempD1SD,
#        x0=Summary$Ration,x1=Summary$Ration,code=3,length=.1,angle=90,lwd=2)
# 
# points(TempD1~Ration,data=Summary,
#        pch=21,cex=2,bg=linecol,
#        col="grey50",lwd=2)
# axis(side=1,at=seq(1,5,by=1),cex.axis=1.9,las=1)
# axis(side=2,at=seq(24,28,by=1),cex.axis=1.9,las=1)
# mtext(side=1,text="Ration Size (Kg)",cex=2.5,line=4)
# mtext(side=2, text = "Stomach Temperature (C)",cex=2.5,line=5)
# abline(m,col=rgb(21,133,107,maxColorValue = 246),lwd=7)
# 
# dev.off()
# 






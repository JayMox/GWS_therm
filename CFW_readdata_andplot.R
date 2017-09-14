#Plotting the stomach temperatures of each shark using the PAT tag data
#not very efficient but it works....
#JHM: needs to be rewritten with my drives

dd <- "/Volumes/UNTITLED 1/InternalPAT/stomachT"
setwd(dd)

datAll<-NULL

quartz()
par(mar=c(5,5,1,1))
plot(0, type="n",ylim=c(23,29),xlim=c(0,200),
     ylab=" ",las=1,xlab=" ",cex.axis=1.5)
mtext(text = "Hours Post Ingestion",side=1,cex=2,line=3)

mtext(text = "Temperature (c)", side=2,cex=2,line=3.5)
#abline(v=seq(0,length.out=10,by=24))

###############################################
start<-as.POSIXct("2007-10-24 18:39:30",tz="UTC")
end<-as.POSIXct("2007-10-30 11:39:13",tz="UTC")-500

dat<-read.table(paste(dd, "00_PAT_20071024_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[1],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="00_PAT_20071024", Time=time, dts=dat$Time, Temp=dat$External.Temperature, depth=dat$depth))

###########################################
start<-as.POSIXct("2008-11-07 16:11:29",tz="UTC")
end<-as.POSIXct("2008-11-15 18:41:40",tz="UTC")-500

dat<-read.table(paste(dd, "1_Beaker_20081107_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[2],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="1_Beaker_20081107", Time=time, dts=dat$Time, Temp=dat$External.Temperature,depth=dat$depth))


#########################################
start<-as.POSIXct("2009-09-24 18:52:11",tz="UTC")
end<-as.POSIXct("2009-09-29 08:41:34",tz="UTC")-500

dat<-read.table(paste(dd, "2_Beaker_20090924_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[3],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="2_Beaker_20090924", Time=time, dts=dat$Time, Temp=dat$External.Temperature, depth=dat$depth))


#################################
start<-as.POSIXct("2009-10-21 16:10:24",tz="UTC")
end<-as.POSIXct("2009-10-24 07:36:12",tz="UTC")-(500+(4.5*3600))

dat<-read.table(paste(dd, "3_Animal_20091021_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")

dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[4],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="3_Animal_20091021", Time=time, dts=dat$Time, Temp=dat$External.Temperature,depth=dat$depth))

###############################################
start<-as.POSIXct("2010-10-08 22:21:06",tz="UTC")
end<-as.POSIXct("2010-10-16 21:03:54",tz="UTC")-500

dat<-read.table(paste(dd, "4_Animal_20101008_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[5],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="4_Animal_20101008", Time=time, dts=dat$Time, Temp=dat$External.Temperature, depth=dat$depth))


###############################################
start<-as.POSIXct("2010-11-01 16:00:42",tz="UTC")
end<-as.POSIXct("2010-11-03 16:49:48",tz="UTC")-500

dat<-read.table(paste(dd, "5_Pepe_20101101_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[6],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="5_Pepe_20101101", Time=time, dts=dat$Time, Temp=dat$External.Temperature,depth=dat$depth))



###############################################
start<-as.POSIXct("2010-11-05 17:32:05",tz="UTC")
end<-as.POSIXct("2010-11-09 23:03:44",tz="UTC")-500

dat<-read.table(paste(dd, "6_Pepe_20101105_InternalTemp.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[7],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="6_Pepe_20101105", Time=time, dts=dat$Time, Temp=dat$External.Temperature, depth=dat$depth))


###############################################
start<-as.POSIXct("2011-10-01 00:32:05",tz="UTC")
end<-as.POSIXct("2011-10-05 02:23:06",tz="UTC")-500

dat<-read.table(paste(dd, "7_Animal_20111001_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,,col=rainbow(9)[8],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="7_Animal_20111001", Time=time, dts=dat$Time, Temp=dat$External.Temperature,depth=dat$depth))



###############################################
start<-as.POSIXct("2011-10-18 17:48:51",tz="UTC")
end<-as.POSIXct("2011-10-31 20:41:27",tz="UTC")-500

dat<-read.table(paste(dd, "8_Animal_20111018_InternalPAT.tab", sep = "/"))
dat$Time<-as.POSIXct(dat$Time,origin="1970-01-01 00:00.00", tz="UTC")
dat<-dat[which(dat$Time>start & dat$Time<end),]

time<-(as.numeric(dat$Time)-as.numeric(trunc(min(dat$Time),"day")))/3600
time<-(as.numeric(dat$Time)-as.numeric(min(dat$Time)))/3600
lines(filter(dat$External.Temperature,filter=rep(1,900)/900)~time,col=rainbow(9)[9],lwd=4)

dat$depth <- dat$Corrected.Depth.Channel;

datAll<-rbind(datAll,data.frame(shark="8_Animal_20111018", Time=time, dts=dat$Time, Temp=dat$External.Temperature, depth=dat$depth))

####save internalPAT data
df <- datAll
save(df, file = "CC_internalPAT_July2017.RData")


#legend("topright",
#       legend=list.files(dd)[c(1,2,4,5,6,7,8,9,10)],
#       fill=rainbow(9))



#Adding the individuals from goldman 1996
s1<-c(24.6,26.2,26.5,27.3,26.4)
s2<-c(24.8,26.5,26.3,26.1,25.9,26.2,25.9,26.4,26.4,26.3)
s3<-c(25.1,26.8,26.2,26.5,26.4,25.9,24.7)
points(s1~I(c(1,2,3,4,5)*24 - 12),pch=16,cex=2, col = "#000000")
points(s2~I(c(1,2,3,4,5,6,7,8,9,10)*24 - 12),pch=16,cex=2, col = "#525252")
points(s3~I(c(1,2,3,4,5,6,7)*24 - 12),pch=16,cex=2, col = "#969696")


arrows(x0=c(1,2,3,4,5)*24 - 12, x1=c(1,2,3,4,5)*24 - 12,
       y0=s1-c(.3,.2,.2,.2,.1),y1=s1+c(.3,.2,.2,.2,.1),code=3,length=.2,angle=90)
arrows(x0=c(1,2,3,4,5,6,7,8,9,10)*24 - 12, x1=c(1,2,3,4,5,6,7,8,9,10)*24 - 12,
       y0=s2-c(.5,.2,.3,.2,.2,.2,.2,.2,.2,.2),y1=s2+c(.5,.2,.3,.2,.2,.2,.2,.2,.2,.2),code=3,length=.2,angle=90)
arrows(x0=c(1,2,3,4,5,6,7)*24 - 12, x1=c(1,2,3,4,5,6,7)*24 - 12,
       y0=s3-c(.4,.2,.2,.2,.2,.3,.3),y1=s3+c(.4,.2,.2,.2,.2,.3,.3),code=3,length=.2,angle=90)











plot(datAll$Temp~datAll$Time)


sharks<-unique(datAll$shark)
dur<-NULL
for(i in 1:9){
  dur<-c(dur,max(datAll$Time[which(datAll$shark==sharks[i])]))
}


#Temp and time every minute
mindata<-NULL
for(i in 1:9){
  temp<-collapse(datAll$Temp[which(datAll$shark==sharks[i])],freq = 60)
  time<-datAll$Time[which(datAll$shark==sharks[i])][seq(1,by=60,length.out=length(temp))]
  mindata<-rbind(mindata,data.frame(Temp=temp,Time=Time))
  
}

#average temp for each shark
temps<-NULL
for(i in 1:9){
  temps<-c(temps,mean(datAll$Temp[which(datAll$shark==sharks[i])]))
}

#average temp during day 1
tempsd1<-NULL
for(i in 1:9){
  tempsd1<-c(tempsd1,mean(datAll$Temp[which(datAll$shark==sharks[i] & datAll$Time<24)]))
}

#Temp SD for each shark
sds<-NULL
for(i in 1:9){
  sds<-c(sds,sd(datAll$Temp[which(datAll$shark==sharks[i])]))
}

#Shark Length and athen meal size for each shark
sizes<-c(4.9,4,3.4,4,3,4.9,4.9,4.6,4.6)
meal<-c(NA,NA,1.82,1.17,4.98,1.56,2.23,3.96,2.41)

#Adding in size, to eventually have something like a format for lme4 or nlme
datAll$Size<-4.9
for(i in 1:9){
  datAll$Size[which(datAll$shark==sharks[i])]<-sizes[i]
}

plot(temps~sizes,pch=16,xlab="Length (m)",ylab= "Stomach Temperature (c)",ylim=c(23.5,29))
m<-lm(temps~sizes)
arrows(x0=sizes,x1=sizes,y0=temps-sds,y1=temps+sds,code=3,angle=90)
abline(m,col="red",lwd=2)

plot(temps~meal,pch=16,xlab="Meal Size (Kg)",ylab= "Stomach Temperature (c)",ylim=c(23.5,29))
m<-lm(temps~meal)
arrows(x0=meal,x1=meal,y0=temps-sds,y1=temps+sds,code=3,angle=90)
abline(m,col="red",lwd=2)




plot(tempsd1~sizes,pch=16,xlab="Length (m)",ylab= "Stomach Temperature (c)",ylim=c(23.5,29))
m<-lm(tempsd1~sizes)
arrows(x0=sizes,x1=sizes,y0=tempsd1,y1=tempsd1,code=3,angle=90)
abline(m,col="red",lwd=2)

plot(tempsd1~meal,pch=16,xlab="Meal Size (Kg)",ylab= "Stomach Temperature (c)",ylim=c(23.5,29))
m<-lm(tempsd1~meal)
arrows(x0=meal,x1=meal,y0=tempsd1,y1=tempsd1,code=3,angle=90)
abline(m,col="red",lwd=2)


plot(tempsd1~sizes,pch=16,ylim=c(23.5,28),col=color.scale(meal),cex=2,
     xlab="Length (m)",ylab= "Stomach Temperature (c)")
points(tempsd1~sizes,pch=21,cex=2)
m<-lm(tempsd1~sizes)
abline(m,col="red",lwd=2)



plot(temps~sizes,pch=16,ylim=c(23.5,29),col=color.scale(meal,zlim=c(0,5)),cex=2,
     xlab="Length (m)",ylab= "Stomach Temperature (c)")
points(temps~sizes,pch=21,cex=2)
m<-lm(temps~sizes)
arrows(x0=sizes,x1=sizes,y0=temps-sds,y1=temps+sds,code=3,angle=90)
abline(m,col="red",lwd=2)
image.plot(legend.only=TRUE,zlim=c(0,5),smallplot=c(.2,.25,.6,.9))




#Adding in size, to eventually have something like a format for lme4 or nlme
datAll$Size<-4.9
for(i in 1:9){
  datAll$Size[which(datAll$shark==sharks[i])]<-sizes[i]
}

m<-lm(datAll$Temp~datAll$Size)







ranges<-NULL
for(i in 1:9){
  r<-range(datAll$Temp[which(datAll$shark==shaks[i] & datAll$Time>12)])
  ranges<-c(ranges,(r[2]-r[1]))
}


density<-NULL
for(i in 1:9){
  h<-hist(datAll$Temp[which(datAll$shark==shaks[i])],breaks = seq(7,30,by=0.1))
  perc<-h$counts/(sum(h$counts))
  density<-rbind(density,perc)
}

library(fields)
image.plot(t(density),x=seq(7,30,by=0.1),y=1:9,xlim=c(20,30))



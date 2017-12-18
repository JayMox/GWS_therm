library(gRumble)

dir<-"/media/cfwhite/Sauron" 

dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/6_Pepe_20101105/RawIMUData/6_Pepe_20101105_clipped.csv",sep=""))

IMUstart<-as.POSIXct("2010-11-05 02:39:48")
TakePoint<-267788
Start<-TakePoint+IMUstart

datG<-Gsep(dat[,c(1,2,3)],filt = rep(1,120*5)/(120*5))

X_Trend<-filter(datG[,1],rep(1,1200*5)/(1200*5))
MSE<-(datG[,1]-X_Trend)^2


TempTrend<-filter(dat$Temp, filter = rep(1,1200*5)/(1200*5))

MSE_Temp<-(dat$Temp-TempTrend)^2
MSE_Temp2<-filter(MSE_Temp,filter=rep(1,(120*5))/(120*5))

Temp_MSE1<-collapse(MSE_Temp2,freq = 5*60)
Accel_MSE1<-collapse(MSE,freq = 5*60)
Temp_MSE1<-Temp_MSE1[300:6000]
Accel_MSE1<-Accel_MSE1[300:6000]



sumdata<-data.frame(AccelVar = Accel_MSE1,Temp_Shift = Temp_MSE1>0.002)

m.glm<-glm(Temp_Shift~AccelVar,family="binomial",data=sumdata)
m.glm0<-glm(Temp_Shift~1,family="binomial",data=sumdata)

coefs<-coef(m.glm)

Tshift<-Accel_MSE1[Temp_MSE1>0.002]
Stable<-Accel_MSE1[Temp_MSE1<0.002]

out<-hist(Tshift,breaks=seq(0,.1,by=.001),plot = FALSE)
out2<-hist(Stable,breaks=seq(0,.1,by=.001),plot = FALSE)
tot<-out$counts+out2$counts

newDat<-data.frame(AccelVar =seq(0,.1,by=.001))
predOut<-predict(m.glm, newdata = newDat,se.fit=TRUE)



setwd("/home/cfwhite/Desktop")




#x11(height=7,width=7)
tiff("StomachFig2.tiff",height=7,width=7,units="in",res=400)
layout(matrix(c(1,2,3),nrow=3,ncol=1),heights=c(4,4,1.2))
par(mar=c(0,8,0,1),bty="n")

plot(dat$Temp,ylim=c(26,26.65),type="l",col= rgb(255,127,0,maxColorValue = 256),lwd=2,las=1,xaxt="n",yaxt="n",ylab="" ,xlim=c(1000000, 1100000))
mtext(side=2,text="Temperature (c)",cex=2,line=5)
axis(side=2,at=c(26,26.3,26.6),cex.axis=2,las=1,lwd=4)

plot(datG[,1],xlim=c(1000000, 1100000), type="l",las=1,ylim=c(-1,0),xaxt="n",yaxt="n",ylab="",lwd=2)
mtext(side=2,text="Tag Pitch (g)",cex=2,line=5)
mtext(side=1,text="Hours Post Ingestion",cex=2.5,line=5)
axis(side=1,at = seq(0,nrow(dat),by=3600*5*2),label = seq(0,nrow(dat),by=3600*5*2)/(3600*5),cex.axis=2.2,las=1,mgp=c(3,2,0),lwd=4)
axis(side=2,at=c(-1,-.5,0),cex.axis=2,las=1,lwd=4)

dev.off()



#x11(height=7,width=7)
tiff("StomachFig3.tiff",height=7,width=7,units="in",res=400)
layout(matrix(c(1,2,3),nrow=3,ncol=1),heights=c(4,4,1.2))
par(mar=c(0,8,0,1),bty="n")
plot(MSE_Temp2,xlim=c(1000000, 1100000),ylim=c(0,.02),
     type="l",las=1,xaxt="n",yaxt="n",ylab=" ",col=rgb(255,127,0,maxColorValue = 256),lwd=2)
abline(h=0.003,col="black",lwd=3,lty=2)
lines(MSE_Temp2,col=rgb(255,127,0,maxColorValue = 256),lwd=3)
mtext(side=2,text="Temp Var (g)",cex=2,line=5)
axis(side=2,at=c(0,.01,0.02),cex.axis=2,las=1,lwd=4)


plot(MSE,xlim=c(1000000, 1100000),ylim=c(0,.1),
     type="l",col= "black",lwd=2,las=1,xaxt="n",yaxt="n",ylab=" ")
mtext(side=2,text="Acc Var (C)",cex=2,line=5)
axis(side=2,at=c(0,0.03,0.06,0.09),cex.axis=2,las=1,lwd=4)
mtext(side=1,text="Hours Post Ingestion",cex=2.5,line=5)
axis(side=1,at = seq(0,nrow(dat),by=3600*5*2),label = seq(0,nrow(dat),by=3600*5*2)/(3600*5),cex.axis=2.2,las=1,mgp=c(3,2,0),lwd=4)
dev.off()




#x11()
tiff("StomachFig4.tiff",height=7,width=7,units="in",res=400)
par(mar=c(5,8,1,1),bty="l")
plot((out$counts/tot)~out$mids,pch=16,xlab=" ",ylab=" ",las=1,xaxt="n",yaxt="n")
axis(side=1,at = c(0,.03,.06,.09),cex.axis=1.8,lwd=4)
axis(side=2,at=c(0,.25,.5,.75,1),cex.axis=1.8,las=1,lwd=4)
mtext(side=1,"Tag Position Variance",line=3,cex=2.5)
mtext(side=2,"P(Temp Shift)",line=5,cex=2.5)
curve(1/(1+ exp(-1*(coefs[1]+(coefs[2]*x)))),add=TRUE,col="red",lwd=5)


lines((exp(predOut$fit+1.96*predOut$se.fit)/(1+exp(predOut$fit+1.96*predOut$se.fit)))~ newDat$AccelVar,lwd=3,lty=2)
lines((exp(predOut$fit-1.96*predOut$se.fit)/(1+exp(predOut$fit-1.96*predOut$se.fit)))~ newDat$AccelVar,lwd=3,lty=2)
box(which="plot", bty="l",lwd=4)


dev.off()



#x11(height=7,width=7)
tiff("StomachFig1.tiff",height=7,width=7,units="in",res=400)
par(mar=c(5,8,1,1),bty="l")
plot(dat$Temp,ylim=c(25,27),type="l",col= rgb(255,127,0,maxColorValue = 256),lwd=2,las=1,xaxt="n",yaxt="n",ylab="",xlab="")
mtext(side=1,text="Hours Post Ingestion",cex=2.5,line=3)
mtext(side=2,text="Temperature (c)",cex=2.5,line=5)
polygon(x = c(1000000, 1100000,1100000, 1000000),y=c(25.9,25.9,26.75,26.75),lwd=4,border=rgb(21,133,107,maxColorValue = 246))
axis(side=1,at = seq(0,nrow(dat),by=3600*5*20),label = seq(0,nrow(dat),by=3600*5*20)/(3600*5),cex.axis=1.8,lwd=4)
axis(side=2,at=c(25,25.5,26,26.5,27),cex.axis=1.8,las=1,lwd=4)
dev.off()

#not very efficient but it works....

dir<-"/media/cfwhite/Sauron" 


dat<-read.csv(paste(dir,"/MBA_GWS/StomachTags/4_Animal_20101008/4_Animal_20101008_1HZ.csv",sep=""))
mean(dat$TBPeriod[1:(3600*24)])
TBPeriod<-c(TBPeriod,mean(dat$TBPeriod[1:(3600*24)]))



setwd("/home/cfwhite/Desktop")
tiff("4_Animal.tiff",height=5,width=12,units='in',res=400)

par(mar=c(5,5,1,1))
plot(0, type="n",ylim=c(23,26),xlim=c(0,190),
     ylab=" ",las=1,xlab=" ",cex.axis=1.5,bty="l",yaxt="n",xaxt="n")
axis(side=1,at=seq(-50,250,by=50),cex.axis=1.5,lwd=4)
axis(side=2,at=seq(22,30,by=1),cex.axis=1.5,lwd=4,las=1)
mtext(text = "Hours Post Ingestion",side=1,cex=2,line=3)
mtext(text = "Stomach Temperature (c)", side=2,cex=2,line=3.5)

lines(dat$Temp~I(1:nrow(dat)/3600),col=rgb(251,154,153,maxColorValue = 256))
points(130,23.4,bg=rgb(21,133,107,maxColorValue = 246),pch=23,cex=1.9,col="grey50")


dev.off()
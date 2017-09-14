##Database building for stomachT plots; 
##JHMoxley, July 2017
##DF is built in separate file CFW_readdata_andplot.R
##See take/spit points in CFW_readdata_andplot.R; confirm & adjust .xlsx sheet to reflect these estimates based on igor plots

#prep workbench & datadrive
library(plyr)
library(tidyverse)

dd <- "/Volumes/UNTITLED 1/InternalPAT/stomachT"

#read in data
load(file.path(dd, "CC_internalPAT_July2017.RData"))
sharks <- unique(df$shark)
##SEE CFW_READDATA_ANDPLOT for initial data processing
##INCLUDING TAKE/SPIT POINTS IN THE DATASET

#plot ts
quartz()
par(mar=c(5,5,1,1))
plot(0, type="n",ylim=c(23,29),xlim=c(0,200),
     ylab=" ",las=1,xlab=" ",cex.axis=1.5)
mtext(text = "Hours Post Ingestion",side=1,cex=2,line=3)
mtext(text = "Temperature (c)", side=2,cex=2,line=3.5)
#add lines
for(i in 1:length(sharks)){
  tmp <- df[which(df$shark == sharks[i]),];
  lines(stats::filter(tmp$Temp,filter=rep(1,900)/900)~tmp$Time,col=rainbow(9)[i],lwd=4)
}
legend("topright",
              legend=unique(df$shark),
              fill=rainbow(9))
       
#build covars df
vars <- data.frame(shark = unique(df$shark), 
                   sex = factor(c('M','M','M','M','M','F','F','M','M')),
                   sizes = c(4.9,4,3.4,4,3,4.9,4.9,4.6,4.6), 
                   meal=c(2.72,NA,1.83,1.17,4.98,1.56,2.23,3.96,2.41))

#build tibble
df2 <- merge(df, vars, all.x = T)
df3 <- tbl_df(df2) 
(summ <- ddply(df2, .(shark), summarize, size = unique(size), sex = unique(sex), dur = max(dts) - min(dts), 
              meanT = mean(Temp), sdT = sd(Temp), minT = min(Temp), maxT = max(Temp), meanD = mean(depth), 
              sdD = sd(depth)))

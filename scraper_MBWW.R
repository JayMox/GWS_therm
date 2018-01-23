#Web scrape of monterey bay watch sightings
#1/22.. needs permission from nancy black
#seems stored here: http://www.montereybaywhalewatch.com/sightings/

#tutorials4Dev: https://stat4701.github.io/edav/2015/04/02/rvest_tutorial/
#
rm(list = ls())
library(rvest)
library(dplyr)
library(tidyverse)

#prep bench
dd <- "/Users/jmoxley/Documents/GitTank/GWS_therm/data"
homepg <- "http://www.montereybaywhalewatch.com/sightings/"
URLs <- str_pad(seq(1:9999), width=4, side="left", pad = 0) #vector of possible html page combis
raw <- tibble()
#Scrape
for(i in 1:length(URLs)){
  #if(i == 212 | i == 301 | i == 302){ i = i +1}
  #get page
  print(paste("working on slst", URLs[i], sep=" "))
  url <- paste(homepg, paste("slst",URLs[i],".htm", sep=""), sep="") 
  page <- try(read_html(url) %>% 
      html_nodes("tr+ tr td+ td , td td td~ td+ td , b") %>% 
      html_text())
  #stow metadata & raw draw of webpage
  raw <- try(raw %>% bind_rows(tibble(idx = i, url.idx = URLs[i], url = url, 
                                  page.raw = list(page), TRs.detected = NA, 
                                  page.df = NA)))
  #extra processing if data exists
  if(class(page) != "try-error"){
    #date subdivision RLE magic
    datevec <- str_detect(page, "[:digit:]{1,2}/[:digit:]{1,2}");
    raw$TRs.detected[i] = sum(datevec)
    print(paste(sum(datevec), "trip reports in this period"))
    
    #assign dates to a grouping column
    didx <- cumsum(rle(datevec)$lengths)[which(rle(datevec)$values)] #mapping of rows containing dates
    #build scraped df
    page <- data.frame(page = page)
    try(page <- page %>% mutate(group = c(rep(NA, times = rle(datevec)$lengths[1]), 
                                      rep(page[datevec], times = c(diff(didx), length(page)-last(didx)+1)))))
    
    #stow off slightly processed data
    print(paste("adding data from", last(page$group)))
    raw$page.df[i] = list(page)
  }
  #otherwise print some helpful info
  if(class(page) == "try-error"){
    print(paste("404 ERROR ON slst", URLs[i],sep=""))
  }
}
save(raw, file = file.path(paste(dd, "raw_MBWWscraped.RData", sep="/")))

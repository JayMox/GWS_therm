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
homepg <- "http://www.montereybaywhalewatch.com/sightings/"
#raw <- tibble(idx = NA, url.idx = NA, url = NA, rawpage = NA, page.df = NA)
raw <- tibble()
URLs <- #vector of characters of all possible 4digit combos; '0001'-'9999'

#Scrape the webpage
for(i in 1:length(URLs)){
  #get page
  print(paste("working on", URLs[i], sep=" "))
  url <- paste(homepg, paste("slst",URLs[i],".htm", sep=""), sep="") 
  (page <- try(read_html(url)) %>% 
      html_nodes("tr+ tr td+ td , td td td~ td+ td , b") %>% 
      html_text())
  #stow metadata & raw draw of webpage
  raw <- raw %>% bind_rows(tibble(idx = i, url.idx = URLs[i], url = url, 
                                  page.raw = list(page), days.detected = NA, 
                                  page.df = NA))
  
  #date subdivision RLE magic
  datevec <- str_detect(page, "[:digit:]{1,2}/[:digit:]{1,2}");
  raw$days.detected[i] = sum(datevec)
  print(paste(sum(datevec), "sampling units in this period"))
  #assign dates to rows
  didx <- cumsum(rle(datevec)$lengths)[which(rle(datevec)$values)]
  page <- data.frame(page = page, 
                     group = c(rep(NA, times = rle(datevec)$lengths[1]), 
                               rep(page[datevec], 
                                   times = c(diff(didx), length(page)-last(didx)+1))))
  
  #stow off slightly processed data
  print(paste("adding data from", last(page$group)))
  raw$page.df[i] = list(page)
}


(url <- paste(homepg, paste("slst",i,".htm", sep=""), sep=""))
##For loop here to try every webpage bw 1 & max(slist.htm)
#scrape sightings & dates
(page <- try(read_html(url)) %>% 
  html_nodes("tr+ tr td+ td , td td td~ td+ td , b") %>% 
  html_text())
#original scrape: "tr+ tr b , br+ center font b , tr+ tr td+ td"i

##for loop to work element by element in page?  Or can I vectorize? 
#(year <- str_extract(page[1], "[:digit:]{4}"))
#print(paste(page[1], "currently"))
datevec <- str_detect(page, "[:digit:]{1,2}/[:digit:]{1,2}"); #print(paste(length(datevec), "in this period"))
#rle magic
didx <- cumsum(rle(datevec)$lengths)[which(rle(datevec)$values)]
#create date subdividers
page <- data.frame(page = page, group = c(rep(NA, times = rle(datevec)$lengths[1]), 
                                          rep(page[datevec], times = c(diff(didx), 
                                                                       length(page)-last(didx)+1))))

#regex into long data

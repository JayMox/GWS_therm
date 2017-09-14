#iNat data extraction
#see vignette here: https://ropensci.org/blog/blog/2014/03/26/rinat

library(rinat)
#get data for sightings in Northern/Central CA
mbay_bounds <- c(37.00, -122.5, 36.5, -121.25)
cc <- get_inat_obs(query = "Carcharodon carcharias", bounds = mbay_bounds)
cat(paste("The number of records found in your bunding box:", dim(cc)[1],
          sep = " "))


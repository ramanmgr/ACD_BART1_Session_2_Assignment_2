##1. Read multiple JSON files into a directory to convert into a dataset.
#I have files text1, text2, text3 in the directory JSON.

#For Json Files: 
install.packages("rjson")
library(rjson) 
filenames <- list.files("D:\\BIG DATA\\DATA ANALYTICS WITH R, EXCEL & TABLEAU\\2 INTRODUCTION TO R\\JSON",
                        pattern="*.json",
                        full.names=TRUE) 

filenames

# this should give a character vector, with each file name represented by an entry 
myJSON <- lapply(filenames, function(x) fromJSON(file=x))  
myJSON

# a list in which each element is one of your original JSON files 
temp <- list.files("D:\\BIG DATA\\DATA ANALYTICS WITH R, EXCEL & TABLEAU\\2 INTRODUCTION TO R\\JSON", pattern="*.json", full.names=TRUE) 
temp
install.packages("purrr")
library(purrr)
movies <- purrr::map_df(temp, function(x) {    
  purrr::map(jsonlite::fromJSON(x), function(y) ifelse(is.null(y), NA, y))  })
movies





##2. Parse the following JSON into a data frame.
library(jsonlite)
library(purrr)
js<-'{
"name": null, "release_date_local": null, "title": "3 (2011)",
"opening_weekend_take": 1234, "year": 2011,
"release_date_wide": "2011-09-16", "gross": 59954
}'
js


movies <- purrr::map_df(js, function(x) {    
  purrr::map(jsonlite::fromJSON(x), function(y) ifelse(is.null(y), NA, y))  })
movies






##3. Write a script for Variable Binning using R.
daf = data.frame(v=sample(1:90,1000,TRUE)) 
daf$cat = cut(daf$v,c(-Inf,20,40,Inf)) 
head(daf)
table(daf$cat)




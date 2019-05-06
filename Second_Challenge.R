
##Second Challenge
#downloading packages
install.packages("rjson")
install.packages("dplyr")
install.packages("magrittr")
install.packages("tidyr")
install.packages("stringr")



library(rjson)
library(dplyr)
library(magrittr)
library(tidyr)
library(stringr)
#writing JSON File
resultsdata<-fromJSON(file = "DATA2.json")
#converting to dataframe
resultsdata_DF<-as.data.frame(resultsdata)

View(resultsdata_DF)
#converting to table
resultsdata_TB<-as.tbl(resultsdata_DF)
#converting subject grade to character
resultsdata_TB$Subject.grade<-as.character(resultsdata_TB$Subject.grade)

#converting to filtering and sorting
Students_Passed_Sorted<-resultsdata_TB %>% 
  select(Enrollment,Name,Subject.code,Subject.grade) %>% 
  arrange(Subject.code,Subject.grade,Enrollment) %>% 
  filter(Subject.grade!="F")
  
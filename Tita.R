data.frame(titanic_Original)
View(titanic_Original)
library(tidyr)
library(dplyr)
#Find the missing values and replace them with S
embarked4<-replace_na((titanic_Original$embarked),"S")
titanic_Original$embarked<-embarked4
View(titanic_Original)
#Calculate the mean of the Age column and use that value to populate the missing values
library(magrittr)
titanic_Original %>% 
  filter(!is.na(age)) %>% 
  summarise(mean=mean(age))
age2<-replace_na((titanic_Original$age),29.9)
age2
titanic_Original$age<-age2
is.na(titanic_Original$age)
#Fill  empty slots in boat column with a dummy value e.g. the string 'None' or 'NA'
boat2<-replace_na((titanic_Original$boat),"None")
boat2
titanic_Original$boat<-boat2
titanic_Original
#Create a new column has_cabin_number which has 1 if there is a cabin number, and 0 otherwise
titanic_Original_v2<-transform(titanic_Original,ncabin=as.character(cabin))
View(titanic_Original_v2)
is.special<-function(x){
  if(is.numeric(x))
    !is.finite(x)
  else is.na(x)
}
has_cabin_number<-sapply(titanic_Original_v2$ncabin, is.special)
has_cabin_number
titanic_Original_v3<-data.frame(titanic_Original_v2,has_cabin_number)
View(titanic_Original_v3)
cabin_3<-gsub("FALSE",1,titanic_Original_v3$has_cabin_number)
cabin_4<-gsub("TRUE",0,cabin_3)
cabin_4
titanic_Original_v3$has_cabin_number<-cabin_4
View(titanic_Original_v3)
titanic_clean<-select(titanic_Original_v3,-ncabin)
View(titanic_clean)
write.csv(titanic_clean,file="titanic_clean.csv")
library(stringr)
library(dplyr)
View(refine_Original)
brands<- c("philips","akzo","van houten","unilever")
test<-adist(refine_Original$company,brands)
colnames(test)<-brands
rownames(test)<-refine_Original$company
test
i<-apply(test,1,which.min)
test2<-data.frame(rawtext=refine_Original$company,company_v2=brands[i])
refine_Original$company<-test2$company_v2
refine_Original_v2<-refine_Original %>% 
  separate(`Product code / number`,c("product code","number"),sep="-") 
View(refine_Original_v2)
a<-gsub("p","Smartphone",refine_Original_v2$`product code`) 
b<-gsub("v","TV",a) 
c<-gsub("x","Laptop",b) 
product_category<-gsub("q","Tablet",c)
data.frame(product_category)
refine_Original_v2$product_category<-product_category
refine_Original_v3<-data.frame("company"=refine_Original_v2$company,"product code"=refine_Original_v2$`product code`,"number"=refine_Original_v2$number,"product category"=refine_Original_v2$product_category,"address"=refine_Original_v2$address,"city"=refine_Original_v2$city,"country"=refine_Original_v2$country,"name"=refine_Original_v2$name)
refine_Original_v3
full_address<-paste(refine_Original_v3$address,",",refine_Original_v3$city,",",refine_Original_v3$country)
refine_Original_v3$full_address<-full_address
View(refine_Original_v3)
refine_Original_v3$company_philips<-0
refine_Original_v3$company_akzo<-1
refine_Original_v3$company_van_houten<-0
refine_Original_v3$company_unilever<-1
refine_Original_v3$product_Smartphone<-0
refine_Original_v3$product_TV<-1
refine_Original_v3$product_Laptop<-0
refine_Original_v3$product_Tablet<-1
View(refine_Original_v3)
write.csv(refine_Original_v3,file="refine_clean.csv")
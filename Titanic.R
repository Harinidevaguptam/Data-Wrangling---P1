install.packages("titanic")
View(Titanic)
library(ggplot2)
str(Titanic)

data.frame(Titanic)

Titanic.R<-titanic_clean

View(Titanic.R)

str(Titanic.R)

data.frame(Titanic.R)

ggplot(Titanic.R, aes(x = pclass, fill = sex)) +
  geom_bar(position = "dodge")

ggplot(Titanic.R, aes(x = pclass, fill = sex)) +
  geom_bar(position = "dodge")+facet_grid(.~survived)

posn.jd <- position_jitterdodge(0.5, 0, 0.6)

ggplot(Titanic.R, aes(x = pclass,y=age, col = sex)) +
  geom_point(size=3,alpha=0.5,position = posn.jd)+facet_grid(.~survived)
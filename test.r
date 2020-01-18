library(dplyr)
library(data.table)
library(tidyverse)
library(corrplot)
teams<-read.csv("sportsReference/teams.csv",na.strings=c("NA","#DIV/0!",""))
teams18<-read.csv("sportsReference/teams18.csv",na.strings=c("NA","#DIV/0!",""))
teams19<-read.csv("sportsReference/teams19.csv",na.strings=c("NA","#DIV/0!",""))
games19<-read.csv("sportsReference/games19.csv",na.strings=c("NA","#DIV/0!",""))
teams19 %>% group_by(games_played) %>% tally()

games19 %>% group_by(type) %>% tally()


#Update team19 data with top 5 teams.
#View(teams19[grep("Michigan", teams19$X,ignore.case=TRUE),])
teams19$Ranking=0
teams19<- tibble::rowid_to_column(teams19,"ID")
teams19[178,"Ranking"]=1
teams19[81,"Ranking"]=2
teams19[157,"Ranking"]=3
teams19[332,"Ranking"]=4
topTeams<-teams19[teams19$Ranking!=0,]

#Create corplot
myData<-select(topTeams,-c(Ranking,X,abbreviation,conference,name))
myCor <- cor(myData)
corrplot(myCor, order = "FPC", method = "color", type = "lower", 
         tl.cex = 0.8, tl.col = rgb(0, 0, 0))






#old code, don't need now.
#Create tibl with top 5 teams
TeamNames<-c("Virginia Cavaliers",
             "Texas Tech",
             "Auburn Tigers",
             "Michigan State Spartans")
Ranking<-c(1,2,3,4)
TopTeam2019<-data.table(TeamNames)
TopTeam2019$Ranking<-Ranking
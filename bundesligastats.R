install.packages("ggplot2")
install.packages("dplyr")
install.packages("magrittr")
library(ggplot2)
library(magrittr)
library(dplyr)

bundesliga <- read.csv("bundesliga21.csv")

#Removes extra column which indexes the individual teams and not the data frame as a whole
bundesliga = subset(bundesliga, select = -c(X))

#Removes games which listed the result of games that ended in penalties and not goals 
bundesliga <- bundesliga[-c(94, 142, 98),]

#Changes the column 'Goals in Favor or 'GF' to a numeric value from a character value 
bundesliga$GF <- as.numeric(bundesliga$GF)

#Creating a table for each individual team
bvb <- bundesliga %>% select(Poss, GF, Team) %>%
 filter(Team == 'Borussia Dortmund')

frank <- bundesliga %>% select(Poss, GF, Team) %>% 
 filter(Team == 'Eintracht Frankfurt')

bayern <- bundesliga %>% select(Poss, GF, Team) %>%
 filter(Team == 'Bayern Munich')

greuther <- bundesliga %>% select(Poss, GF, Team) %>%
 filter(Team == 'Greuther Fürth')

#Creating the averages for each team
avgbayernPoss <- sum(bayern$Poss) / 46
avgbayerngol <- sum(bayern$GF) / 46

avgbvbPoss <- sum(bvb$Poss) / 46
avgbvbgol <- sum(bvb$GF) / 46

avgfrankPoss <- sum(frank$Poss) / 47
avgfrankgol <- sum(frank$GF) / 47

avggreutherPoss <- sum(greuther$Poss) / 34
avggreuthergol <- sum(greuther$GF) / 34

avggol <- c(avgfrankgol, avgbvbgol, avgbayerngol, avggreuthergol)
avgPoss <- c(avgfrankPoss, avgbvbPoss, avgbayernPoss, avggreutherPoss)
Team <- c('Eintracht Frankfurt', 'Borussia Dortmund', 'Bayern Munich', 'Greuther Fürth')

#Creating the data-frame for the averages of each team 
avgbundes <- data.frame(Team, avgPoss, avggol)

ggplot(mapping = aes(x = Possesion, y = Goals)) +
 geom_point(bundesliga, mapping = aes(Poss, GF, colour = Team), 
            alpha = .5, stat = 'identity', size = 2, position = 'jitter') +
 geom_point(avgbundes, mapping = aes(avgPoss, avggol, colour = Team),
            alpha = .3, stat ='identity', size = 22, show.legend = FALSE) +
 ggtitle("Goals vs 90min of Possession") +
 annotate("text", x = 35, y = 5, 
          label = "*Larger circles", size = 2.5) +
 annotate("text", x = 35, y = 4.8, 
          label = "represents team average", size = 2.5)

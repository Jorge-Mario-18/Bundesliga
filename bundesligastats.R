install.packages("ggplot2")
install.packages("tidyverse")
install.packages("magrittr")
library(ggplot2)
library(magrittr)

bundesliga <- read.csv("bundesliga21.csv")

#Removes extra column which indexes the individual teams and not the data frame as a whole
bundesliga = subset(bundesliga, select = -c(X))

#Removes Frankfurt win in the Europa League Final which is listed as '1 (5)'
bundesliga <- bundesliga[-94,]

ggplot(bundesliga, aes(x = Possession, y = Goals)) +
 geom_point(aes(x = Poss, y = GF, colour = Team), 
            alpha = 1/2, stat = 'identity', size = 3.5, position = 'jitter') +
 ggtitle("Goals vs 90min of Possession")

avgoalbvb <- select(bundesliga, starts_with('B'))

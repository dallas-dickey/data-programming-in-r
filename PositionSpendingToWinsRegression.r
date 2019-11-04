print ('start PositionSpendingToWinsRegression')

d <- qplot(QB, nflAllYears$Win, data=nflAllYears, geom = "point")
d <- d + ggtitle("Number of Wins and Dollars Spent on Quarterback")
d <- d + theme(title = element_text(size = 9))
d <- d + scale_y_continuous(limits = c(0, NA), name = "Number of Wins")
d <- d + scale_x_continuous(limits = c(0, NA), labels = dollar, name = "Cap Spend on Quarterback")

ggsave('positionSpendingToWinsRegression.jpg', width = 6, height = 4)
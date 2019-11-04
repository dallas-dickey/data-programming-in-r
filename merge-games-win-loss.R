print('start merge-games-win-loss')

#Merge Winning Teams and sal
nflAllYearsWinners <- nflAllYears[, c('Team', 'Year', 'Active')]
names(nflAllYearsWinners) <- c('Winning_Team', 'Winning_Year', 'Winning_Total_Cap')
gamesSalary <- merge(allGames, nflAllYearsWinners, by.x = c('Winner/tie', 'Year'), by.y = c('Winning_Team', 'Winning_Year'))

nflAllYearsLosers <- nflAllYears[, c('Team', 'Year', 'Active')]
names(nflAllYearsLosers) <- c('Losing_Team', 'Losing_Year', 'Losing_Total_Cap')
gamesSalary <- merge(gamesSalary, nflAllYearsLosers, by.x = c('Loser/tie', 'Year'), by.y = c('Losing_Team', 'Losing_Year'))

gamesSalary$SalaryWins <- gamesSalary$Winning_Total_Cap > gamesSalary$Losing_Total_Cap
gamesSalary$SalaryDifference <- gamesSalary$Winning_Total_Cap - gamesSalary$Losing_Total_Cap

#expected <- subset(gamesSalary, gamesSalary$SalaryWins==TRUE)
#expected2 <- subset(gamesSalary, abs(gamesSalary$SalaryDifference) > 25000000)
#expected3 <- subset(expected2, expected2$SalaryWins==TRUE)
                   
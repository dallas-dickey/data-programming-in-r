print('start merge-games-win-loss')

nflAllYearsWinners <- nflAllYears[, c('Team', 'Year', 'Total_Cap')]
nflAllYearsLosers <- nflAllYearsWinners
names(nflAllYearsLosers) <- c('Losing_Team', 'Losing_Year', 'Losing_Total_Cap')
names(nflAllYearsWinners) <- c('Winning_Team', 'Winning_Year', 'Winning_Total_Cap')

merged <- merge(allGames, nflAllYearsWinners, by.x = c('Winner/tie', 'Year'), by.y = c('Winning_Team', 'Winning_Year'))
merged <- merge(merged, nflAllYearsLosers, by.x = c('Loser/tie', 'Year'), by.y = c('Losing_Team', 'Losing_Year'))
merged$SalaryWins <- merged$Winning_Total_Cap > merged$Losing_Total_Cap
merged$SalaryDifference <- merged$Winning_Total_Cap - merged$Losing_Total_Cap
expected <- subset(merged, merged$SalaryWins==TRUE)
expected2 <- subset(merged, abs(merged$SalaryDifference) > 25000000)
expected3 <- subset(expected2, expected2$SalaryWins==TRUE)
                   
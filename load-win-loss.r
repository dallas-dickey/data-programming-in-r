print('start load-win-loss')

right = function(value, length) {
  substr(value, nchar(value) - (length-1), nchar(value))
}

convertDollarsToNumeric <- function (value)
{
  multiplier <- 1
  value <- gsub(x=value, replacement = '', pattern = '$', fixed = TRUE)
  value <- gsub(x=value, replacement = '', pattern = ',', fixed = TRUE)
  value <- gsub(x=value, replacement = '', pattern = ' ', fixed = TRUE)

  if (right(value, 1) == 'M')
  {
    value <- sub(x=value, replacement = '', pattern = 'M', fixed=TRUE)
    multiplier <- 1000000
  }
  
  value <- as.numeric(value) * multiplier
  return(value)
}

#Setup column names
columnNames <- c(
  'Team',
  'Signed',
  'Average_Age',
  'Active',
  'Dead',
  'Total_Cap',
  'Cap_Space',
  'QB',
  'RB',
  'WR',
  'TE',
  'OL',
  'DL',
  'LB',
  'DB',
  'K_B_LS',
  'Win',
  'Loss',
  'Tie'
)


#Load 2018 data into a dataframe and clean it.
nfl2018 <-  read.csv('data-2018.csv', col.names = columnNames)


nfl2018$Average_Age <- as.numeric(nfl2018$Average_Age)
nfl2018$Active <- convertDollarsToNumeric(nfl2018$Active)
nfl2018$Dead <- convertDollarsToNumeric(nfl2018$Dead)
nfl2018$Total_Cap <- convertDollarsToNumeric(nfl2018$Total_Cap)
nfl2018$Cap_Space <- convertDollarsToNumeric(nfl2018$Cap_Space)
nfl2018$QB <- convertDollarsToNumeric(nfl2018$QB)
nfl2018$RB <- convertDollarsToNumeric(nfl2018$RB)
nfl2018$WR <- convertDollarsToNumeric(nfl2018$WR)
nfl2018$TE <- convertDollarsToNumeric(nfl2018$TE)
nfl2018$OL <- convertDollarsToNumeric(nfl2018$OL)
nfl2018$DL <- convertDollarsToNumeric(nfl2018$DL)
nfl2018$LB <- convertDollarsToNumeric(nfl2018$LB)
nfl2018$DB <- convertDollarsToNumeric(nfl2018$DB)
nfl2018$K_B_LS <- convertDollarsToNumeric(nfl2018$K_B_LS)
nfl2018$Year <- as.integer(2018)

nfl2018$All_Positions <- nfl2018$QB +
  nfl2018$RB +
  nfl2018$WR +
  nfl2018$TE +
  nfl2018$OL +
  nfl2018$DL +
  nfl2018$LB +
  nfl2018$DB +
  nfl2018$K_B_LS


#Load 2017 data into a dataframe and clean it.
nfl2017 <-  read.csv('data-2017.csv', col.names = columnNames)


nfl2017$Average_Age <- as.numeric(nfl2017$Average_Age)
nfl2017$Active <- convertDollarsToNumeric(nfl2017$Active)
nfl2017$Dead <- convertDollarsToNumeric(nfl2017$Dead)
nfl2017$Total_Cap <- convertDollarsToNumeric(nfl2017$Total_Cap)
nfl2017$Cap_Space <- convertDollarsToNumeric(nfl2017$Cap_Space)
nfl2017$QB <- convertDollarsToNumeric(nfl2017$QB)
nfl2017$RB <- convertDollarsToNumeric(nfl2017$RB)
nfl2017$WR <- convertDollarsToNumeric(nfl2017$WR)
nfl2017$TE <- convertDollarsToNumeric(nfl2017$TE)
nfl2017$OL <- convertDollarsToNumeric(nfl2017$OL)
nfl2017$DL <- convertDollarsToNumeric(nfl2017$DL)
nfl2017$LB <- convertDollarsToNumeric(nfl2017$LB)
nfl2017$DB <- convertDollarsToNumeric(nfl2017$DB)
nfl2017$K_B_LS <- convertDollarsToNumeric(nfl2017$K_B_LS)
nfl2017$Year <- as.integer(2017)

nfl2017$All_Positions <- nfl2017$QB +
  nfl2017$RB +
  nfl2017$WR +
  nfl2017$TE +
  nfl2017$OL +
  nfl2017$DL +
  nfl2017$LB +
  nfl2017$DB +
  nfl2017$K_B_LS


#Load 2016 data into a dataframe and clean it.
nfl2016 <-  read.csv('data-2016.csv', col.names = columnNames)


nfl2016$Average_Age <- as.numeric(nfl2016$Average_Age)
nfl2016$Active <- convertDollarsToNumeric(nfl2016$Active)
nfl2016$Dead <- convertDollarsToNumeric(nfl2016$Dead)
nfl2016$Total_Cap <- convertDollarsToNumeric(nfl2016$Total_Cap)
nfl2016$Cap_Space <- convertDollarsToNumeric(nfl2016$Cap_Space)
nfl2016$QB <- convertDollarsToNumeric(nfl2016$QB)
nfl2016$RB <- convertDollarsToNumeric(nfl2016$RB)
nfl2016$WR <- convertDollarsToNumeric(nfl2016$WR)
nfl2016$TE <- convertDollarsToNumeric(nfl2016$TE)
nfl2016$OL <- convertDollarsToNumeric(nfl2016$OL)
nfl2016$DL <- convertDollarsToNumeric(nfl2016$DL)
nfl2016$LB <- convertDollarsToNumeric(nfl2016$LB)
nfl2016$DB <- convertDollarsToNumeric(nfl2016$DB)
nfl2016$K_B_LS <- convertDollarsToNumeric(nfl2016$K_B_LS)
nfl2016$Year <- as.integer(2016)

nfl2016$All_Positions <- nfl2016$QB +
  nfl2016$RB +
  nfl2016$WR +
  nfl2016$TE +
  nfl2016$OL +
  nfl2016$DL +
  nfl2016$LB +
  nfl2016$DB +
  nfl2016$K_B_LS


#Load 2015 data into a dataframe and clean it.
nfl2015 <-  read.csv('data-2015.csv', col.names = columnNames)


nfl2015$Average_Age <- as.numeric(nfl2015$Average_Age)
nfl2015$Active <- convertDollarsToNumeric(nfl2015$Active)
nfl2015$Dead <- convertDollarsToNumeric(nfl2015$Dead)
nfl2015$Total_Cap <- convertDollarsToNumeric(nfl2015$Total_Cap)
nfl2015$Cap_Space <- convertDollarsToNumeric(nfl2015$Cap_Space)
nfl2015$QB <- convertDollarsToNumeric(nfl2015$QB)
nfl2015$RB <- convertDollarsToNumeric(nfl2015$RB)
nfl2015$WR <- convertDollarsToNumeric(nfl2015$WR)
nfl2015$TE <- convertDollarsToNumeric(nfl2015$TE)
nfl2015$OL <- convertDollarsToNumeric(nfl2015$OL)
nfl2015$DL <- convertDollarsToNumeric(nfl2015$DL)
nfl2015$LB <- convertDollarsToNumeric(nfl2015$LB)
nfl2015$DB <- convertDollarsToNumeric(nfl2015$DB)
nfl2015$K_B_LS <- convertDollarsToNumeric(nfl2015$K_B_LS)
nfl2015$Year <- as.integer(2015)

nfl2015$All_Positions <- nfl2015$QB +
  nfl2015$RB +
  nfl2015$WR +
  nfl2015$TE +
  nfl2015$OL +
  nfl2015$DL +
  nfl2015$LB +
  nfl2015$DB +
  nfl2015$K_B_LS

#Combine all dataframes
nflAllYears <- rbind(nfl2015,nfl2016)
nflAllYears <- rbind(nflAllYears,nfl2017)
nflAllYears <- rbind(nflAllYears,nfl2018)

#Remove name vector now that we do not need it.
rm(columnNames)


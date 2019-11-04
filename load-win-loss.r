print('start load-win-loss')

right = function(value, length) {
  result = substr(value, nchar(value) - (length-1), nchar(value))
  return(as.character(result))
}

convertDollarsToNumeric <- function (value)
{
  value <- gsub(x=value, replacement = '', pattern = '$', fixed = TRUE)
  value <- gsub(x=value, replacement = '', pattern = ',', fixed = TRUE)
  value <- gsub(x=value, replacement = '', pattern = ' ', fixed = TRUE)
  for (i in 1:length(value))
  {
    if (substr(value[i], 1, 1) == '(')
    {
      #make negative
      value[i] <- sub(x=value[i], replacement = '', pattern = '(', fixed=TRUE)
      value[i] <- sub(x=value[i], replacement = '', pattern = ')', fixed=TRUE)
      value[i] <- paste('-', value[i], sep = '')
    }
    if (right(value[i], 1) == 'M')
    {
      #convert M to millions
      value[i] <- sub(x=value[i], replacement = '', pattern = 'M', fixed=TRUE)
      value[i] <- as.numeric(value[i]) * 1000000
    }
  }
  return(as.numeric(value))
}

readNflFile <- function (fileName, year)
{
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
    nflDf <- read.csv(fileName, col.names = columnNames)
    
    nflDf$Average_Age <- as.numeric(nflDf$Average_Age)
    nflDf$Active <- convertDollarsToNumeric(nflDf$Active)
    nflDf$Dead <- convertDollarsToNumeric(nflDf$Dead)
    nflDf$Total_Cap <- convertDollarsToNumeric(nflDf$Total_Cap)
    nflDf$Cap_Space <- convertDollarsToNumeric(nflDf$Cap_Space)
    nflDf$QB <- convertDollarsToNumeric(nflDf$QB)
    nflDf$RB <- convertDollarsToNumeric(nflDf$RB)
    nflDf$WR <- convertDollarsToNumeric(nflDf$WR)
    nflDf$TE <- convertDollarsToNumeric(nflDf$TE)
    nflDf$OL <- convertDollarsToNumeric(nflDf$OL)
    nflDf$DL <- convertDollarsToNumeric(nflDf$DL)
    nflDf$LB <- convertDollarsToNumeric(nflDf$LB)
    nflDf$DB <- convertDollarsToNumeric(nflDf$DB)
    nflDf$K_B_LS <- convertDollarsToNumeric(nflDf$K_B_LS)
    nflDf$Year <- as.integer(year)
    
    nflDf$All_Positions <- nflDf$QB +
      nflDf$RB +
      nflDf$WR +
      nflDf$TE +
      nflDf$OL +
      nflDf$DL +
      nflDf$LB +
      nflDf$DB +
      nflDf$K_B_LS
    
    return(nflDf)
}


#Load 2018 data into a dataframe and clean it.
nfl2018 <-  readNflFile('data-2018.csv', 2018)

#Load 2017 data into a dataframe and clean it.
nfl2017 <-  readNflFile('data-2017.csv', 2017)

#Load 2016 data into a dataframe and clean it.
nfl2016 <-  readNflFile('data-2016.csv', 2016)

#Load 2015 data into a dataframe and clean it.
nfl2015 <-  readNflFile('data-2015.csv', 2015)

#Combine all dataframes
nflAllYears <- rbind(nfl2015,nfl2016)
nflAllYears <- rbind(nflAllYears,nfl2017)
nflAllYears <- rbind(nflAllYears,nfl2018)

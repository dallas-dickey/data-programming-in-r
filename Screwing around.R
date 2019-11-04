readGameByGame <- function(years)
{
  url <- 'https://www.pro-football-reference.com/years/syear/games.htm'
  first <- TRUE
  
  for (year in years)
  {
    yearUrl <- sub(url, pattern = 'syear', replacement = year, fixed = TRUE)
    
    pg <- read_html(yearUrl)
    tables <- html_table(pg, fill = TRUE)
    
    if (first == TRUE)
    {
      AllYears <- tables[[1]]
      AllYears$Year <- year
    }
    else
    {
      tbl2 <- tables[[1]] 
      tbl2$Year <- year
      AllYears <- rbind(AllYears, tbl2) 
    }
    first = FALSE
  }  
  
  AllYears <- subset(AllYears, Week!='Week')
  
  return(AllYears)
}

years  <- c(2015, 2016, 2017, 2018)
allGames <- readGameByGame(years)


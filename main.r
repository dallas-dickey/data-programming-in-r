print('start main')

#required packages
require(rvest)
require(ggplot2)
require(scales)

#clear workspace
rm(list = ls())

#install packages if necessary
#install.packages("rvest")
#install.packages("ggplot2")
#install.packages("scales")

#load libraries
library(rvest)
library(ggplot2)
library(scales)

#Load Data

source('load-win-loss.r')
source('load-games.r')
source('merge-games-win-loss.r')

#plot graphs
source('AgeToWinsRegression.r')
source('SalaryCapToWinsRegression.r')
source('PositionSpendingToWinsRegression.r')
source('HeadToHeadActiveBar.r')
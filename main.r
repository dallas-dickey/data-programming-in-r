print('start main')

#required packages
require('rvest')
require(ggplot2)

#clear workspace
rm(list = ls())

#install packages if necessary
# install.packages("rvest")
#install.packages("ggplot2")

#load libraries
library(rvest)
library(ggplot2)

#steps
source('load-win-loss.r')
source('load-games.r')
source('merge-games-win-loss.r')


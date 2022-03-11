library(fpp3)
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)

stocks <- read.csv("nyse_stocks.csv")
stocks$date <- as.Date(stocks$date)
stocks <- as_tsibble(stocks, index = date, key = symbol)
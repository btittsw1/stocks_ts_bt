#load libraries
library(fpp3)
library(shiny)

#load data
stocks <- read.csv("nyse_stocks.csv")
head(stocks)

#convert to tsibble
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)

shinyApp(ui, server)
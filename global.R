library(fpp3)

stocks <- read.csv("nyse_stocks.csv")
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)
library(fpp3)

stocks <- read.csv("nyse_stocks.csv")
stocks$date <- as.Date(stocks$date)
stocks <- as_tsibble(stocks, index = date, key = symbol)
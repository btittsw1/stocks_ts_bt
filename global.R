library(fpp3)
library(readr)

stocks <- read_csv("nyse_stocks.csv.zip")
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)
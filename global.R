library(fpp3)
#unzip data file; GitIgnore has been updated, so the data will work when unzipped
stocks <- read.csv("nyse_stocks.csv")
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)
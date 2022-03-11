library(fpp3)
library(readr)
#unzip data file; GitIgnore has been updated, so the data will work when unzipped
stocks <- read_csv("nyse_stocks.csv.zip")
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)
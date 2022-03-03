library(fpp3)
stocks <- read.csv("nyse_stocks.csv")
head(stocks)

stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)

selected_stock = "AAPL"
stocks %>%
  filter(symbol %in% selected_stock) %>%
  autoplot(open)
#plan by March 7
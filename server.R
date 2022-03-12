library(shiny)
library(ggplot2)
server <- function(input, output) {
#Feature 4
  output$stock_dropdown <- renderUI({
    filteredstocks <- stocks[stocks$gics_sector == input$select_industry, ]
    
    selectInput(
      inputId = "stock_selected",
      label = "Select a stock:",
      choices = sort(unique(filteredstocks$symbol))
    )
  })
  
  output$plotted_price <- renderPlot({
    min_date <- input$selected_date_range[1]
    max_date <- input$selected_date_range[2]
    
    plot_df <- stocks[
      stocks$date >= min_date &
        stocks$date <= max_date,]
    
    plot_df <- stocks[stocks$gics_sector == input$select_industry & 
                        stocks$symbol == input$stock_selected,]
    
  autoplot(plot_df, .vars = close) 
  
  })
  output$plotted_volume <- renderPlot({
    min_date <- input$selected_date_range[1]
    max_date <- input$selected_date_range[2]
    
    plot_df <- stocks[
      stocks$date >= min_date &
        stocks$date <= max_date,]
    
    plot_df <- stocks[stocks$gics_sector == input$select_industry & 
                        stocks$symbol == input$stock_selected,]
    
    autoplot(plot_df, .vars = volume) 
    
  })
  
}
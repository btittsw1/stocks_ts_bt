library(shiny)
library(ggplot2)
server <- function(input, output) {
  output$stock_dropdown <- renderUI({
    filteredstocks <- stocks[stocks$state == input$select_state, ]
    
    selectInput(
      inputId = "stock_selected",
      label = "Select a stock:",
      choices = sort(unique(filteredstocks$symbol))
    )
  })
  
  output$plotted_price <- renderPlot({
    
    
    plot_df <- stocks[stocks$state == input$select_state & 
                        stocks$symbol == input$stock_selected,]
    
  autoplot(plot_df, .vars = close) 
  
  })
  output$plotted_volume <- renderPlot({
    
    
    plot_df <- stocks[stocks$state == input$select_state & 
                        stocks$symbol == input$stock_selected,]
    
    autoplot(plot_df, .vars = volume) 
    
  })
}
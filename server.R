#library
library(shiny)

server <- function(input, output) {
    #Feature 4
  output$plotted_stock1 <- renderPlot({
    min_date <- input$select_date[1]
    max_date <- input$select_date[2]

    plot_stock1 <- stocks[stocks$state == input$selected_state &
                     stocks$symbol == input$selected_stock,]
    
    plot_stock1 <- plot_stock1[plot_stock1$date >= min_date,]
    plot_stock1 <- plot_stock1[plot_stock1$date <= max_date,]
    
    autoplot(plot_stock1, .vars = volume)
  })
  
  output$plotted_stock2 <- renderPlot({
    min_date <- input$select_date[1]
    max_date <- input$select_date[2]
    
    plot_stock2 <- stocks1[stocks1$state == input$selected_state &
                             stocks1$symbol == input$selected_stock,]
    
    plot_stock2 <- plot_stock2[plot_stock2$date >= min_date,]
    plot_stock2 <- plot_stock2[plot_stock2$date <= max_date,]
    
    autoplot(plot_stock2, .vars = close)
  })
}
  

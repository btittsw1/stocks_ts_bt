#library
library(shiny)

server <- function(input, output) {
    #Feature 4
  output$debug <- renderPrint({
    input$select
  })  
  output$plotted_location <- renderPlot({
      autoplot(stocks[,c("date", input$select)])
    output$value <- renderPrint({ input$select })
  })
}
  

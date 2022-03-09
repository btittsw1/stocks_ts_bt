#library
library(shiny)

server <- function(input, output) {
    #Feature 4
  output$plotted_location <- renderPlot({
    min_date <- input$select_date[1]
    max_date <- input$select_date[2]
    
    
    plot_df <- stocks[#stocks$state == input$select & 
                         stocks$symbol == input$selected_stock,]
    
    plot_df <- plot_df[plot_df$date >= min_date,]
    plot_df <- plot_df[plot_df$date <= max_date,]
    
    autoplot(plot_df, .vars = volume)
  })
}
  

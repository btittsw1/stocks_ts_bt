server <- function(input, output) {
#Feature 1
  output$stock_dropdown <- renderUI({
    filteredstocks <- stocks[stocks$state == input$select_state, ]
    
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
    
    plot_df <- stocks[stocks$state == input$select_state & 
                        stocks$symbol == input$stock_selected,]
    
  autoplot(plot_df, .vars = close) 
#feature 2  
  })
  output$plotted_volume <- renderPlot({
    min_date <- input$selected_date_range[1]
    max_date <- input$selected_date_range[2]
    
    plot_df <- stocks[
      stocks$date >= min_date &
        stocks$date <= max_date,]
    
    plot_df <- stocks[stocks$state == input$select_state & 
                        stocks$symbol == input$stock_selected,]
    
    autoplot(plot_df, .vars = volume) 
    
  })
#feature 3  
  output$industry_dropdown <- renderUI({
    filteredindustry <- stocks[stocks$gics_sector == input$select_industry, ]
    
    selectInput(
      inputId = "stock_selected_industry",
      label = "Select a stock:",
      choices = sort(unique(filteredindustry$symbol))
    )
  })
  
  output$plotted_industry <- renderPlot({
    min_date <- input$selected_date_range[1]
    max_date <- input$selected_date_range[2]
    
    plot_industry <- stocks[
      stocks$date >= min_date &
        stocks$date <= max_date,]
    
    plot_industry <- stocks[stocks$gics_sector == input$select_industry & 
                        stocks$symbol == input$stock_selected_industry,]
    
    autoplot(plot_industry, .vars = open) 
})
#feature 4
  output$plotted_comp1<-renderPlot({
     plot_stock_1 <- stocks[stocks$symbol == input$select_stock1,]
     autoplot(plot_stock_1, .vars = close) 
  })
  
  output$plotted_comp2<-renderPlot({
    plot_stock_2 <- stocks[stocks$symbol == input$select_stock2,]
    autoplot(plot_stock_2, .vars = close) 
  })
}

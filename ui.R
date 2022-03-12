
ui <- dashboardPage(
  skin = "green",
  dashboardHeader(title = "Time Series Stock Analysis",
                  titleWidth = 300),
  dashboardSidebar(
    width = 150,
    sidebarMenu(
      menuItem("Search by State", tabName = "state"),
      menuItem("View by Date", tabName = "date"),
      menuItem("Search by Industry", tabName = "industry"),
      menuItem("Stock Comparison", tabName = "stockcompare"))
  ),
  dashboardBody(
    tabItems(
    tabItem(tabName = "state",          box(plotOutput("plotted_price"), width = 12, 
                                             status = "primary", 
                                             title = "Closing Price Year-Over-Year",
                                             solidHeader = TRUE),
            
                                         box(selectInput(inputId ="select_state", 
                                             label = ("Select Location:"), 
                                             choices = unique(stocks$state)),
                                             status = "primary", title = "Location"),
            
                                         box(uiOutput("stock_dropdown"),
                                             status = "primary", 
                                             title = "Stock")),
    
    tabItem(tabName = "date",        box(plotOutput("plotted_volume"), width = 12, 
                                         status = "primary", 
                                         title = "Volume Year-Over-Year", 
                                         solidHeader = TRUE),
            
                                      box(dateRangeInput(inputId = 'selected_date_range',
                                         label = 'Select date range:',
                                         start = min(stocks$date),
                                         end = max(stocks$date),
                                         min = min(stocks$date),
                                         max = max(stocks$date)), 
                                         status = "primary",
                                         title = "Date Range")),
    
    tabItem(tabName = "industry",     box(plotOutput("plotted_industry"), width = 12, 
                                          status = "primary", 
                                          title = "Opening Price Year-Over-Year",
                                          solidHeader = TRUE),
            
                                      box(selectInput(inputId ="select_industry", 
                                          label = ("Choose Industry:"), 
                                          choices = unique(stocks$gics_sector)),
                                          status = "primary", title = "Industry"),
            
                                      box(uiOutput("industry_dropdown"),
                                          status = "primary",
                                          title = "Stock")),
    
    tabItem(tabName = "stockcompare", box(plotOutput("plotted_comp1"), width = 6, 
                                          status = "primary", 
                                          title = "Closing Price Year-Over-Year", 
                                          solidHeader = TRUE),
            
                                      box(plotOutput("plotted_comp2"), width = 6, 
                                          status = "primary", 
                                          title = "Closing Price Year-Over-Year", 
                                          solidHeader = TRUE),
            
                                      box(selectInput(inputId ="select_stock1", 
                                          label = ("Choose Stock"), 
                                          choices = unique(stocks$symbol)), 
                                          status = "primary", 
                                          title = "First Stock Choice"),
            
                                      box(selectInput(inputId ="select_stock2", 
                                          label = ("Choose Stock"), 
                                          choices = unique(stocks$symbol)), 
                                          status = "primary", 
                                          title = "Second Stock Choice"),
                                          
            status = "primary", title = "Stock"))
    )
  )
    
            

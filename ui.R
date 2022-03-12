library(shiny)
library(shinydashboard)


ui <- dashboardPage(
  skin = "green",
  dashboardHeader(title = "Time Series Stock Analysis",
                  titleWidth = 300),
  dashboardSidebar(
    width = 150,
    sidebarMenu(
      menuItem("Search by State", tabName = "state"),
      menuItem("View by Date", tabName = "date"),
      menuItem("Search by Industry", tabName = "industry"))
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
                                          title = "Stock"))
    )
  )
)
    
            
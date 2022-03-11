library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  skin = "green",
  dashboardHeader(title = "Time Series Stock Analysis",
                  titleWidth = 300),
  dashboardSidebar(
    width = 150,
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard"),
      menuItem("Chart", tabName = "charts")),
      menuItem("Search by State", tabName = "Search", icon = icon("map"))
  ),
  dashboardBody(
  tabItem(tabName = "Search",
    fluidRow(
    #Feature 4
    box(plotOutput("plotted_price"), width = 12, 
        status = "primary", title = "Closing Price Year-Over-Year", solidHeader = TRUE),
    
    box(plotOutput("plotted_volume"), width = 12, 
        status = "primary", title = "Volume Year-Over-Year", solidHeader = TRUE),
  
     box(selectInput(inputId ="select_state", 
                    label = ("Choose Location"), 
                    choices = unique(stocks$state)
    ), status = "primary", title = "Location"),
    
    box( uiOutput("stock_dropdown"),
    
    
    
    status = "primary", title = "Stock")
    )
   )
  )
)

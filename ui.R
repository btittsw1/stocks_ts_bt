#library
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Time Series Stock Analysis"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard"),
        menuItem("Charts", tabName = "charts", icon = icon("th"))
      )
    ),
    dashboardBody(
      fluidRow(
        #Feature 4
        box(plotOutput("plotted_location"), width = 500),
        # selectInput(inputId ="select", 
        #             label = h3("Select Location"), 
        #             choices = unique(stocks$state)
        #             ),
        selectInput(inputId = "selected_stock",
                    label = "Select Stock",
                    choices = unique(stocks$symbol)
        ),
        dateRangeInput(inputId = "select_date",
                       label = "Select Date Range",
                       min = min(stocks$date),
                       max = max(stocks$date),
                       start = min(stocks$date),
                       end = max(stocks$date)
        )
      ),
      
      
      
    )
)
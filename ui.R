#library
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  skin = "green",
    dashboardHeader(title = "Time Series Stock Analysis",
                    titleWidth = 300),
    dashboardSidebar(
      width = 100,
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard"),
        menuItem("Chart", tabName = "charts"))
      ),
    
    dashboardBody(
      fluidRow(
        #Feature 4
        box(plotOutput("plotted_location"), width = 12, 
            status = "primary", title = "Volume by Date Range", solidHeader = TRUE),
        # box(selectInput(inputId ="select", 
        #             label = h3("Select Location"), 
        #             choices = unique(stocks$state)
        #             ), status = "primary", title = "Location"),
        box(selectInput(inputId = "selected_stock",
                    label = "Select Stock",
                    choices = unique(stocks$symbol)
        ), status = "primary", title = "Stock"),
        box(dateRangeInput(inputId = "select_date",
                       label = "Select Date Range",
                       min = min(stocks$date),
                       max = max(stocks$date),
                       start = min(stocks$date),
                       end = max(stocks$date)
        ),
        status = "primary", title = "Time")
      )
    )
)
        
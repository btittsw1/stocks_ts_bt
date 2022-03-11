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
        box(plotOutput("plotted_stock1"), width = 12, 
            status = "primary", title = "Stock 1", solidHeader = TRUE),
         # box(selectInput(inputId ="selected_state",
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
        status = "primary", title = "Time"),
        box(plotOutput("plotted_stock2"), width = 12,
            status = "primary", title = "Stock 2", solidHeader = TRUE)
      )
    )
   )

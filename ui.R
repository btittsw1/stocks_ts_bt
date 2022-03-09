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
        selectInput(inputId ="select", 
                    label = h3("Select Location"), 
                    choices = unique(stocks$state),
                    ),
        plotOutput("plotted_location"),
        verbatimTextOutput("debug")
      )
      
      
    )
)
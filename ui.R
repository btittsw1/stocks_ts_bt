sidebar<-dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard",icon=icon("dashboard")),
    menuItem("Charts", tabName = "charts", icon = icon("th"))
  )
)


body<-dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Dashboard tab content")
    ),
    
    tabItem(tabName = "charts",
            h2("Charts tab content")
    )
  )
)

ui <- dashboardPage(
  dashboardHeader(title = "Time Series Stock Analysis"),
  sidebar,
  body
)





# fluidRow(
#   #Feature 4
#   selectInput(inputId ="select", 
#               label = h3("Select Location"), 
#               choices = unique(stocks$state),
#   ),
#   plotOutput("plotted_location"),
#   verbatimTextOutput("debug")
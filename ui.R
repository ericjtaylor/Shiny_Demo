library(shiny)

shinyUI(fluidPage(
  titlePanel("Diamond Appraisal Service"),
  sidebarLayout(
    sidebarPanel(
        h3("Input:"),
        h5("Please enter diamond characteristics."),
        sliderInput("carat","Carats:",min = 0.2,max = 5.0,value = 0.7, step= 0.1),
        selectInput("cut", "Cut:", 
                    choices = list("Fair" = "Fair", "Good" = "Good", "Very Good" = "Very Good", "Premium" = "Premium", "Ideal" = "Ideal"), 
                    selected = "Ideal"),
        selectInput("color", "Color:", 
                    choices = list("J" = "J", "I" = "I", "H" = "H", "G" = "G", "F" = "F", "E" = "E", "D" = "D"), 
                    selected = "G"),
        selectInput("clarity", "Clarity:", 
                    choices = list("I1" = "I1", "SI1" = "SI1", "SI2" = "SI2", "VS1" = "VS1", "VS2" = "VS2", "VVS1" = "VVS1", "VVS2" = "VVS2", "IF" = "IF"), 
                    selected = "SI1")
    ),
    mainPanel(
      h3("Output:"),
      plotOutput("hist"),
      textOutput("value"),
      textOutput("bling")
    )
  )
))

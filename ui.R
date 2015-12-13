library(markdown)
library(car)


  shinyUI(fluidPage(
    

  titlePanel("Systematic measurement error in subgroups"),
  

  sidebarLayout(
    sidebarPanel(
      selectInput("groups", label = "Grouping:",
                  choices = c("All units", "males", "females", "males and females", "males and females (+ means)"), selected = 1),
      sliderInput("error_males", label = "Systematic error (males):",
                  min = -10, max = 10, value = 0, step = 1),
      sliderInput("error_females", label = "Systematic error (females):", min = -10, max = 10, value = 0, step = 1),
      sliderInput("error_y", label = "Systematic error (y values):", min = 0, max = 10, value = 0, step = 1),
      br(), br(),
      
      div("Shiny app by", 
          a(href="http://paulcbauer.eu/",target="_blank", 
            "Paul C. Bauer"),align="right", style = "font-size: 8pt"),
      
      
      div("Shiny/R code:",
          a(href="https://github.com/paulbauer/measurement_error/",
            target="_blank","GitHub"),align="right", style = "font-size: 8pt")


  ),

 mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel("Plot", plotOutput("plot")),
        tabPanel("Instructions", includeMarkdown("instruction.md")),
        tabPanel("About", includeMarkdown("about.md"))
      
      )
    )
  )
))
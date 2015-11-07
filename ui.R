# library(shiny)
# library(BH)
# library(stringr)
# library(lattice)
# library(latticeExtra)
# library(psych) # enfernen?
library(markdown)
# library(foreign)
library(car)


  
  shinyUI(fluidPage(
    
  # Application title
  titlePanel("Systematic measurement error in subgroups"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(
      h5(textOutput("hits")),
      selectInput("groups", label = "Grouping:",
                  choices = c("All units", "males", "females", "males and females", "males and females (+ means)"), selected = 1),
      sliderInput("error_males", label = "Systematic error (males):",
                  min = -10, max = 10, value = 0, step = 1),
      sliderInput("error_females", label = "Systematic error (females):", min = -10, max = 10, value = 0, step = 1),
      sliderInput("error_y", label = "Systematic error (y values):", min = 0, max = 10, value = 0, step = 1)


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













      




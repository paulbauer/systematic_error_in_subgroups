# library(shiny)
# library(foreign)

# Counter
# A server parameters
SP <- list()
# Record the number of poeple who have used the app
#    since initiation on the server
SP$npers <- 0

shinyServer(function(input, output){

  # Counter
  # shinyServer is Started up every time the domain is called.
  # Use <<- to assign to the global server environment.
  SP$npers <<- SP$npers + 1
  output$hits <- renderText({
    paste0("Pageviews: " , SP$npers)
  })
  
  
output$plot <- renderPlot({
    # Add systematic error
    # For males and females
    Davis$weight[Davis$sex=="M"] <- Davis$weight[Davis$sex=="M"]+input$error_males
    Davis$weight[Davis$sex=="F"] <- Davis$weight[Davis$sex=="F"]+input$error_females 
    
    # For people with low and high weight
    Davis$weight[Davis$weight<=55] <- Davis$weight[Davis$weight<=55]+input$error_y
    Davis$weight[Davis$weight>74] <- Davis$weight[Davis$weight>74]-input$error_y    
    
    par(mar=c(5,5,2,1))
    y.limits <- c(0,80)
    type <- TRUE
    ###  
    if(input$groups=="All units"){
      hist(Davis$weight, xaxt="n", breaks=seq(0, 200, 10), cex.axis=2, cex.lab=2, cex.main=2, freq=type, ylim=y.limits, main="Histogram: Weight", xlab="weight")
      axis(1, at=seq(0, 200,10), labels=seq(0, 200,10), cex.axis=2)
    }
    ###
    if(input$groups=="males"){
      hist(Davis$weight[Davis$sex=="M"], freq=type, xaxt="n", breaks=seq(0, 200, 10), cex.axis=2, cex.lab=2, cex.main=2, ylim=y.limits, col="#FF5C5C22", main="Histogram: Weight (males only)", xlab="weight")
      axis(1, at=seq(0, 200,10), labels=seq(0, 200,10), cex.axis=2)
    }
    ###
    if(input$groups=="females"){
      hist(Davis$weight[Davis$sex=="F"], xaxt="n", breaks=seq(0, 200, 10), cex.axis=2, cex.lab=2, cex.main=2, ylim=y.limits, col="#003DF540", freq=type, main="Histogram: Weight (females only)", xlab="weight")
      axis(1, at=seq(0, 200,10), labels=seq(0, 200,10), cex.axis=2)
    }  
    ###
    if(input$groups=="males and females"){
      hist(Davis$weight[Davis$sex=="F"], xaxt="n", breaks=seq(0, 200, 10), cex.axis=2, cex.lab=2, cex.main=2, col="#003DF540", ylim=y.limits, freq=type, main="Histogram: Weight (males and females)", xlab="weight")  
      hist(Davis$weight[Davis$sex=="M"], xaxt="n", breaks=seq(0, 200, 10), cex.axis=2, cex.lab=2, cex.main=2, col="#FF5C5C40", add=T, ylim=y.limits, freq=type)
      axis(1, at=seq(0, 200,10), labels=seq(0, 200,10), cex.axis=2)
    }  
    ###
    if(input$groups=="males and females (+ means)"){
      hist(Davis$weight[Davis$sex=="F"], xaxt="n", breaks=seq(0, 200, 10), cex.axis=2, cex.lab=2, cex.main=2, col="#003DF540", ylim=y.limits, main="Histogram: Weight (males and females)", xlab="weight")  
      hist(Davis$weight[Davis$sex=="M"], xaxt="n", breaks=seq(0, 200, 10), cex.axis=2, cex.lab=2, cex.main=2, col="#FF5C5C22", add=T, ylim=y.limits)
      abline(v=mean(Davis$weight[Davis$sex=="F"]), col="blue")
      abline(v=mean(Davis$weight[Davis$sex=="M"]), col="red")
      axis(1, at=seq(0, 200,10), labels=seq(0, 200,10), cex.axis=2)
    }  
  }, height=400)







})

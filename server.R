#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

#caculate the BMI 
#Calculate function
BMI <- function(height,weight) weight/(height)^2

# Print the result
shinyServer(function(input, output) {
   
  output$result <- renderPrint({BMI(input$height,input$weight)})
    
   
}
)

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
   
  output$result <- renderPrint({
    w <- as.numeric(input$weight)
    h <- as.numeric(input$height)
    
    if (w<0||h<0){
      'Wrong input, please input proper number'
    } else {
      BMI(input$height,input$weight)}
    })
    
  
  output$status <- renderPrint({w <- as.numeric(input$weight)
                               h <- as.numeric(input$height)
                               bmi <- w/h^2
                               if (w<0||h<0){
                                 'Wrong input, please input proper number'
                               } else if(bmi<18.5) { 
                                  'underweight'
                               } else if(bmi>18.5&&bmi<25){ 
                                  'Normal'
                               } else if(bmi>=25)
                               {
                                  'overweight'
                               }
                               })
   
}
)

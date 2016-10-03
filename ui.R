#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/  
#

library(shiny)

# Define UI for application that calculates your Body Mass Index(BMI) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("BMI Caculator"),
   
  # Sidebar with the height and weight text input
    sidebarPanel(
      
      numericInput('height', 'Height m', 1.65, min = 0, max = 3, step = 0.01),
      numericInput('weight', 'Weight kg', 50, min = 0, max = 300, step = 0.5),
      submitButton('Submit')
    ),
      
    # Show the result of BMI
    mainPanel(
      h3('Your BMI'),
      verbatimTextOutput("result"),
      h3('BMI reference value'),
      h4('<18.5 | Underweight'),
      h4('18.5~24.9 |   Normal'),
      h4('>=25.0  |  Overweight')

     
    )
  )
)

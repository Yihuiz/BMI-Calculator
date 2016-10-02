---
title       : Slidyfy My Shiny 
subtitle    : App BMI caculator
author      : Yihui Zuo
job         : Graduate Student in North China Electric Power University
framework   : minimal    # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduce the The BMI Calculator

This presentaion will show the code of my application--
the Body Mass Index (BMI) calculator. 

The App can be found at [shinyapps](http://yihuizuo.shinyapps.io/ShinyApp_YihuiZuo)

---
## Creat the User-interface definition 

```r
library(shiny)
### Define UI for application that calculates your Body Mass Index(BMI) 
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
```
## This is the server logic of the Shiny

```r
library(shiny)

#caculate the BMI 
#Calculate function
BMI <- function(height,weight) weight/(height)^2

# Print the result
shinyServer(function(input, output) {
   
  output$result <- renderPrint({BMI(input$height,input$weight)})
    
   
}
```

## Information

Find out more about building applications with Shiny here[My github](https://github.com/Yihuiz/BMI-Calculator)







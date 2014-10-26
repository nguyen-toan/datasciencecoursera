source("./bmi.R")

shinyServer(function(input, output) {
  output$input <- renderText({
    if (input$units == KG_M) {
      unit.weight = "kg"
      unit.height = "m"
    } else {
      unit.weight = "lb"
      unit.height = "in"
    }
    
    paste("<strong>You weigh ", input$mass, " ", unit.weight, " and ",
          input$height, " ", unit.height, " tall</strong>.",
          sep="")
  })
  
  output$result <- renderText({
    bmi <- bmi(input$mass, input$height, input$units)
    
    if (bmi <  15.0) info = "Very severely underweight"
    else if (bmi <= 16.0) info = "Severely underweight"
    else if (bmi <= 18.5) info = "Underweight"
    else if (bmi <= 25.0) info = "Normal (healthy weight)"
    else if (bmi <= 30.0) info = "Overweight"
    else if (bmi <= 35.0) info = "Obese Class I (Moderately obese)"
    else if (bmi <= 40.0) info = "Obese Class II (Severely obese)"
    else  info = "Obese Class III (Very severely obese)"
    
    paste("Your BMI is ", "<code>", round(bmi, 2), "</code>",
          ", which is: <strong>", info, "</strong>",
          sep="")
  })
  
  output$graph <- renderText({
    "<img src='https://upload.wikimedia.org/wikipedia/commons/e/e9/Body_mass_index_chart.svg' title='BMI chart (Wikipedia)' />"
  })
  
})
########
# Shiny app to create a dynamically-filterable visualization of the diamonds app
########

library(shiny)
library(tidyverse)

head(mtcars)

min.mpg <- min(mtcars$mpg)
max.mpg <- max(mtcars$mpg)

ui <- fluidPage(

    titlePanel("Fuel efficiency viewer"),

    sidebarLayout(
        sidebarPanel(
            selectInput('x', 'X', choices = nms, selected = "mpg"),
            # This is a range slider (i.e. there's a max and min). It is set that way by "value" (the starting value), which is a 2-element vector
            sliderInput("mpg.adjuster",
                        "mpg",
                        min = min.mpg,
                        max = max.mpg,
                        value = c(min.mpg, max.mpg)),
            submitButton(text = "Explore")
        ),
            
            # Show a plot of diamonds data frame. This output doesn't care what that plot is, only that it will be associated with output$diamonds_plot
        mainPanel(
           plotOutput("mtcars_plot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    d_filt <- reactive({
    
    low.mpg <- input$mpg.adjuster[1]
    hi.mpg <- input$mpg.adjuster[2]
    
   mtcars %>%
        filter(mpg >= low.mpg) %>%
        filter(mpg <= hi.mpg)
    })
    
    output$mtcars_plot <- renderPlot({
       ggplot(d_filt(), aes_string(x = "x", y = "hp", color = "wt")) +
                  geom_point()
       })
}

# Run the application 
shinyApp(ui = ui, server = server)

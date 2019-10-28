########
# Shiny app to create a dynamically-filterable visualization of the diamonds app
########

# Testing commit

library(shiny)
library(tidyverse)

min.carat <- min(diamonds$carat)
max.carat <- max(diamonds$carat)

ui <- fluidPage(

    titlePanel("Diamonds data set viewer"),

    sidebarLayout(
        sidebarPanel(
            
            # This is a range slider (i.e. there's a max and min). It is set that way by "value" (the starting value), which is a 2-element vector
            sliderInput("carat.adjuster",
                        "Carats",
                        min = min.carat,
                        max = max.carat,
                        value = c(min.carat, max.carat)),
            submitButton(text = "Go")
        ),
            
            # Show a plot of diamonds data frame. This output doesn't care what that plot is, only that it will be associated with output$diamonds_plot
        mainPanel(
           plotOutput("diamonds_plot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    d_filt <- reactive({
    
    low.carat <- input$carat.adjuster[1]
    hi.carat <- input$carat.adjuster[2]
    
   diamonds %>%
        filter(carat >= low.carat) %>%
        filter(carat <= hi.carat)
    })
    
    output$diamonds_plot <- renderPlot({
       ggplot(d_filt(), aes_string(x = "carat", y = "y", color = "clarity")) +
                  geom_point()
       })
}

# Run the application 
shinyApp(ui = ui, server = server)

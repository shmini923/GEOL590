# Buggers review: Nypaver, Rogers, Seo

This project is an interactive shiny app to create linear models for data with categorical or continuous dependent and independent variables. The app is released with an extensive README.md file that explains both how to use the models, and the underlying theory. It allows upload of user-defined data in a .csv file, and comes with three built-in datasets. Thus, it is meant both as a tool for analysis and a tool for teaching the meaning of linear models. The scope of this project was sufficient but not exceptional for a 3-person team.

The README.md file is generally well-written, although I think it could have been a bit more extensive (e.g. showing the how equation for a two-way ANOVA collapses into that of a one-way ANOVA, or making explicit how levels are coded in an ANOVA to make it equivalent to a linear regression). However

The user interface is largely well designed, including an input side panel and four tabs in the main panel for data display, plots, and model outputs. However, the user experience would benefit from two important changes: 1.) meaningful error messages in the Linear Model and ANOVA tabs when the user selects a categorical dependent variable, and 2.) a recoding of the data frame to which the linear model is fit, so that the Linear Model tab refers to variables in the data frame rather than text like `input$variable1`. 

The code is generally appropriately commented (a few code blocks, like at lines 184, lack comments) but the git history shows little evidence of correct git-based collaboration or incremental commit messages.

Grade: B
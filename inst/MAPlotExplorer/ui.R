size = 450

shinyUI(fluidPage(
    titlePanel("MA plot explorer"),

    splitLayout(cellWidths=size,
                plotOutput("plotma", click="plotma_click",
                           width=size, height=size),
                plotOutput("plotcounts", width=size, height=size)
                ),
    splitLayout(cellWidths=size,
                sliderInput("alpha", "-10 log10(Adjusted p-value)",
                            min=0, max=40, value=30, step=5, width=size)
                )
    
    ))

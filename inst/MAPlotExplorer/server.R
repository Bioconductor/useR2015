library(DESeq2)

dds <- readRDS("ma-plot-explorer-data.rds")
res <- results(dds)

ymax <- 5

## this object will be used to locate points from click events.
## the log10 is necessary for clicks to register near points
data <- with(res, cbind(log10(baseMean), log2FoldChange))
data[,2] <- pmin(ymax, pmax(-ymax, data[,2]))
scale <- c(diff(range(data[,1])), 2*ymax)
t.data.scaled <- t(data) / scale

shinyServer(function(input, output) {
    
    current = reactiveValues(idx = NULL)
    
    observe({
        xy = c(input$plotma_click$x, input$plotma_click$y)
        if (!is.null(xy)) {
            # need to log10 transform incoming click 'x' coordinate
            xy[1] <- log10(xy[1])
            ## find index of the closest point
            sqdists <- colMeans((t.data.scaled - xy/scale)^2)
            current$idx <- which.min(sqdists)
        }
    })
    
    ## MA-plot
    output$plotma <- renderPlot({
        par(mar=c(5,5,3,2), cex.main=1.5, cex.lab=1.35)
        plotMA(res, ylim=c(-ymax, ymax), alpha=10^(-input$alpha / 10))
        ## add a circle around the selected point
        idx = current$idx
        if (!is.null(idx))
            # the first column of 'data' gives the exponent
            points(10^data[idx,1], data[idx,2], col="dodgerblue", cex=3, lwd=3)
    })
    
    ## counts plot for the selected gene
    output$plotcounts <- renderPlot({
        par(mar=c(5,5,3,2), cex.main=1.5, cex.lab=1.35)
        ## update only when idx changes
        idx = current$idx
        if (!is.null(idx))
            plotCounts(dds, idx, intgroup=c("dex"))
    })

})

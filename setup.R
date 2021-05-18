#https://gitlab.c3sl.ufpr.br/walmes/pesq-reprod/-/blob/master/config/setup.R
#------------------------------------------------------------

library(knitr)

# Definições no knitr para execução e exibição do código.

setup <- function () {

    dd <- getwd()
    # knitr::opts_knit$set(root.dir=paste0(dd,'/../../')) 
    # base.dir <- "base.dir/"
    # base.url <- "base.url/"
    
    fig.path <- paste0(dd, '/figure/')     
    cache.path <- paste0(dd, '/cache/')

    knitr::opts_chunk$set(
        comment = '',
        cache = FALSE,
        tidy = FALSE,
        cache.path = cache.path,
        fig.path = fig.path,
        fig.width = 7,
        fig.height = 7,
        fig.align = "center",
        #eval.after= "fig.cap",
        # dev.args = list(family = "Palatino"),
        warning = FALSE,
        error = FALSE,
        message = FALSE,
        echo = FALSE
    )
    
    # set knitr parameters
    knitr::opts_knit$set(global.par = TRUE, root.dir=normalizePath('../'))
    # knitr::opts_knit$set(base.dir = base.dir, base.url = base.url, global.par = TRUE, root.dir=normalizePath('../'))

}
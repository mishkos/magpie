# |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de

# --------------------------------------------------------------
# description: Creates an validation pdf out of several runs
# comparison script: TRUE
# ---------------------------------------------------------------

library(mip)
library(magpie4)

############################# BASIC CONFIGURATION #############################
outputdir <- lucode2::path("output/",list.dirs("output/", full.names = FALSE, recursive = FALSE))
#Define arguments that can be read from command line
lucode2::readArgs("outputdir")
###############################################################################

x <- NULL
i <- 1

for(outputdir in outputdirs) {
  config <- path(outputdir,"config.Rdata")
  if(file.exists(config)) {
    load(config)
    title <- cfg$title
  } else {
    title <- paste0("run",i)
  }
 
 gdx <- paste0(outputdir, "/fulldata.gdx")
  if(!is.null(x)) {
    scenarios <- getNames(x,dim=2)
    if(title %in% scenarios) {
      title <- tail(make.unique(c(scenarios,title),sep=""),n=1)
    }
  }

  tmp <- reportPriceFoodIndex(gdx, baseyear="y2020")
  x <- mbind(x,tmp)
  i <- i+1
}

write.magpie(x, "priceFoodIndex.csv")

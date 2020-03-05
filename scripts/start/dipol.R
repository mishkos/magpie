# |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
# |  authors, and contributors see AUTHORS file
# |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
# |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
# |  Contact: magpie@pik-potsdam.de


############################################################
#### Script for the generation of COACCH simulations ####
############################################################

library(lucode)
source("scripts/start_functions.R")
source("scripts/performance_test.R")
source("config/default.cfg")

#set defaults
codeCheck <- FALSE

buildInputVector <- function(regionmapping   = "H12",
                             project_name    = "isimip_rcp",
                             climatescen_name= "rcp2p6",
                             co2             = "co2",
                             climate_model   = "IPSL_CM5A_LR",
                             resolution      = "c200",
                             archive_rev     = "38",
                             madrat_rev      = "4.56",
                             validation_rev  = "4.56",
			                       calibration     = NULL,
                             additional_data = "additional_data_rev3.73.tgz") {
  mappings <- c(H11       = "8a828c6ed5004e77d1ba2025e8ea2261",
                H12       = "690d3718e151be1b450b394c1064b1c5",
				        coacch    = "c2a48c5eae535d4b8fe9c953d9986f1b",
                mag       = "c30c1c580039c2b300d86cc46ff4036a",
		            agmip     = "c77f075908c3bc29bdbe1976165eccaf",
		            sim4nexus = "25dd7264e8e145385b3bd0b89ec5f3fc",
		            inms      = "44f1e181a3da765729f2f1bfc926425a",
                capri     = "e7e72fddc44cc3d546af7b038c651f51")
  archive_name <- paste(project_name,climate_model,climatescen_name,co2,sep="-")
  archive      <- paste0(archive_name, "_rev", archive_rev, "_", resolution, "_", mappings[regionmapping], ".tgz")
  madrat       <- paste0("rev", madrat_rev,"_", mappings[regionmapping], "_magpie", ".tgz")
  validation   <- paste0("rev", validation_rev,"_", mappings[regionmapping], "_validation", ".tgz")
  return(c(archive,madrat,validation,calibration,additional_data))
}

### DIPOL runs ###
#general settings

cfg$recalibrate <- "ifneeded"
cfg$force_download <- FALSE

cfg$gms$s80_maxiter <- 5
cfg$output <- c("rds_report")
cfg$results_folder <- paste0("output/dipol/:title::date:")

# cfg$gms$c_timesteps <- "coup2100"
cfg$gms$c_timesteps <- 1

cfg$gms$c50_scen_neff <- "neff85_85_starty2010"


# SSP2
cfg$title <- "ssp2_test"
cfg       <- setScenario(cfg,c("SSP2","NPI"))
cfg$input <- buildInputVector()
start_run(cfg,codeCheck=FALSE)
calib <- magpie4::submitCalibration(name = "calibration_dipol")

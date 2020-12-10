# |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
# |  authors, and contributors see AUTHORS file
# |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
# |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
# |  Contact: magpie@pik-potsdam.de


############################################################
#### Script for a quick compilation  ####
############################################################
library(lucode2)
library(gms)

source("scripts/start_functions.R")
# source("scripts/performance_test.R")
source("config/default.cfg")


#set defaults
codeCheck <- FALSE

buildInputVector <- function(regionmapping   = "H12",
                             project_name    = "isimip_rcp",
                             climatescen_name= "rcp2p6",
                             co2             = "co2",
                             climate_model   = "IPSL_CM5A_LR",
                             resolution      = "c200",
                             archive_rev     = "48",
                             madrat_rev      = "4.52",
                             validation_rev  = "4.52",
			                       calibration     = "calibration_calibration_dipol_16Mar20.tgz",
                             additional_data = "additional_data_rev3.85.tgz",
                             patch_inputdata = "dipol_inputdata.tgz") {
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
  madrat       <- paste0("rev", madrat_rev,"_", tolower(regionmapping), "_magpie", ".tgz")
  validation   <- paste0("rev", validation_rev,"_", tolower(regionmapping), "_validation", ".tgz")
  return(c(archive,madrat,validation,calibration,additional_data,patch_inputdata))
}

cfg$recalibrate <- FALSE
cfg$force_download <- FALSE

cfg$gms$s80_maxiter <- 5
cfg$output <- NULL
cfg$results_folder <- paste0("output/dipol/:title::date:")

cfg$gms$c_timesteps <- 1


cfg       <- setScenario(cfg,c("SSP2","NPI","DIPOL_1"))
cfg$input <- buildInputVector()
# 42_water_demand
# cfg$gms$water_demand<- "agr_sector_reg_mar20"
# cfg$gms$s21_seasonal_eu <- 1


# 50_nr_soil_budget
# cfg$gms$c50_scen_neff <- "neff60_eur85_starty2020"
# cfg$gms$c50_scen_neff_pasture <- "constant_eur85"


# cfg$gms$c55_scen_conf <- "ssp2"

# Downlaod
if(cfg$force_download){
  download_and_update(cfg)
}

# Compilation
cfg$title <- "compilation"

# configure main model gms file (cfg$model) based on settings of cfg file
manipulateConfig(cfg$model, cfg$gms)

# configure input.gms in all modules based on settings of cfg file
l1 <- path("modules", list.dirs("modules/", full.names = FALSE,
                                          recursive = FALSE))
for(l in l1) {
  l2 <- path(l, list.dirs(l, full.names = FALSE, recursive = FALSE))
  for(ll in l2) {
    if(file.exists(path(ll, "input.gms"))) {
      manipulateConfig(path(ll, "input.gms"), cfg$gms)
    }
  }
}


system("gams main.gms action=c")

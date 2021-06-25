# |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
# |  authors, and contributors see AUTHORS file
# |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
# |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
# |  Contact: magpie@pik-potsdam.de


############################################################
#### Script for the generation of COACCH simulations ####
############################################################

library(lucode2)
library(gms)
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
                             archive_rev     = "52",
                             madrat_rev      = "4.58",
                             validation_rev  = "4.58",
			                       calibration     = "calibration_H12_c200_23Feb21.tgz",
                             additional_data = "additional_data_rev3.99.tgz",
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

### DIPOL runs ###
#general settings

# EU28 <- "AUT, BEL, BGR, HRV, CYP, CZE, DNK, EST, FIN, FRA, DEU, GRC, HUN, IRL, ITA, LVA, LTU, LUX, MLT, NLD, POL, PRT, ROU, SVK, SVN, ESP, SWE, GBR"

cfg$recalibrate <- FALSE
cfg$force_download <- TRUE

# cfg$input  <- buildInputVector()

cfg$gms$s80_maxiter <- 5
cfg$output <- c("rds_report")
cfg$results_folder <- paste0("output/dipol/:title::date:")
title_flag <- ""

cfg$gms$c_timesteps <- "coup2100"
cfg$gms$c_timesteps <- "5year2050"
# cfg$gms$c_timesteps <- 1

# SSP2
cfg$title <- "ssp2_default_forestryEndo"
cfg       <- setScenario(cfg,c("SSP2","NDC","ForestryEndo"))
start_run(cfg,codeCheck=FALSE)
# calib     <- magpie4::submitCalibration(name = "calibration_dipol")

# Irrigation water efficiency
cfg$title <- "irrig_eff"
cfg       <- setScenario(cfg,c("SSP2","NDC","ForestryEndo"))
cfg$gms$water_demand <- "agr_sector_reg_mar20"
start_run(cfg,codeCheck=FALSE)
cfg$gms$water_demand <- "agr_sector_aug13"

# Nitrogen eff cropland
cfg$title <- "nitro_eff_cpl"
cfg       <- setScenario(cfg,c("SSP2","NDC","ForestryEndo"))
cfg$gms$c50_scen_neff <- "neff60_eur85_starty2020"
start_run(cfg,codeCheck=FALSE)
cfg$gms$c50_scen_neff <- "neff60_60_starty2010"

# Nitrogen eff cropland and pasture 
cfg$title <- "nitro_eff_cpl_pas"
cfg       <- setScenario(cfg,c("SSP2","NDC","ForestryEndo"))
cfg$gms$c50_scen_neff <- "neff60_eur85_starty2020"
cfg$gms$c50_scen_neff_pasture <- "constant_eur85"
start_run(cfg,codeCheck=FALSE)
cfg$gms$c50_scen_neff <- "neff60_60_starty2010"
cfg$gms$c50_scen_neff_pasture <- "constant"

# Methan pille
cfg$title <- "methan"
cfg       <- setScenario(cfg,c("SSP2","NDC","ForestryEndo"))
cfg$gms$c55_scen_conf <- "dipol"
start_run(cfg,codeCheck=FALSE)
cfg$gms$c55_scen_conf <- "ssp2"

# Diets
cfg$title <- "diets"
cfg       <- setScenario(cfg,c("SSP2","NDC","ForestryEndo"))
cfg$gms$s15_exo_waste <- 1
cfg$gms$s15_waste_scen <- 1.2
cfg$gms$s15_exo_diet <- 1
cfg$gms$c15_kcal_scen <- "healthy_BMI"
cfg$gms$c15_EAT_scen <- "FLX"
cfg$gms$scen_countries15 <- "AUT,BEL,BGR,HRV,CYP,CZE,DNK,EST,FIN,FRA,DEU,GRC,HUN,IRL,ITA,LVA,LTU,LUX,MLT,NLD,POL,PRT,ROU,SVK,SVN,ESP,SWE,GBR"
start_run(cfg,codeCheck=FALSE)




# Test
# cfg$title <- "ssp2_marginEU"
# cfg       <- setScenario(cfg,c("SSP2","NDC"))
# cfg$gms$s21_margin_eu <- 1
# start_run(cfg,codeCheck=FALSE)

# cfg$title <- "ssp2_seasonalEU"
# cfg       <- setScenario(cfg,c("SSP2","NDC"))
# cfg$gms$s21_seasonal_eu <- 1
# start_run(cfg,codeCheck=FALSE)

# # Peatland Test
# cfg$title                     <- "peatland_eu"
# cfg                           <- setScenario(cfg,c("SSP2","NDC"))
# cfg$gms$s56_peatland_policy   <- 1
# cfg$gms$peatland_policy_countries56  <- "ALA,AUT,BEL,BGR,HRV,CYP,CZE,DNK,EST,FIN,FRA,FRO,DEU,GRC,HUN,IRL,ITA,LVA,LTU,LUX,MLT,NLD,POL,PRT,ROU,SVK,SVN,ESP,SWE,GBR,GGY,GIB,IMN,JEY,"
# cfg$gms$peatland              <- "on"
# cfg$gms$s58_rewetting_switch  <- Inf
# start_run(cfg,codeCheck=FALSE)

# # DIPOL_1
# cfg$title       <- paste0("DIPOL_1", title_flag)
# cfg             <- setScenario(cfg,c("SSP2","NDC","DIPOL_1","ForestryEndo"))
# cfg$recalibrate <- FALSE
# start_run(cfg,codeCheck=FALSE)

# cfg$force_download <- FALSE

# # DIPOL_2
# cfg$title       <- paste0("DIPOL_2", title_flag)
# cfg             <- setScenario(cfg,c("SSP2","NDC","DIPOL_2"))
# cfg$recalibrate <- FALSE
# start_run(cfg,codeCheck=FALSE)

# # DIPOL_3
# cfg$title       <- paste0("DIPOL_3", title_flag)
# cfg             <- setScenario(cfg,c("SSP2","NDC","DIPOL_3"))
# cfg$recalibrate <- FALSE
# start_run(cfg,codeCheck=FALSE)

# # DIPOL_4
# cfg$title       <- paste0("DIPOL_4", title_flag)
# cfg             <- setScenario(cfg,c("SSP2","NDC","DIPOL_4"))
# # file.copy("/p/tmp/merfort/DIPOL/coupled/magpie_release_canditate/modules/56_ghg_policy/input/f56_pollutant_prices_coupling.cs3","modules/56_ghg_policy/input/f56_pollutant_prices_coupling.cs3")
# # cfg$gms$c56_pollutant_prices <- "coupling"
# cfg$recalibrate <- FALSE
# start_run(cfg,codeCheck=FALSE)

# # DIPOL_5
# cfg$title       <- paste0("DIPOL_5", title_flag)
# cfg             <- setScenario(cfg,c("SSP2","NDC","DIPOL_5"))
# cfg$recalibrate <- FALSE
# start_run(cfg,codeCheck=FALSE)

# # DIPOL_6
# cfg$title       <- paste0("DIPOL_6", title_flag)
# cfg             <- setScenario(cfg,c("SSP2","NDC","DIPOL_6"))
# cfg$recalibrate <- FALSE
# start_run(cfg,codeCheck=FALSE)

# (C) 2008-2017 Potsdam Institute for Climate Impact Research (PIK),
# authors, and contributors see AUTHORS file
# This file is part of MAgPIE and licensed under GNU AGPL Version 3
# or later. See LICENSE file or go to http://www.gnu.org/licenses/
# Contact: magpie@pik-potsdam.de


######################################
#### Script to start a MAgPIE run ####
######################################

library(lucode)
library(magclass)
library(magpie4)

source("config/default.cfg")
source("scripts/start_functions.R")

buildInputVector <- function(regionmapping   = "H12",
                             project_name    = "isimip_rcp",
                             climatescen_name= "rcp2p6",
                             co2             = "co2",
                             climate_model   = "IPSL_CM5A_LR",
                             resolution      = "c200",
														 addings         = "_AUS2",
														 archive_rev     = "38",
                             madrat_rev      = "4.18",
                             validation_rev  = "4.18",
                             calibration     = NULL,
                             additional_data = "additional_data_rev3.66.tgz") {

  mappings <- c(AUS28="063158371ecc1bc001898e5c2db545cd",
                AUS19="3e31a478c2e9cbfdcebdd752e1bd7c0d",
								AUS18="777e58b4a1a8afb9bfc1197a9ca763d8",
                EUR6="f69106b7beabb6dad84d69d7ad8aeb21")
  archive_name=paste(project_name,climate_model,climatescen_name,co2,sep="-")
  archive <- paste0(archive_name, "_rev", archive_rev, "_", resolution, addings, "_", mappings[regionmapping], ".tgz")
  madrat  <- paste0("rev", madrat_rev,"_", mappings[regionmapping], "_magpie", ".tgz")
  validation  <- paste0("rev", validation_rev,"_", mappings[regionmapping], "_validation", ".tgz")

  return(c(archive,madrat,validation,calibration,additional_data))
}

# H12
# regdef <- "_8a828c6ed5004e77d1ba2025e8ea2261"
# H11
# regdef <- "_690d3718e151be1b450b394c1064b1c5"
# EU6
# regdef <- "_f69106b7beabb6dad84d69d7ad8aeb21"

# clusterw <- ""
# clusterw <- "_DEU10_EUC3_EUN3_EUS15_EUW2"

# cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_c200",clusterw,regdef,".tgz")
# cfg$input[2] <- paste0("rev4.18",regdef,"_magpie.tgz")
# cfg$input[3] <- paste0("rev4.18",regdef,"_validation.tgz")
# cfg$input[4] <- "additional_data_rev3.66.tgz"
# # cfg$input[5] <- "calibration_H11_23Oct18.tgz"
# # cfg$input[5] <- "calibration_H12_NPI_06Nov18.tgz"
# cfg$input[5] <- "calibration_EU6_13Mar19.tgz"

# ssps <- c("SSP1","SSP2","SSP3","SSP4","SSP5")
ssps <- c("SSP2")

cfg$force_download <- "ifneeded"
cfg$recalibrate <- FALSE
cfg$recalc_npi_ndc <- "ifneeded"

cfg$gms$s80_maxiter <- 5
cfg$output <- c("report")

# cfg$recalibrate <- FALSE
cfg$gms$c_timesteps <- 3

cfg$gms$trade <- "superreg_nov19"

for(ssp in ssps){
  cfg$results_folder <- paste0("output/",ssp,"/:title::date:")

  # cfg$title <- paste0(ssp,"_BASE_npi")
  # cfg <- setScenario(cfg,c(ssp,"BASE"))
  # start_run(cfg,codeCheck=FALSE)

  cfg$title <- paste0(ssp,"_NPI_EU6")
  cfg$input <- buildInputVector(regionmapping = "EUR6", addings="_DEU10_EUC3_EUN3_EUS15_EUW2")
  cfg <- setScenario(cfg,c(ssp,"NPI"))
  start_run(cfg,codeCheck=FALSE)
  # submitCalibration(name = "calibration_EUR6_jul2019")

  # cfg$title <- paste0(ssp,"_NDC")
  # cfg <- setScenario(cfg,c(ssp,"NDC"))
  # start_run(cfg,codeCheck=FALSE)

  # cfg$recalc_npi_ndc <- FALSE

  # ### Runs with CC
  #
  # #CC
  # cfg$gms$c14_yields_scenario  <- "cc"
  # cfg$gms$c42_watdem_scenario  <- "cc"
  # cfg$gms$c43_watavail_scenario  <- "cc"
  # cfg$gms$c52_carbon_scenario  <- "cc"
  #
  # res <- "c200"
  #
  # cfg$title <- paste(ssp,"Ref_RCP60_co2_BASE",res,sep="_")
  # cfg <- setScenario(cfg,c(ssp,"BASE"))
  # cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev34_",res,regdef,".tgz")
  # start_run(cfg,codeCheck=FALSE)
  #
  # cfg$title <- paste(ssp,"Ref_RCP60_co2_NDC",res,sep="_")
  # cfg <- setScenario(cfg,c(ssp,"NDC"))
  # cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev34_",res,regdef,".tgz")
  # start_run(cfg,codeCheck=FALSE)
}


#-------------------------------------------------------------------------------

# full ad ndc policy -----------------------------------------------------------

# read from policy_definitions_all_ad.csv file
# MANUAL SETUP

# cfg$title <- "SSP2_NDC_fullAD"
# cfg <- setScenario(cfg,c("SSP2","NDC"))
# cfg$recalc_npi_ndc <- TRUE
# start_run(cfg,codeCheck=FALSE)

# cfg$title <- "SSP2_NDC_fullAD_fullAOLC"
# cfg <- setScenario(cfg,c("SSP2","NDC"))
# cfg$recalc_npi_ndc <- TRUE
# start_run(cfg,codeCheck=FALSE)


#
#
# ## rcp26
#
# cfg$title <- paste("SSP2_Ref_RCP26_co2_BASE",res,sep="_")
# cfg <- setScenario(cfg,c("SSP2","BASE"))
# cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
# cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP2_Ref_RCP26_co2_NPI",res,sep="_")
# cfg <- setScenario(cfg,c("SSP2","NPI"))
# cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
# cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP2_Ref_RCP26_co2_NDC",res,sep="_")
# cfg <- setScenario(cfg,c("SSP2","NDC"))
# cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
# cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP2_Ref_RCP26_co2_NPI_exotc_base",res,sep="_")
# cfg <- setScenario(cfg,c("SSP2","NPI"))
# cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
# cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
# cfg$gms$tc <- "exo_oct18"
# cfg$gms$c13_tau_scen <- "base"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP2_Ref_RCP26_co2_NDC_exotc_base",res,sep="_")
# cfg <- setScenario(cfg,c("SSP2","NDC"))
# cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
# cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
# cfg$gms$tc <- "exo_oct18"
# cfg$gms$c13_tau_scen <- "base"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- paste("SSP2_Ref_RCP26_co2_NDC_exotc_npi",res,sep="_")
# cfg <- setScenario(cfg,c("SSP2","NDC"))
# cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
# cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
# cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
# cfg$gms$tc <- "exo_oct18"
# cfg$gms$c13_tau_scen <- "npi"
# start_run(cfg,codeCheck=FALSE)
#
# cfg$gms$tc <- "endo_jun18"

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

# H12
regdef <- "_8a828c6ed5004e77d1ba2025e8ea2261"
# H11
# regdef <- "_690d3718e151be1b450b394c1064b1c5"

cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_c200",regdef,".tgz")
cfg$input[2] <- paste0("rev4.14",regdef,"_magpie.tgz")
cfg$input[3] <- paste0("rev4.14",regdef,"_validation.tgz")
cfg$input[4] <- "additional_data_rev3.59.tgz"
# cfg$input[5] <- "calibration_H11_23Oct18.tgz"
cfg$input[5] <- "calibration_H12_NPI_06Nov18.tgz"

cfg$results_folder <- "output/h12/:title::date:"

cfg$gms$s80_maxiter <- 3
cfg$output <- c("report")

# cfg$gms$yields <- "biocorrect"

cfg$recalibrate <- FALSE

# cfg$title <- "SSP2_BASE"
# cfg <- setScenario(cfg,c("SSP2","BASE"))
# start_run(cfg,codeCheck=FALSE)
#
# cfg$title <- "SSP2_NPI"
# cfg <- setScenario(cfg,c("SSP2","NPI"))
# start_run(cfg,codeCheck=FALSE)
# # submitCalibration("H12_NPI")
#
# cfg$title <- "SSP2_NDC"
# cfg <- setScenario(cfg,c("SSP2","NDC"))
# start_run(cfg,codeCheck=FALSE)

### Runs with exo TC

cfg$title <- "NPI_exotc_base"
cfg <- setScenario(cfg,c("SSP2","NPI"))
cfg$gms$tc <- "exo_oct18"
cfg$gms$c13_tau_scen <- "base"
start_run(cfg,codeCheck=FALSE)

cfg$title <- "NDC_exotc_base"
cfg <- setScenario(cfg,c("SSP2","NDC"))
cfg$gms$tc <- "exo_oct18"
cfg$gms$c13_tau_scen <- "base"
start_run(cfg,codeCheck=FALSE)

cfg$title <- "NDC_exotc_npi"
cfg <- setScenario(cfg,c("SSP2","NDC"))
cfg$gms$tc <- "exo_oct18"
cfg$gms$c13_tau_scen <- "npi"
start_run(cfg,codeCheck=FALSE)


cfg$gms$tc <- "endo_jun18"


### Runs with CC

#CC
cfg$gms$c14_yields_scenario  <- "cc"
cfg$gms$c42_watdem_scenario  <- "cc"
cfg$gms$c43_watavail_scenario  <- "cc"
cfg$gms$c52_carbon_scenario  <- "cc"

res <- "c200"

##SSP2
cfg$title <- paste("SSP2_Ref_RCP60_co2_BASE",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","BASE"))
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev34_",res,regdef,".tgz")
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_Ref_RCP60_co2_NPI",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","NPI"))
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev34_",res,regdef,".tgz")
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_Ref_RCP60_co2_NDC",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","NDC"))
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp6p0-co2_rev34_",res,regdef,".tgz")
start_run(cfg,codeCheck=FALSE)

## rcp26

cfg$title <- paste("SSP2_Ref_RCP26_co2_BASE",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","BASE"))
cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_Ref_RCP26_co2_NPI",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","NPI"))
cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_Ref_RCP26_co2_NDC",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","NDC"))
cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_Ref_RCP26_co2_NPI_exotc_base",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","NPI"))
cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
cfg$gms$tc <- "exo_oct18"
cfg$gms$c13_tau_scen <- "base"
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_Ref_RCP26_co2_NDC_exotc_base",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","NDC"))
cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
cfg$gms$tc <- "exo_oct18"
cfg$gms$c13_tau_scen <- "base"
start_run(cfg,codeCheck=FALSE)

cfg$title <- paste("SSP2_Ref_RCP26_co2_NDC_exotc_npi",res,sep="_")
cfg <- setScenario(cfg,c("SSP2","NDC"))
cfg$gms$c56_pollutant_prices <- "SSP2-Ref-SPA0-V15-REMIND-MAGPIE"
cfg$gms$c60_2ndgen_biodem <- "SSP2-Ref-SPA0"
cfg$input[1] <- paste0("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev34_",res,regdef,".tgz")
cfg$gms$tc <- "exo_oct18"
cfg$gms$c13_tau_scen <- "npi"
start_run(cfg,codeCheck=FALSE)

cfg$gms$tc <- "endo_jun18"

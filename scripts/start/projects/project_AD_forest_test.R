# |  (C) 2008-2025 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de

# ----------------------------------------------------------------------------
# description: Before/after test of the NPI/NDC avoided deforestation bound fix (FSEC regions)
# ----------------------------------------------------------------------------
# Runs NPI and NDC with the FSEC regional definition, once with the policy files computed by the
# current code in scripts/npi_ndc/start_npi_ndc.R ("after") and once with the version before the
# fix ("before", taken from git). Only the NPI/NDC policy files differ between the two versions;
# the model code is identical.
#
# The policy file is written into modules/*/input and inlined into full.gms when a run starts,
# so runs started one after another keep their own policy file. At the end the files are
# regenerated with the current code, so the working copy is not left with the "before" version.

library(gms)
library(magclass)

source("scripts/start_functions.R")

# commit before the fix (upstream develop at branch creation of f_ad_forest)
beforeCommit <- "90d630dea"

fsecInput <- c(regional   = "rev4.136_FSEC_magpie.tgz",
               cellular   = "rev4.136_FSEC_1b5c3817_cellularmagpie_c200_MRI-ESM2-0-ssp245_lpjml-8e6c5eb1.tgz",
               validation = "rev4.136_FSEC_92e02314_validation.tgz",
               additional = "additional_data_rev4.74.tgz")
# no calibration archive: the default one is for H12 regions, land conversion costs are
# recalibrated for the FSEC regions in the first run (cfg$recalibrate_landconversion_cost = "ifneeded")

# policy calculation of the "before" version
beforeScript <- file.path(tempdir(), "start_npi_ndc_before.R")
writeLines(system(paste0("git show ", beforeCommit, ":scripts/npi_ndc/start_npi_ndc.R"), intern = TRUE),
           beforeScript)

# (re)compute the NPI/NDC policy files with the given version of start_npi_ndc.R,
# using the same call as scripts/start_functions.R
recalcPolicies <- function(script, cfg) {
  env <- new.env()
  sys.source(script, envir = env)
  potForestFile <- if (isTRUE(cfg$gms$c35_pot_forest_correction == "off")) {
    "../../modules/35_natveg/input/pot_forest_area_uncorrected_0.5.mz"
  } else "../../modules/35_natveg/input/pot_forest_area_0.5.mz"
  wd <- setwd("scripts/npi_ndc")
  on.exit(setwd(wd))
  env$calc_NPI_NDC(policyregions = cfg$policyregions, potential_forest_file = potForestFile)
}

setupCfg <- function(pol, version) {
  source("config/default.cfg", local = TRUE)
  cfg$input <- fsecInput
  cfg$force_download <- FALSE
  cfg$gms$c35_ad_policy   <- pol
  cfg$gms$c35_aolc_policy <- pol
  cfg$gms$c32_aff_policy  <- pol
  cfg$title <- paste("ADtest", "FSEC", pol, version, sep = "_")
  return(cfg)
}

# "after" runs first: the first start_run downloads the FSEC inputs and recalibrates
for (pol in c("npi", "ndc")) {
  cfg <- setupCfg(pol, "after")
  cfg$recalc_npi_ndc <- TRUE
  start_run(cfg, codeCheck = FALSE)
}

# "before" runs: policy files from the old code, no recalculation inside start_run
recalcPolicies(beforeScript, cfg)
for (pol in c("npi", "ndc")) {
  cfg <- setupCfg(pol, "before")
  cfg$recalc_npi_ndc <- FALSE
  start_run(cfg, codeCheck = FALSE)
}

# restore policy files of the current code in the working copy
recalcPolicies("scripts/npi_ndc/start_npi_ndc.R", cfg)

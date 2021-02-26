*** |  (C) 2008-2021 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

parameters
p73_timber_demand_gdp_pop(t_all,i,kforestry)                                Timber demand based on lauri et al 2019 (mio. m3 per yr)
p73_forestry_demand_prod_specific(t_all,iso,total_wood_products)            End product specific timber demand (mio. m3 per yr)
pm_demand_forestry_future(i,kforestry)                                      Future forestry demand in current time step (tDM per yr)
pm_demand_ext(t_ext,i,kforestry)                                            Extended demand for timber beyound simulation (mio. tDM per yr)
p73_demand_calib(t_all,i,kforestry)                                         Additive calibration factor for timber demand
;

positive variables
vm_cost_timber(i)				                                                    Actual cost of harvesting timber from forests (mio. USD per yr)
v73_prod_heaven_timber(j,kforestry)                                         Production of woody biomass from heaven (mio. tDM per yr)
v73_prod_residues(j)                                                        Production of residues from industrial roundwood harvest(mio. tDM per yr)
;

equations
q73_cost_timber(i)												                                  Actual cost of harvesting timber from forests (mio. USD per yr)
q73_prod_wood(j)                                                            Production of industrial roundwood (mio. tDM per yr)
q73_prod_woodfuel(j)                                                        Production of wood fuel (mio. tDM per yr)
q73_prod_residues(j)                                                        Production of residues from industrial roundwood harvest(mio. tDM per yr)
q73_prod_forestry_upper(i,kforestry)										Upper bound on production from plantations (mio. tDM per yr)
;


*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_cost_timber(t,i,type)                     Actual cost of harvesting timber from forests (mio. USD per yr)
 ov73_prod_heaven_timber(t,j,kforestry,type)  Production of woody biomass from heaven (mio. tDM per yr)
 ov73_prod_residues(t,j,type)                 Production of residues from industrial roundwood harvest(mio. tDM per yr)
 oq73_cost_timber(t,i,type)                   Actual cost of harvesting timber from forests (mio. USD per yr)
 oq73_prod_wood(t,j,type)                     Production of industrial roundwood (mio. tDM per yr)
 oq73_prod_woodfuel(t,j,type)                 Production of wood fuel (mio. tDM per yr)
 oq73_prod_residues(t,j,type)                 Production of residues from industrial roundwood harvest(mio. tDM per yr)
 oq73_prod_forestry_upper(t,i,kforestry,type) Upper bound on production from plantations (mio. tDM per yr)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################

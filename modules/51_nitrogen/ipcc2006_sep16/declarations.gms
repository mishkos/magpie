*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

equations
 q51_emissions_inorg_fert(i,n_pollutants_direct) estimates various emission types X from inorganic fertilizer before technical mitigation (Mt X-N)
 q51_emissions_man_crop(i,n_pollutants_direct)  estimates various emission types X from manure on cropland before technical mitigation   (Mt X-N)
 q51_emissions_resid(i,n_pollutants_direct)      estimates various emission types X from residues before technical mitigation            (Mt X-N)
 q51_emissions_som(i,n_pollutants_direct)        estimates various emission types X from soil organic matter loss before technical mitigation (Mt X-N)
 q51_emissionbal_man_past(i,n_pollutants_direct)   estimates various emission types X from manure on pasture land before technical mitigation (Mt X-N)
 q51_emissionbal_awms(i,n_pollutants_direct)       estimates various emission types X from animal waste management systems before technical mitigation  (Mt X-N)
 q51_emissions_indirect_n2o(i,emis_source_n51) estimates various emission types X from volatilisation and leaching  (Mt X-N)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 oq51_emissions_inorg_fert(t,i,n_pollutants_direct,type) estimates various emission types X from inorganic fertilizer before technical mitigation (Mt X-N)
 oq51_emissions_man_crop(t,i,n_pollutants_direct,type)   estimates various emission types X from manure on cropland before technical mitigation   (Mt X-N)
 oq51_emissions_resid(t,i,n_pollutants_direct,type)      estimates various emission types X from residues before technical mitigation            (Mt X-N)
 oq51_emissions_som(t,i,n_pollutants_direct,type)        estimates various emission types X from soil organic matter loss before technical mitigation (Mt X-N)
 oq51_emissionbal_man_past(t,i,n_pollutants_direct,type) estimates various emission types X from manure on pasture land before technical mitigation (Mt X-N)
 oq51_emissionbal_awms(t,i,n_pollutants_direct,type)     estimates various emission types X from animal waste management systems before technical mitigation  (Mt X-N)
 oq51_emissions_indirect_n2o(t,i,emis_source_n51,type)   estimates various emission types X from volatilisation and leaching  (Mt X-N)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################

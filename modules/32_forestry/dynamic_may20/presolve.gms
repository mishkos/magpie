*** |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

s32_yeardiff = m_yeardiff_forestry(t);

** Declare new set to distribute newly established plantations evenly for longer
** than 5 year time steps. We then overwrite this with yes for ac_additional
** elements which are lower than difference between years.
ac_additional(ac) = no;
ac_additional(ac) = yes$(ord(ac) <= (s32_yeardiff/5));

** Start ndc **
* Limit demand for prescribed NPI/NDC afforestation in `p32_aff_pol` if not enough suitable area (`p32_aff_pot`) for afforestation is available.
   p32_aff_pot(t,j) = (vm_land.l(j,"crop") - vm_land.lo(j,"crop")) + (vm_land.l(j,"past") - vm_land.lo(j,"past"));
*correct ndc forest stock based on p32_aff_pot
  if((ord(t) > 1),
      p32_aff_pol(t,j)$(p32_aff_pol(t,j) - p32_aff_pol(t-1,j) > p32_aff_pot(t,j)) = p32_aff_pol(t-1,j) + p32_aff_pot(t,j);
    );
*calc ndc afforestation per time step based on forest stock changes
  p32_aff_pol_timestep("y1995",j) = 0;
  p32_aff_pol_timestep(t,j)$(ord(t)>1) = p32_aff_pol(t,j) - p32_aff_pol(t-1,j);

if(m_year(t) <= sm_fix_SSP2,
 p32_max_aff_area = Inf;
else
 p32_max_aff_area = s32_max_aff_area;
);
** END ndc **

*' @code
*' Certain areas (e.g. the boreal zone) are excluded from endogenous afforestation.
** DON'T USE TYPE32 SET HERE
if(m_year(t) <= sm_fix_SSP2,
	v32_land.fx(j,"aff","ac0") = 0;
else
	v32_land.lo(j,"aff","ac0") = 0;
	v32_land.up(j,"aff","ac0") = f32_aff_mask(j) * sum(land, pcm_land(j,land));
);
*' No afforestation is allowed if carbon density <= 20 tc/ha
v32_land.fx(j,"aff","ac0")$(fm_carbon_density(t,j,"forestry","vegc") <= 20) = 0;

*' Afforestation switch:
*' 0 = Use natveg carbon densities for afforestation,
*' 1 = Use plantation carbon densities for afforestation.
if(s32_aff_plantation = 0,
 p32_carbon_density_ac(t,j,"aff",ac,ag_pools) = pm_carbon_density_ac(t,j,ac,ag_pools);
elseif s32_aff_plantation = 1,
 p32_carbon_density_ac(t,j,"aff",ac,ag_pools) = pm_carbon_density_ac_forestry(t,j,ac,ag_pools);
);
*' Timber plantations switch:
*' 0 = Use natveg carbon densities for timber plantations,
*' 1 = Use plantation carbon densities for timber plantations.
if(s32_timber_plantation = 0,
 p32_carbon_density_ac(t,j,"plant",ac,ag_pools) = pm_carbon_density_ac(t,j,ac,ag_pools);
elseif s32_timber_plantation = 1,
 p32_carbon_density_ac(t,j,"plant",ac,ag_pools) = pm_carbon_density_ac_forestry(t,j,ac,ag_pools);
);
*' NDC carbon densities are natveg carbon densities.
p32_carbon_density_ac(t,j,"ndc",ac,ag_pools) = pm_carbon_density_ac(t,j,ac,ag_pools);

*' CDR from afforestation for each age-class, depending on planning horizon.
p32_cdr_ac(t,j,ac)$(ord(ac) > 1 AND (ord(ac)-1) <= s32_planing_horizon/5)
= p32_carbon_density_ac(t,j,"aff",ac,"vegc") - p32_carbon_density_ac(t,j,"aff",ac-1,"vegc");

*' CDR from timber plantations for each unharvested age-class.
p32_cdr_ac_plant(t,j,ac_sub)$(ord(ac_sub) > 1 AND protect32(t,j,ac_sub))
= (p32_carbon_density_ac(t,j,"plant",ac_sub,"vegc") - p32_carbon_density_ac(t,j,"plant",ac_sub-1,"vegc")) * s32_plant_carbon_foresight;

*' Regrowth of natural vegetation (natural succession) is modelled by shifting
*' age-classes according to time step length. For first year of simulation, the
*' shift is just 1. Division by 5 happends because the age-classes exist in 5 year steps
s32_shift = s32_yeardiff/5;
*' @stop

*' Shifting of age-calsses in land.
*` @code
if((ord(t)>1),
* Example: ac10 in t = ac5 (ac10-1) in t-1 for a 5 yr time step (s32_shift = 1)
p32_land(t,j,type32,ac)$(ord(ac) > s32_shift) = p32_land(t-1,j,type32,ac-s32_shift);
* Account for cases at the end of the age class set (s32_shift > 1) which are not shifted by the above calculation
p32_land(t,j,type32,"acx") = p32_land(t,j,type32,"acx") + sum(ac$(ord(ac) > card(ac)-s32_shift), p32_land(t-1,j,type32,ac));
);
*should not be necessary. Just to be on the save side
p32_land(t,j,type32,"ac0") = 0;
*' @stop

** Calculate v32_land.l
v32_land.l(j,type32,ac) = p32_land(t,j,type32,ac);
pc32_land(j,type32,ac) = p32_land(t,j,type32,ac);
p32_land_before(t,j,type32,ac) = p32_land(t,j,type32,ac);
vm_land.l(j,"forestry") = sum((type32,ac), p32_land(t,j,type32,ac));
pcm_land(j,"forestry") = sum((type32,ac), p32_land(t,j,type32,ac));

** Release bounds for ALL Age classes before we make harvest "indication" decisions
v32_land.lo(j,"plant",ac) = 0;
v32_land.up(j,"plant",ac) = Inf;

** Fix land with rotation length
v32_land.fx(j,"plant",ac_sub)$protect32(t,j,ac_sub) = pc32_land(j,"plant",ac_sub);

** Set upper bound for plantations after rotation length
v32_land.up(j,"plant",ac_sub)$harvest32(t,j,ac_sub) = pc32_land(j,"plant",ac_sub);

** Fix timber plantation land in case the plantations for productive purposes
** need to be held at constant 1995 levels.
v32_land.fx(j,"plant",ac)$(s32_initial_distribution=0) = p32_land_start_ac(j,"plant",ac);

m_boundfix(v32_land,(j,"plant",ac_sub),l,10e-5);

** fix ndc afforestation forever, all age-classes are fixed except ac0
v32_land.fx(j,"ndc",ac_sub) = pc32_land(j,"ndc",ac_sub);
** fix c price induced afforestation based on s32_planing_horizon, fixed only until end of s32_planing_horizon, ac0 is free
v32_land.fx(j,"aff",ac_sub)$(ord(ac_sub) <= s32_planing_horizon/5) = pc32_land(j,"aff",ac_sub);
v32_land.up(j,"aff",ac_sub)$(ord(ac_sub) > s32_planing_horizon/5) = pc32_land(j,"aff",ac_sub);

** Calculate future yield based on rotation length
pc32_yield_forestry_future(j) = sum(ac_sub$(ord(ac_sub) = p32_rotation_cellular_estb(t,j)), pm_timber_yield(t,j,ac_sub,"forestry"));

** Plantation production share for future
pc32_plant_prod_share_future(i)    			    = sum(t_ext$(t_ext.pos = pm_representative_rotation(t,i)),p32_plant_prod_share(t_ext,i));

*** EOF presolve.gms ***

scalars
 s13_tc_factor             regression factor                            / 1900 /
 s13_tc_exponent           regression exponent                           / 2.4 /
;

positive variables
 vm_tau(i)                       agricultural land use intensity tau (1)
 vm_tech_cost(i)                 costs of technological change (mio. US$)
;

parameters
 pc13_land(i)                crop land area per region (mio ha)
 p13_cost_tc(i)                  technical change costs per region (million US$)
 pc13_tech_cost_annuity(i)                 annuity costs of technological change (mio. US$)
 p13_tech_cost_past(t,i)                   costs for technological change from past (million US$)
 pc13_tech_cost_past(i)                         current costs for technological change from past (million US$)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_tau(t,i,type)       agricultural land use intensity tau (1)
 ov_tech_cost(t,i,type) costs of technological change (mio. US$)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################

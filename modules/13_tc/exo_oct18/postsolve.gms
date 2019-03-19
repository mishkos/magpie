
p13_tech_cost_past(t2,i) = p13_tech_cost_past(t2,i) + pc13_tech_cost_annuity(i);

*#################### R SECTION START (OUTPUT DEFINITIONS) #####################
 ov_tau(t,i,"marginal")       = vm_tau.m(i);
 ov_tech_cost(t,i,"marginal") = vm_tech_cost.m(i);
 ov_tau(t,i,"level")          = vm_tau.l(i);
 ov_tech_cost(t,i,"level")    = vm_tech_cost.l(i);
 ov_tau(t,i,"upper")          = vm_tau.up(i);
 ov_tech_cost(t,i,"upper")    = vm_tech_cost.up(i);
 ov_tau(t,i,"lower")          = vm_tau.lo(i);
 ov_tech_cost(t,i,"lower")    = vm_tech_cost.lo(i);
*##################### R SECTION END (OUTPUT DEFINITIONS) ######################

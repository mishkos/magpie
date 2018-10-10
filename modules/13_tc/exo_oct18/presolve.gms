pc13_land(i) = sum(cell(i,j),pcm_land(j,"crop"));

p13_tech_cost_past(t,i)$(ord(t) = 1) = 0;

pc13_tech_cost_past(i) = p13_tech_cost_past(t,i);

p13_cost_tc(i) = pc13_land(i)*s13_tc_factor*f13_tau(t,i)**s13_tc_exponent * (1+pm_interest(i))**15;

pc13_tech_cost_annuity(i) = (f13_tau(t,i)/vm_tau.l(i)-1)*p13_cost_tc(i)*pm_interest(i)/(1+pm_interest(i));

vm_tech_cost.fx(i) = pc13_tech_cost_annuity(i) + pc13_tech_cost_past(i);

vm_tau.fx(i) = f13_tau(t,i);

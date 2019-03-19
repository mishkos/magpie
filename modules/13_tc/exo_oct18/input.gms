
$setglobal c13_tau_scen  npi

parameter fm_tau1995(i) agricultural land use intensity tau in 1995 (1)
/
$ondelim
$include "./modules/13_tc/input/fm_tau1995.cs4"
$offdelim
/;

table f13_tau(t_all,i) Exogenous tau path (1)
$ondelim
$Ifi "%c13_tau_scen%" == "base" $include "./modules/13_tc/exo_oct18/input/tau_base.csv"
$Ifi "%c13_tau_scen%" == "npi" $include "./modules/13_tc/exo_oct18/input/tau_npi.csv"
$Ifi "%c13_tau_scen%" == "ndc" $include "./modules/13_tc/exo_oct18/input/tau_ndc.csv"
$Ifi "%c13_tau_scen%" == "test" $include "./modules/13_tc/exo__oct18/input/tau_test.csv"
$offdelim;

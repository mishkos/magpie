*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de


$setglobal c13_tau_scen  npi

parameter fm_tau1995(i) agricultural land use intensity tau in 1995 (1)
/
$ondelim
$include "./modules/13_tc/input/fm_tau1995.cs4"
$offdelim
/;

table f13_tau(t_all,i) Exogenous tau path (1)
$ondelim
$Ifi "%c13_tau_scen%" == "base" $include "./modules/13_tc/fixtc_nov18/input/tau_base.csv"
$Ifi "%c13_tau_scen%" == "npi" $include "./modules/13_tc/fixtc_nov18/input/tau_npi.csv"
$Ifi "%c13_tau_scen%" == "ndc" $include "./modules/13_tc/fixtc_nov18/input/tau_ndc.csv"
$Ifi "%c13_tau_scen%" == "test" $include "./modules/13_tc/fixtc_nov18/input/tau_test.csv"
$offdelim;

$setglobal c13_tccost  medium

table f13_tc_factor(t_all,scen13) regression factor (USD05PPP per ha)
$ondelim
$include "./modules/13_tc/input/f13_tc_factor.cs3"
$offdelim
;

table f13_tc_exponent(t_all,scen13) regression exponent (1)
$ondelim
$include "./modules/13_tc/input/f13_tc_exponent.cs3"
$offdelim
;

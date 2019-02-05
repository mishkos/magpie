*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

*' @description In the glo_jan16 realization, interest rates are identical in all regions.
*' The initial global interest rate is 7% (in 1995) for all scenarios defined in `scen12`.
*' It undergoes a transition towards 4%, 7% and 10% until 2030 for the low-, medium-
*' and high- interest rate scenarios, respectively.

*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/12_interest_rate/glo_jan16/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/12_interest_rate/glo_jan16/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/12_interest_rate/glo_jan16/input.gms"
$Ifi "%phase%" == "preloop" $include "./modules/12_interest_rate/glo_jan16/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/12_interest_rate/glo_jan16/presolve.gms"
*######################## R SECTION END (PHASES) ###############################

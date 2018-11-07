
*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/13_tc/fixtc_nov18/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/13_tc/fixtc_nov18/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/13_tc/fixtc_nov18/input.gms"
$Ifi "%phase%" == "equations" $include "./modules/13_tc/fixtc_nov18/equations.gms"
$Ifi "%phase%" == "scaling" $include "./modules/13_tc/fixtc_nov18/scaling.gms"
$Ifi "%phase%" == "preloop" $include "./modules/13_tc/fixtc_nov18/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/13_tc/fixtc_nov18/presolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/13_tc/fixtc_nov18/postsolve.gms"
$Ifi "%phase%" == "nl_fix" $include "./modules/13_tc/fixtc_nov18/nl_fix.gms"
$Ifi "%phase%" == "nl_release" $include "./modules/13_tc/fixtc_nov18/nl_release.gms"
$Ifi "%phase%" == "nl_relax" $include "./modules/13_tc/fixtc_nov18/nl_relax.gms"
*######################## R SECTION END (PHASES) ###############################

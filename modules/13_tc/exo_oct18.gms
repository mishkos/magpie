
*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "declarations" $include "./modules/13_tc/exo_oct18/declarations.gms"
$Ifi "%phase%" == "input" $include "./modules/13_tc/exo_oct18/input.gms"
$Ifi "%phase%" == "preloop" $include "./modules/13_tc/exo_oct18/preloop.gms"
$Ifi "%phase%" == "presolve" $include "./modules/13_tc/exo_oct18/presolve.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/13_tc/exo_oct18/postsolve.gms"
*######################## R SECTION END (PHASES) ###############################

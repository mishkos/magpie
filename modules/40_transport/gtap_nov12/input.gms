*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de


scalars
  s40_pasture_transport_costs  Transport costs for pasture (USD05MER per tDM per min)     / 0 /
;


parameters
f40_distance(j) Transport distance to urban center (min)
/
$ondelim
$include "./modules/40_transport/input/transport_distance.cs2"
$offdelim
/
;

parameter f40_transport_costs(k) Relative transport costs (USD05MER per tDM per min)
/
$ondelim
$include "./modules/40_transport/gtap_nov12/input/f40_transport_costs.csv"
$offdelim
/;

f40_transport_costs("pasture") = s40_pasture_transport_costs;

*** |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*************************BASIC SETS (INDICES)***********************************

*###############################################################################
*######################## R SECTION START (SETS) ###############################
*THIS CODE IS CREATED AUTOMATICALLY, DO NOT MODIFY THESE LINES DIRECTLY
*ANY DIRECT MODIFICATION WILL BE LOST AFTER NEXT INPUT DOWNLOAD
*CHANGES CAN BE DONE USING THE INPUT DOWNLOADER UNDER SCRIPTS/DOWNLOAD
*THERE YOU CAN ALSO FIND ADDITIONAL INFORMATION

sets

   i all economic regions /CAZ,CHA,DEU,EUC,EUN,EUS,EUW,IND,JPN,LAM,MEA,NEU,OAS,REF,SSA,USA/

   iso list of iso countries /
       AFG,ALA,ALB,DZA,ASM,AND,AGO,AIA,ATA,ATG,
       ARG,ARM,ABW,AUS,AUT,AZE,BHS,BHR,BGD,BRB,
       BLR,BEL,BLZ,BEN,BMU,BTN,BOL,BES,BIH,BWA,
       BVT,BRA,IOT,BRN,BGR,BFA,BDI,KHM,CMR,CAN,
       CPV,CYM,CAF,TCD,CHL,CHN,CXR,CCK,COL,COM,
       COG,COD,COK,CRI,CIV,HRV,CUB,CUW,CYP,CZE,
       DNK,DJI,DMA,DOM,ECU,EGY,SLV,GNQ,ERI,EST,
       ETH,FLK,FRO,FJI,FIN,FRA,GUF,PYF,ATF,GAB,
       GMB,GEO,DEU,GHA,GIB,GRC,GRL,GRD,GLP,GUM,
       GTM,GGY,GIN,GNB,GUY,HTI,HMD,VAT,HND,HKG,
       HUN,ISL,IND,IDN,IRN,IRQ,IRL,IMN,ISR,ITA,
       JAM,JPN,JEY,JOR,KAZ,KEN,KIR,PRK,KOR,KWT,
       KGZ,LAO,LVA,LBN,LSO,LBR,LBY,LIE,LTU,LUX,
       MAC,MKD,MDG,MWI,MYS,MDV,MLI,MLT,MHL,MTQ,
       MRT,MUS,MYT,MEX,FSM,MDA,MCO,MNG,MNE,MSR,
       MAR,MOZ,MMR,NAM,NRU,NPL,NLD,NCL,NZL,NIC,
       NER,NGA,NIU,NFK,MNP,NOR,OMN,PAK,PLW,PSE,
       PAN,PNG,PRY,PER,PHL,PCN,POL,PRT,PRI,QAT,
       REU,ROU,RUS,RWA,BLM,SHN,KNA,LCA,MAF,SPM,
       VCT,WSM,SMR,STP,SAU,SEN,SRB,SYC,SLE,SGP,
       SXM,SVK,SVN,SLB,SOM,ZAF,SGS,SSD,ESP,LKA,
       SDN,SUR,SJM,SWZ,SWE,CHE,SYR,TWN,TJK,TZA,
       THA,TLS,TGO,TKL,TON,TTO,TUN,TUR,TKM,TCA,
       TUV,UGA,UKR,ARE,GBR,USA,UMI,URY,UZB,VUT,
       VEN,VNM,VGB,VIR,WLF,ESH,YEM,ZMB,ZWE /

   j number of LPJ cells /
       CAZ_1*CAZ_19,
       CHA_20*CHA_35,
       DEU_36*DEU_58,
       EUC_59*EUC_71,
       EUN_72*EUN_83,
       EUS_84*EUS_97,
       EUW_98*EUW_110,
       IND_111*IND_115,
       JPN_116*JPN_118,
       LAM_119*LAM_151,
       MEA_152*MEA_160,
       NEU_161*NEU_167,
       OAS_168*OAS_181,
       REF_182*REF_186,
       SSA_187*SSA_193,
       USA_194*USA_200/

   cell(i,j) number of LPJ cells per region i
      /
       CAZ . CAZ_1*CAZ_19
       CHA . CHA_20*CHA_35
       DEU . DEU_36*DEU_58
       EUC . EUC_59*EUC_71
       EUN . EUN_72*EUN_83
       EUS . EUS_84*EUS_97
       EUW . EUW_98*EUW_110
       IND . IND_111*IND_115
       JPN . JPN_116*JPN_118
       LAM . LAM_119*LAM_151
       MEA . MEA_152*MEA_160
       NEU . NEU_161*NEU_167
       OAS . OAS_168*OAS_181
       REF . REF_182*REF_186
       SSA . SSA_187*SSA_193
       USA . USA_194*USA_200
      /

   i_to_iso(i,iso) mapping regions to iso countries
      /
       CAZ . (AUS,CAN,HMD,NZL,SPM)
       CHA . (CHN,HKG,MAC,TWN)
       DEU . (DEU)
       EUC . (BGR,HRV,CZE,EST,HUN,LVA,LTU,POL,ROU,SVK)
       EUC . (SVN)
       EUN . (ALA,DNK,FRO,FIN,GIB,GGY,IRL,IMN,JEY,SWE)
       EUN . (GBR)
       EUS . (CYP,GRC,ITA,MLT,PRT,ESP)
       EUW . (AUT,BEL,FRA,LUX,NLD)
       IND . (IND)
       JPN . (JPN)
       LAM . (AIA,ATA,ATG,ARG,ABW,BHS,BRB,BLZ,BMU,BOL)
       LAM . (BES,BVT,BRA,CYM,CHL,COL,CRI,CUB,CUW,DMA)
       LAM . (DOM,ECU,SLV,FLK,GUF,GRD,GLP,GTM,GUY,HTI)
       LAM . (HND,JAM,MTQ,MEX,MSR,NIC,PAN,PRY,PER,PRI)
       LAM . (BLM,KNA,LCA,MAF,VCT,SXM,SGS,SUR,TTO,TCA)
       LAM . (URY,VEN,VGB,VIR)
       MEA . (DZA,BHR,EGY,IRN,IRQ,ISR,JOR,KWT,LBN,LBY)
       MEA . (MAR,OMN,PSE,QAT,SAU,SDN,SYR,TUN,ARE,ESH)
       MEA . (YEM)
       NEU . (ALB,AND,BIH,GRL,VAT,ISL,LIE,MKD,MCO,MNE)
       NEU . (NOR,SMR,SRB,SJM,CHE,TUR)
       OAS . (AFG,ASM,BGD,BTN,IOT,BRN,KHM,CXR,CCK,COK)
       OAS . (FJI,PYF,ATF,GUM,IDN,KIR,PRK,KOR,LAO,MYS)
       OAS . (MDV,MHL,FSM,MNG,MMR,NRU,NPL,NCL,NIU,NFK)
       OAS . (MNP,PAK,PLW,PNG,PHL,PCN,WSM,SGP,SLB,LKA)
       OAS . (THA,TLS,TKL,TON,TUV,UMI,VUT,VNM,WLF)
       REF . (ARM,AZE,BLR,GEO,KAZ,KGZ,MDA,RUS,TJK,TKM)
       REF . (UKR,UZB)
       SSA . (AGO,BEN,BWA,BFA,BDI,CMR,CPV,CAF,TCD,COM)
       SSA . (COG,COD,CIV,DJI,GNQ,ERI,ETH,GAB,GMB,GHA)
       SSA . (GIN,GNB,KEN,LSO,LBR,MDG,MWI,MLI,MRT,MUS)
       SSA . (MYT,MOZ,NAM,NER,NGA,REU,RWA,SHN,STP,SEN)
       SSA . (SYC,SLE,SOM,ZAF,SSD,SWZ,TZA,TGO,UGA,ZMB)
       SSA . (ZWE)
       USA . (USA)
      /
;
*######################### R SECTION END (SETS) ################################
*###############################################################################

sets
        i2(i) World regions (dynamic set)
        j2(j) Spatial Clusters (dynamic set)
;
i2(i) = yes;
j2(j) = yes;


***TIME STEPS***
* ATTENTION: check macros m_year and m_yeardiff if you change something
*            here as they need to make some assumption about these settings,
*            especially having 1965 as start year, having t2 as alias of t and
*            having ct as current time step
sets time_annual Annual extended time steps
    / y1965*y2150 /

    t_all 5-year time periods
    / y1965, y1970, y1975, y1980, y1985, y1990,
      y1995, y2000, y2005, y2010, y2015, y2020, y2025, y2030, y2035, y2040,
      y2045, y2050, y2055, y2060, y2065, y2070, y2075, y2080, y2085, y2090,
      y2095, y2100, y2105, y2110, y2115, y2120, y2125, y2130, y2135, y2140,
      y2145, y2150 /

    t_past(t_all) Timesteps with observed data
        / y1965, y1970, y1975,
         y1980, y1985, y1990,
         y1995, y2000, y2005, y2010
        /
;

set t(t_all) Simulated time periods
$If "%c_timesteps%"== "less_TS" /y1995,y2000,y2005,y2010,y2015,y2020,y2025,y2030,y2035,y2040,y2045,y2050,y2055,y2060,y2070,y2080,y2090,y2100,y2110,y2130,y2150/;
$If "%c_timesteps%"== "coup2100" /y1995,y2000,y2005,y2010,y2015,y2020,y2025,y2030,y2035,y2040,y2045,y2050,y2055,y2060,y2070,y2080,y2090,y2100/;
$If "%c_timesteps%"== "test_TS" /y1995,y2000,y2005,y2010,y2020,y2030,y2040,y2050,y2070,y2090,y2110,y2130,y2150/;
$If "%c_timesteps%"== "TS_benni" /y1995,y2000,y2005,y2010,y2020,y2030,y2040,y2050/;
$If "%c_timesteps%"== "TS_WB" /y1995,y2000,y2005,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080/;
$If "%c_timesteps%"== "5year" /y1995,y2000,y2005,y2010,y2015,y2020,y2025,y2030,y2035,y2040,y2045,y2050,y2055,y2060,y2065,y2070,y2075,y2080,y2085,y2090,y2095,y2100/;
$If "%c_timesteps%"== "5year2050" /y1995,y2000,y2005,y2010,y2015,y2020,y2025,y2030,y2035,y2040,y2045,y2050/;
$If "%c_timesteps%"== "quicktest" /y1995,y2010,y2025/;
$If "%c_timesteps%"== "1" /y1995/;
$If "%c_timesteps%"== "2" /y1995,y2000/;
$If "%c_timesteps%"== "3" /y1995,y2000,y2010/;
$If "%c_timesteps%"== "4" /y1995,y2000,y2010,y2020/;
$If "%c_timesteps%"== "5" /y1995,y2000,y2010,y2020,y2030/;
$If "%c_timesteps%"== "6" /y1995,y2000,y2010,y2020,y2030,y2040/;
$If "%c_timesteps%"== "7" /y1995,y2000,y2010,y2020,y2030,y2040,y2050/;
$If "%c_timesteps%"== "8" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060/;
$If "%c_timesteps%"== "9" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070/;
$If "%c_timesteps%"=="10" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080/;
$If "%c_timesteps%"=="11" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080,y2090/;
$If "%c_timesteps%"=="12" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080,y2090,y2100/;
$If "%c_timesteps%"=="13" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080,y2090,y2100,y2110/;
$If "%c_timesteps%"=="14" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080,y2090,y2100,y2110,y2120/;
$If "%c_timesteps%"=="15" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080,y2090,y2100,y2110,y2120,y2130/;
$If "%c_timesteps%"=="16" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080,y2090,y2100,y2110,y2120,y2130,y2140/;
$If "%c_timesteps%"=="17" /y1995,y2000,y2010,y2020,y2030,y2040,y2050,y2060,y2070,y2080,y2090,y2100,y2110,y2120,y2130,y2140,y2150/;
$If "%c_timesteps%"=="past" /y1965,y1970,y1975,y1980,y1985,y1990,y1995,y2000,y2005,y2010/;
$If "%c_timesteps%"=="pastandfuture" /y1965,y1970,y1975,y1980,y1985,y1990,y1995,y2000,y2005,y2010,y2015,y2020,y2025,y2030,y2035,y2040,y2045,y2050,y2055,y2060,y2065,y2070,y2075,y2080,y2085,y2090,y2095,y2100/;
set ct(t) Current time period;

alias(t,t2);

sets

***Products***

   kall All products in the sectoral version
   /
   tece,maiz,trce,rice_pro,soybean,rapeseed,groundnut,sunflower,oilpalm,puls_pro,
   potato,cassav_sp,sugr_cane,sugr_beet,others,cottn_pro,foddr, pasture, begr, betr,
   oils,oilcakes,sugar,molasses,alcohol,ethanol,distillers_grain,brans,scp,fibres,
   livst_rum, livst_pig,livst_chick, livst_egg, livst_milk, fish,
   res_cereals, res_fibrous, res_nonfibrous, wood, woodfuel
   /

  dev Economic development status
       / lic, mic, hic /

***TYPE OF WATER SUPPLY***
   w Water supply type / rainfed, irrigated /

***WATER SOURCES***
   wat_src Type of water source / surface, ground, technical, ren_ground /

***WATER DEMAND sectors***
   wat_dem Water demand sectors / agriculture, industry, electricity, domestic, ecosystem /

***LAND POOLS***
   land Land pools
        / crop, past, forestry, primforest, secdforest, urban, other /

  land_ag(land) Agricultural land pools
                  / crop, past /

  land_natveg(land) Natural vegetation land pools
        / primforest, secdforest, other /

   si Suitability classes
        / si0, nsi0 /

***Forestry**
   ac Age classes  / ac0,ac5,ac10,ac15,ac20,ac25,ac30,ac35,ac40,ac45,ac50,
                    ac55,ac60,ac65,ac70,ac75,ac80,ac85,ac90,ac95,ac100,
                    ac105,ac110,ac115,ac120,ac125,ac130,ac135,ac140,ac145,ac150,
                    ac155,ac160,ac165,ac170,ac175,ac180,ac185,ac190,ac195,ac200,
                    ac205,ac210,ac215,ac220,ac225,ac230,ac235,ac240,ac245,ac250,
                    ac255,ac260,ac265,ac270,ac275,ac280,ac285,ac290,ac295,acx /

   when Temporal location relative to optimization / before, after /

   chap_par Chapman-richards parameters / k,m /

*** Nutrients
   attributes Product attributes characterizing a product (such as weight or energy content)
   /dm,ge,nr,p,k,wm,c/
* dry matter, gross energy, reactive nitrogen, phosphorus, potash, wet matters

   nutrients(attributes) Nutrient related product attributes
   /dm,ge,nr,p,k/

  dm_ge_nr(nutrients) Attribtues relevant for nutrition
       / dm,ge,nr /

  npk(nutrients) Plant nutrients
   /nr,p,k/

  cgf Residue production functions
   /slope, intercept, bg_to_ag/

***Emissions ***

   emis_source Emission sources
   / inorg_fert, man_crop, awms, resid, man_past, som,
     rice, ent_ferm,
     resid_burn,
     crop_vegc, crop_litc, crop_soilc,
     past_vegc, past_litc, past_soilc,
     forestry_vegc, forestry_litc, forestry_soilc,
     primforest_vegc, primforest_litc, primforest_soilc,
secdforest_vegc, secdforest_litc, secdforest_soilc,     urban_vegc, urban_litc, urban_soilc,
     other_vegc, other_litc, other_soilc,
     beccs/

   emis_source_reg(emis_source) Regional emission sources
   / inorg_fert, man_crop, awms, resid, man_past, som,
     rice, ent_ferm, beccs /

   emis_source_cell(emis_source) Cellular emission sources
   / crop_vegc, crop_litc, crop_soilc,
     past_vegc, past_litc, past_soilc,
     forestry_vegc, forestry_litc, forestry_soilc,
     primforest_vegc, primforest_litc, primforest_soilc,
secdforest_vegc, secdforest_litc, secdforest_soilc,     urban_vegc, urban_litc, urban_soilc,
     other_vegc, other_litc, other_soilc /

   emis_co2(emis_source_cell) Land pool CO2 emission sources
   / crop_vegc, crop_litc, crop_soilc,
     past_vegc, past_litc, past_soilc,
     forestry_vegc, forestry_litc, forestry_soilc,
     primforest_vegc, primforest_litc, primforest_soilc,
secdforest_vegc, secdforest_litc, secdforest_soilc,     urban_vegc, urban_litc, urban_soilc,
     other_vegc, other_litc, other_soilc /

   co2_forestry(emis_source_cell) Sources of forestry land CO2 emissions
   /forestry_vegc, forestry_litc, forestry_soilc/

   c_pools Carbon pools
   /vegc,litc,soilc/

***TECHNICAL STUFF***
   type GAMS variable attribute used for the output / level, marginal, upper, lower /

***RELATIONSHIPS BETWEEN DIFFERENT SETS***

  emis_land(emis_co2,land,c_pools) Mapping between land and carbon pools
  /crop_vegc        . (crop) . (vegc)
   crop_litc        . (crop) . (litc)
   crop_soilc       . (crop) . (soilc)
   past_vegc        . (past) . (vegc)
   past_litc        . (past) . (litc)
   past_soilc       . (past) . (soilc)
   forestry_vegc    . (forestry) . (vegc)
   forestry_litc    . (forestry) . (litc)
   forestry_soilc   . (forestry) . (soilc)
   primforest_vegc  . (primforest) . (vegc)
   primforest_litc  . (primforest) . (litc)
   primforest_soilc . (primforest) . (soilc)
   secdforest_vegc  . (secdforest) . (vegc)
   secdforest_litc  . (secdforest) . (litc)
   secdforest_soilc . (secdforest) . (soilc)
   urban_vegc       . (urban) . (vegc)
   urban_litc       . (urban) . (litc)
   urban_soilc      . (urban) . (soilc)
   other_vegc       . (other) . (vegc)
   other_litc       . (other) . (litc)
   other_soilc      . (other) . (soilc)
   /

   emis_co2_to_forestry(co2_forestry,c_pools) Mapping between forestry land and carbon pools
  /forestry_vegc    . (vegc)
   forestry_litc    . (litc)
   forestry_soilc   . (soilc)
   /

;

*** EOF sets.gms ***

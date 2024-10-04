import excel "G:\Meu Drive\Doutorado\Artigos Finais\Paper1 3103\Dataset8paper 29.03 23092024 25092024.xlsx", sheet("Dataset16") firstrow clear




************************************
***creating variables***
***********************************

*DEPENDENT VARIABLES

 
* Health non profit density


gen healthnpdensity2015 = (OSChealthtot2015 )
gen healthnpdensity2016 = (OSChealthtot2016 )
gen healthnpdensity2017 = (OSChealthtot2017 )
gen healthnpdensity2018 = (OSChealthtot2018 )
gen healthnpdensity2019 = (OSChealthtot2019 )
gen healthnpdensity2020 = (OSChealthtot2020 )

gen healthnpdensitypc2015 = (OSChealthtot2015/pop2015 )
gen healthnpdensitypc2016 = (OSChealthtot2016/pop2016  )
gen healthnpdensitypc2017 = (OSChealthtot2017 /pop2017 )
gen healthnpdensitypc2018 = (OSChealthtot2018 /pop2018 )
gen healthnpdensitypc2019 = (OSChealthtot2019/pop2019 )
gen healthnpdensitypc2020 = (OSChealthtot2020 /pop2020 )

*INDEPENDENT VARIABLE
*values transformed from Reais to USD 1USD = 5R$


gen  logporkbarrel2015 =  log(PAGOFNSOSC2015)/ 5
gen  logporkbarrel2016 =  log(PAGOFNSOSC2016) /5 
gen  logporkbarrel2017 =  log(PAGOFNSOSC2017) /5
gen  logporkbarrel2018 =  log(PAGOFNSOSC2018)/5
gen  logporkbarrel2019 =  log(PAGOFNSOSC2019) /5
gen  logporkbarrel2020 =  log(PAGOFNSOSC2020)/5


*MODERATION VARIABLE 

*Wealth municipalities

sort MunHierarchy
 
by MunHierarchy: egen median_Pibpercapita2015 = median(Pibpercapita2015)

gen wealthmunmedian = (Pibpercapita2015 > median_Pibpercapita2015)

generate wealthmundensity2015 = .
replace wealthmundensity2015 = OSChealthtot2015 /  pop2015 if wealthmunmedian == 1

generate wealthmundensity2016 = .
replace wealthmundensity2016 = OSChealthtot2016 / pop2016 if wealthmunmedian == 1

generate wealthmundensity2017 = .
replace wealthmundensity2017 = OSChealthtot2017 / pop2017 if wealthmunmedian == 1

generate wealthmundensity2018 = .
replace wealthmundensity2018 = OSChealthtot2018 / pop2018 if wealthmunmedian == 1

generate wealthmundensity2019 = .
replace wealthmundensity2019 = OSChealthtot2019 / pop2019 if wealthmunmedian == 1

generate wealthmundensity2020 = .
replace wealthmundensity2020 = OSChealthtot2020 / pop2020 if wealthmunmedian == 1

 
*CONTROL VARIABLE
*values transformed from Reais to USD 1USD = 5R$


*Govfunding otherresources paid

gen loggovfunding2015 = log(govfunding2015) /5 
gen loggovfunding2016 = log(govfunding2016)/5
gen loggovfunding2017 = log(govfunding2017)/5
gen loggovfunding2018 = log(govfunding2018) /5
gen loggovfunding2019 = log(govfunding2019) /5
gen loggovfunding2020 = log(govfunding2020) /5



*Municipal govfunding nonprofits  


gen logmunfunding2015 = log(FinbrapagoOSC2015) /5 
gen logmunfunding2016 = log(FinbrapagoOSC2016) /5
gen logmunfunding2017 = log(FinbrapagoOSC2017) /5
gen logmunfunding2018 = log(FinbrapagoOSC2018) /5
gen logmunfunding2019 = log(FinbrapagoOSC2019) /5
gen logmunfunding2020 = log(FinbrapagoOSC2020) /5


*Log of pib 
gen logpib2015 = log(Pib2015/5)
gen logpib2016 = log(Pib2016/5)
gen logpib2017 = log(Pib2017/5)
gen logpib2018 = log(Pib2018/5)
gen logpib2019 = log(Pib2019/5)
gen logpib2020 = log(Pib2020/5)

*Log of pib 
gen logpibpercapita2015 = log(Pibpercapita2015/5)
gen logpibpercapita2016 = log(Pibpercapita2016/5)
gen logpibpercapita2017 = log(Pibpercapita2017/5)
gen logpibpercapita2018 = log(Pibpercapita2018/5)
gen logpibpercapita2019 = log(Pibpercapita2019/5)
gen logpibpercapita2020 = log(Pibpercapita2020/5)

*Proportion of overall non profit sector density
gen ptotalnpdensity2015 = OSC2015 / pop2015
gen ptotalnpdensity2016 = OSC2016 / pop2016
gen ptotalnpdensity2017 = OSC2017 / pop2017
gen ptotalnpdensity2018 = OSC2018 / pop2018
gen ptotalnpdensity2019 = OSC2019 / pop2019
gen ptotalnpdensity2020 = OSC2020 / pop2020

*Overall non profit sector density
gen totalosc2015 = OSC2015  
gen totalosc2016 = OSC2016 
gen totalosc2017 = OSC2017  
gen totalosc2018 = OSC2018  
gen totalosc2019 = OSC2019  
gen totalosc2020 = OSC2020  

* Proportion of poverty (individuals registered at CadUnico)
gen ppoverty2015 = CadUnico2015 /pop2015 
gen ppoverty2016 = CadUnico2016 /pop2016 
gen ppoverty2017 = CadUnico2017 /pop2017 
gen ppoverty2018 = CadUnico2018 /pop2018 
gen ppoverty2019 = CadUnico2019 /pop2019 
gen ppoverty2020 = CadUnico2020 /pop2020 


* Proportion of healthdependents (individuals with health plan)
gen phealthplan2015 = planosau2015 /pop2015 
gen phealthplan2016 = planosau2016 /pop2016
gen phealthplan2018 = planosau2018 /pop2018 
gen phealthplan2019 = planosau2019 /pop2019
gen phealthplan2020 = planosau2020 /pop2020 

*Transforming pib percapita to USD

gen pibpercapita2015 = Pibpercapita2015/ 5
gen pibpercapita2016= Pibpercapita2016/ 5
gen pibpercapita2017 = Pibpercapita2017/ 5
gen pibpercapita2018 = Pibpercapita2018/ 5
gen pibpercapita2019 = Pibpercapita2019/ 5
gen pibpercapita2020 = Pibpercapita2020/ 5

*Wealth municipalities

sort MunHierarchy
 
by MunHierarchy: egen median_pibpercapita2015 = median(pibpercapita2015)

gen wealthmun = (pibpercapita2015 > median_pibpercapita2015) 

*transforming dataset from wide to long
reshape long    healthnpdensity   logporkbarrel  loggovfunding logmunfunding     ppoverty phealthplan    totalosc  logpib pibpercapita   logpibpercapita     Pibpercapita, i( IBGE ) j(Year)

xtset IBGE Year


 **drop unecessary variables 
drop  MUNICIPIO UF MunHierarchy pop2015 pop2016 pop2017 pop2018 pop2019 pop2020 CNESESTOSC2014 CNESESTOSC2015 CNESESTOSC2016 CNESESTOSC2017 CNESESTOSC2018 CNESESTOSC2019 CNESESTOSC2020 Receivedamend OSCparent OSCParent2015 OSCParent2016 OSCParent2017 OSCParent2018 OSCParent2019 OSCParent2020 OSChealthtot2015 OSChealthtot2016 OSChealthtot2017 OSChealthtot2018 OSChealthtot2019 OSChealthtot2020 Pib2015 Pib2016 Pib2017 Pib2018 Pib2019 Pib2020  CadUnico2015 CadUnico2016 CadUnico2017 CadUnico2018 CadUnico2019 CadUnico2020 govfunding2015 govfunding2016 govfunding2017 govfunding2018 govfunding2019 govfunding2020 OSCSAUDEAS2015 OSCSAUDEAS2016 OSCSAUDEAS2017 OSCSAUDEAS2018 OSCSAUDEAS2019 OSCSAUDEAS2020 OSC2015 OSC2016 OSC2017 OSC2018 OSC2019 OSC2020 FinbrapagoOSC2015 FinbrapagoOSC2016 FinbrapagoOSC2017 FinbrapagoOSC2018 FinbrapagoOSC2019 FinbrapagoOSC2020 planosau2020 planosau2019 planosau2018 planosau2016 planosau2015 PAGOFNSTOTAL2015 PAGOFNSTOTAL2016 PAGOFNSTOTAL2017 PAGOFNSTOTAL2018 PAGOFNSTOTAL2019 PAGOFNSTOTAL2020 PAGOFNSOSC2015 PAGOFNSOSC2016 PAGOFNSOSC2017 PAGOFNSOSC2018 PAGOFNSOSC2019 PAGOFNSOSC2020 PAGOFNSTOTALpercapita2015 PAGOFNSTOTALpercapita2016 PAGOFNSTOTALpercapita2017 PAGOFNSTOTALpercapita2018 PAGOFNSTOTALpercapita2019 PAGOFNSTOTALpercapita2020 PAGOFNSOSCpercapita2015 PAGOFNSOSCpercapita2016 PAGOFNSOSCpercapita2017 PAGOFNSOSCpercapita2018 PAGOFNSOSCpercapita2019 PAGOFNSOSCpercapita2020



 
 
 *Lagging the explanatory variables

gen laghealthnpdensity =  L.healthnpdensity
gen laglogporkbarrel =  L.logporkbarrel
gen lagloggovfunding = L.loggovfunding
gen laglogmunfunding = L.logmunfunding 
gen lagppoverty = L.ppoverty
gen lagphealthplan = L.phealthplan
gen lagtotalosc = L.totalosc
gen laglogpib = L.logpib 




gen lag2logporkbarrel =  L2.logporkbarrel
gen lag2loggovfunding = L2.loggovfunding
gen lag2logmunfunding = L2.logmunfunding 
gen lag2ppoverty = L2.ppoverty
gen lag2phealthplan = L2.phealthplan
gen lag2totalosc = L2.totalosc
gen lag2logpib = L2.logpib 


generate interaction_wealthmunmedian = logporkbarrel * wealthmun

generate interaction_wealthmunicipality = logporkbarrel * logpibpercapita

*Filling nan variable



replace  healthnpdensity        = 0 if  healthnpdensity       == .
replace  laglogporkbarrel        = 0 if  laglogporkbarrel       == .
replace  lagloggovfunding        = 0 if  lagloggovfunding       == .
replace  laglogmunfunding        = 0 if  laglogmunfunding       == .
replace  logporkbarrel        = 0 if  logporkbarrel       == .
replace  loggovfunding        = 0 if  loggovfunding       == .
replace  logmunfunding        = 0 if  logmunfunding       == .
replace  wealthmun        = 0 if  wealthmun       == .
replace  lagppoverty        = 0 if  lagppoverty       == .
replace  lagphealthplan        = 0 if  lagphealthplan       == .
replace  phealthplan        = 0 if  phealthplan       == .
replace  lagtotalosc        = 0 if  lagtotalosc      == .
replace  laglogpib      = 0 if  laglogpib       == .
replace  interaction_wealthmunmedian        = 0 if  interaction_wealthmunmedian       == .
replace  interaction_wealthmun        = 0 if  interaction_wealthmun       == .
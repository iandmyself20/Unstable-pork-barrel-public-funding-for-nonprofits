. reg healthnpdensity  laglogporkbarrel wealthmun  lagloggovfunding laglogmunfunding    lagppoverty lagphealthplan    lagtot
> alosc  laglogpib , robust 

Linear regression                               Number of obs     =     33,420
                                                F(8, 33411)       =    1297.71
                                                Prob > F          =     0.0000
                                                R-squared         =     0.8405
                                                Root MSE          =     5.4777

----------------------------------------------------------------------------------
                 |               Robust
 healthnpdensity | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-----------------+----------------------------------------------------------------
laglogporkbarrel |   .1984931   .0412134     4.82   0.000     .1177133    .2792728
       wealthmun |   .8105345   .0892062     9.09   0.000     .6356872    .9853818
lagloggovfunding |  -2.017814   .4486068    -4.50   0.000    -2.897099   -1.138529
laglogmunfunding |    .138924   .0300609     4.62   0.000     .0800035    .1978444
     lagppoverty |   1.095542    .148496     7.38   0.000     .8044844    1.386599
  lagphealthplan |   .5284205   .3907152     1.35   0.176    -.2373949    1.294236
     lagtotalosc |   .0177341   .0003828    46.32   0.000     .0169838    .0184845
       laglogpib |  -.2948816   .0195957   -15.05   0.000    -.3332899   -.2564733
           _cons |   1.262276   .1209121    10.44   0.000     1.025284    1.499268
----------------------------------------------------------------------------------

. 
. 
. 
. estimates store Model0_OLS

. 
. 
. 
. xtreg healthnpdensity  laglogporkbarrel    lagloggovfunding laglogmunfunding    lagppoverty lagphealthplan    lagtotalosc 
>  laglogpib i.Year , fe  cluster(IBGE)

Fixed-effects (within) regression               Number of obs     =     33,420
Group variable: IBGE                            Number of groups  =      5,570

R-squared:                                      Obs per group:
     Within  = 0.4969                                         min =          6
     Between = 0.9664                                         avg =        6.0
     Overall = 0.8368                                         max =          6

                                                F(12, 5569)       =      66.15
corr(u_i, Xb) = 0.8888                          Prob > F          =     0.0000

                                   (Std. err. adjusted for 5,570 clusters in IBGE)
----------------------------------------------------------------------------------
                 |               Robust
 healthnpdensity | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
-----------------+----------------------------------------------------------------
laglogporkbarrel |   .0680623   .0254419     2.68   0.007     .0181862    .1179383
lagloggovfunding |  -.5504832   .1758549    -3.13   0.002    -.8952273   -.2057391
laglogmunfunding |   .0067234    .007962     0.84   0.398    -.0088853     .022332
     lagppoverty |  -.1155379    .074424    -1.55   0.121    -.2614379    .0303622
  lagphealthplan |  -.0929988   .1551479    -0.60   0.549    -.3971492    .2111516
     lagtotalosc |   .0027891    .000329     8.48   0.000     .0021442    .0034339
       laglogpib |  -.1459825   .0489872    -2.98   0.003    -.2420167   -.0499484
                 |
            Year |
           2016  |    1.29698   .5095498     2.55   0.011     .2980638    2.295897
           2017  |   1.343084    .513899     2.61   0.009     .3356412    2.350526
           2018  |   1.400326   .5134042     2.73   0.006      .393853    2.406798
           2019  |   1.483146      .5288     2.80   0.005     .4464916      2.5198
           2020  |   1.526295   .5329124     2.86   0.004     .4815791    2.571011
                 |
           _cons |    1.40018   .0079869   175.31   0.000     1.384522    1.415837
-----------------+----------------------------------------------------------------
         sigma_u |  11.958602
         sigma_e |  .88109594
             rho |  .99460074   (fraction of variance due to u_i)
----------------------------------------------------------------------------------

. 
. 
. 
. estimates store Model1_FE

. 
. 
. 
. 
. 
. xtreg healthnpdensity  laglogporkbarrel interaction_wealthmun   lagloggovfunding laglogmunfunding    lagppoverty lagphealt
> hplan    lagtotalosc  laglogpib  i.Year , fe cluster(IBGE7)

Fixed-effects (within) regression               Number of obs     =     33,420
Group variable: IBGE                            Number of groups  =      5,570

R-squared:                                      Obs per group:
     Within  = 0.4974                                         min =          6
     Between = 0.9670                                         avg =        6.0
     Overall = 0.8381                                         max =          6

                                                F(13, 5569)       =      60.73
corr(u_i, Xb) = 0.8896                          Prob > F          =     0.0000

                                       (Std. err. adjusted for 5,570 clusters in IBGE7)
---------------------------------------------------------------------------------------
                      |               Robust
      healthnpdensity | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
----------------------+----------------------------------------------------------------
     laglogporkbarrel |   .0634114   .0249196     2.54   0.011     .0145593    .1122636
interaction_wealthmun |   .0062771   .0013993     4.49   0.000      .003534    .0090202
     lagloggovfunding |  -.5523853   .1758688    -3.14   0.002    -.8971566   -.2076139
     laglogmunfunding |   .0051817    .007888     0.66   0.511    -.0102819    .0206453
          lagppoverty |  -.1064962    .074476    -1.43   0.153    -.2524981    .0395058
       lagphealthplan |  -.0904449   .1547711    -0.58   0.559    -.3938566    .2129668
          lagtotalosc |   .0027893   .0003297     8.46   0.000      .002143    .0034355
            laglogpib |  -.1501613   .0492534    -3.05   0.002    -.2467172   -.0536053
                      |
                 Year |
                2016  |   1.336574   .5119726     2.61   0.009     .3329076     2.34024
                2017  |   1.377463   .5161407     2.67   0.008     .3656259      2.3893
                2018  |   1.437647   .5157974     2.79   0.005     .4264826    2.448811
                2019  |   1.518361   .5311788     2.86   0.004     .4770431    2.559678
                2020  |   1.561516   .5353232     2.92   0.004     .5120738    2.610958
                      |
                _cons |    1.39288   .0076658   181.70   0.000     1.377852    1.407908
----------------------+----------------------------------------------------------------
              sigma_u |  11.951366
              sigma_e |   .8806924
                  rho |  .99459916   (fraction of variance due to u_i)
---------------------------------------------------------------------------------------

. 
. 
. 
. estimates store Model2_FE

. 
. 
. 
. xtreg laghealthnpdensity  logporkbarrel   interaction_wealthmun  loggovfunding logmunfunding    ppoverty phealthplan    to
> talosc  logpib i.Year , fe cluster(IBGE7)

Fixed-effects (within) regression               Number of obs     =     27,850
Group variable: IBGE                            Number of groups  =      5,570

R-squared:                                      Obs per group:
     Within  = 0.8613                                         min =          5
     Between = 0.9639                                         avg =        5.0
     Overall = 0.9631                                         max =          5

                                                F(12, 5569)       =      60.85
corr(u_i, Xb) = -0.8713                         Prob > F          =     0.0000

                                       (Std. err. adjusted for 5,570 clusters in IBGE7)
---------------------------------------------------------------------------------------
                      |               Robust
   laghealthnpdensity | Coefficient  std. err.      t    P>|t|     [95% conf. interval]
----------------------+----------------------------------------------------------------
        logporkbarrel |   .0449952    .154653     0.29   0.771     -.258185    .3481754
interaction_wealthmun |  -.0062836    .018937    -0.33   0.740    -.0434076    .0308403
        loggovfunding |  -.0112646   .0630514    -0.18   0.858    -.1348699    .1123406
        logmunfunding |    .000864   .0030382     0.28   0.776     -.005092    .0068199
             ppoverty |  -.1565557   .0547769    -2.86   0.004    -.2639397   -.0491716
          phealthplan |   .0683256   .1194759     0.57   0.567    -.1658937     .302545
             totalosc |   .0214614   .0013983    15.35   0.000     .0187201    .0242026
               logpib |  -.0770044   .0228651    -3.37   0.001     -.121829   -.0321798
                      |
                 Year |
                2017  |  -.0273666    .013105    -2.09   0.037    -.0530575   -.0016756
                2018  |  -.0729666   .0128932    -5.66   0.000    -.0982423   -.0476909
                2019  |  -.0836088    .016391    -5.10   0.000    -.1157415    -.051476
                2020  |  -.0383835   .0181538    -2.11   0.035    -.0739721   -.0027949
                      |
                _cons |  -.5365512   .2943524    -1.82   0.068    -1.113597    .0404943
----------------------+----------------------------------------------------------------
              sigma_u |  5.1973321
              sigma_e |  .41154493
                  rho |  .99376898   (fraction of variance due to u_i)
---------------------------------------------------------------------------------------

. 
. 
. 
. estimates store Model3_LDV

. 
. 
. 
. 
. 
. xtabond healthnpdensity laglogporkbarrel lagloggovfunding laglogmunfunding lagppoverty lagphealthplan lagtotalosc laglogpi
> b

Arellano–Bond dynamic panel-data estimation     Number of obs     =     22,280
Group variable: IBGE                            Number of groups  =      5,570
Time variable: Year
                                                Obs per group:
                                                              min =          4
                                                              avg =          4
                                                              max =          4

Number of instruments =     18                  Wald chi2(8)      =  254145.07
                                                Prob > chi2       =     0.0000
One-step results
----------------------------------------------------------------------------------
 healthnpdensity | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-----------------+----------------------------------------------------------------
 healthnpdensity |
             L1. |   .7172615   .0147031    48.78   0.000     .6884441     .746079
                 |
laglogporkbarrel |   .0095572   .0048378     1.98   0.048     .0000753    .0190391
lagloggovfunding |  -.0463708   .0197628    -2.35   0.019    -.0851051   -.0076365
laglogmunfunding |   .0032561    .004389     0.74   0.458    -.0053462    .0118584
     lagppoverty |   .0436821   .0844826     0.52   0.605    -.1219007    .2092649
  lagphealthplan |  -.3109318   .0354418    -8.77   0.000    -.3803964   -.2414672
     lagtotalosc |   .0047946   .0002986    16.05   0.000     .0042093    .0053799
       laglogpib |  -.0492729   .0210093    -2.35   0.019    -.0904503   -.0080955
           _cons |   .3756912   .2333758     1.61   0.107     -.081717    .8330993
----------------------------------------------------------------------------------
Instruments for differenced equation
        GMM-type: L(2/.).healthnpdensity
        Standard: D.laglogporkbarrel D.lagloggovfunding D.laglogmunfunding
                  D.lagppoverty D.lagphealthplan D.lagtotalosc D.laglogpib
Instruments for level equation
        Standard: _cons

. 
. 
. 
.  
. 
. 
. 
. estimates store Model4_GMM

. 
. 
. 
. estout Model1_FE Model2_FE Model3_LDV Model4_GMM  , cells(b(star fmt(8))p(fmt(3)) se(par fmt(2)))legend label varlabels(_c
> ons constant)  stats(r2 rho df_r bic N)  starlevels(+ 0.10 * 0.05)

----------------------------------------------------------------------------
                        Model1_FE     Model2_FE    Model3_LDV    Model4_GMM 
                           b/p/se        b/p/se        b/p/se        b/p/se 
----------------------------------------------------------------------------
laglogporkbarrel       0.06806227*   0.06341144*                 0.00955717*
                            0.007         0.011                       0.048 
                           (0.03)        (0.02)                      (0.00) 
lagloggovfunding      -0.55048319*  -0.55238527*                -0.04637080*
                            0.002         0.002                       0.019 
                           (0.18)        (0.18)                      (0.02) 
laglogmunfunding       0.00672336    0.00518171                  0.00325611 
                            0.398         0.511                       0.458 
                           (0.01)        (0.01)                      (0.00) 
lagppoverty           -0.11553787   -0.10649615                  0.04368208 
                            0.121         0.153                       0.605 
                           (0.07)        (0.07)                      (0.08) 
lagphealthplan        -0.09299877   -0.09044487                 -0.31093179*
                            0.549         0.559                       0.000 
                           (0.16)        (0.15)                      (0.04) 
lagtotalosc            0.00278907*   0.00278925*                 0.00479461*
                            0.000         0.000                       0.000 
                           (0.00)        (0.00)                      (0.00) 
laglogpib             -0.14598255*  -0.15016130*                -0.04927291*
                            0.003         0.002                       0.019 
                           (0.05)        (0.05)                      (0.02) 
Year=2015              0.00000000    0.00000000                             
                                .             .                             
                              (.)           (.)                             
Year=2016              1.29698021*   1.33657366*   0.00000000               
                            0.011         0.009             .               
                           (0.51)        (0.51)           (.)               
Year=2017              1.34308359*   1.37746302*  -0.02736657*              
                            0.009         0.008         0.037               
                           (0.51)        (0.52)        (0.01)               
Year=2018              1.40032550*   1.43764656*  -0.07296659*              
                            0.006         0.005         0.000               
                           (0.51)        (0.52)        (0.01)               
Year=2019              1.48314586*   1.51836068*  -0.08360875*              
                            0.005         0.004         0.000               
                           (0.53)        (0.53)        (0.02)               
Year=2020              1.52629519*   1.56151609*  -0.03838346*              
                            0.004         0.004         0.035               
                           (0.53)        (0.54)        (0.02)               
interaction_wealt~un                 0.00627708*  -0.00628361               
                                          0.000         0.740               
                                         (0.00)        (0.02)               
logporkbarrel                                      0.04499523               
                                                        0.771               
                                                       (0.15)               
loggovfunding                                     -0.01126464               
                                                        0.858               
                                                       (0.06)               
logmunfunding                                      0.00086395               
                                                        0.776               
                                                       (0.00)               
ppoverty                                          -0.15655568*              
                                                        0.004               
                                                       (0.05)               
phealthplan                                        0.06832564               
                                                        0.567               
                                                       (0.12)               
totalosc                                           0.02146136*              
                                                        0.000               
                                                       (0.00)               
logpib                                            -0.07700435*              
                                                        0.001               
                                                       (0.02)               
L.healthnpdensity                                                0.71726151*
                                                                      0.000 
                                                                     (0.01) 
constant               1.40017953*   1.39288011*  -0.53655121+   0.37569116 
                            0.000         0.000         0.068         0.107 
                           (0.01)        (0.01)        (0.29)        (0.23) 
----------------------------------------------------------------------------
r2                     0.49690638    0.49738517    0.86131896               
rho                    0.99460074    0.99459916    0.99376898               
df_r                 5569.00000000  5569.00000000  5569.00000000               
bic                  80398.07256654  80376.66912299  23475.61478340             . 
N                    33420.00000000  33420.00000000  27850.00000000  22280.00000000 
----------------------------------------------------------------------------
+ p<0.10, * p<0.05

. 

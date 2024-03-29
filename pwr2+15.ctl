; EAGLE Autorouter Control File

[Default]

  RoutingGrid     = 50mil

  ; Trace Parameters:

  tpViaShape      = round

  ; Extended parameters:

  AutoGrid        = 1
  Efforts         = 2
  TopRouterVariant  = 1

  ; Preferred Directions:

  PrefDir.1       = a
  PrefDir.2       = a
  PrefDir.3       = 0
  PrefDir.4       = 0
  PrefDir.5       = 0
  PrefDir.6       = 0
  PrefDir.7       = 0
  PrefDir.8       = 0
  PrefDir.9       = 0
  PrefDir.10      = 0
  PrefDir.11      = 0
  PrefDir.12      = 0
  PrefDir.13      = 0
  PrefDir.14      = 0
  PrefDir.15      = a
  PrefDir.16      = a

  Active          =    1
  ; Cost Factors:

  cfVia           =    8
  cfNonPref       =    5
  cfChangeDir     =    2
  cfOrthStep      =    2
  cfDiagStep      =    3
  cfExtdStep      =    0
  cfBonusStep     =    1
  cfMalusStep     =    1
  cfPadImpact     =    4
  cfSmdImpact     =    4
  cfBusImpact     =    0
  cfHugging       =    3
  cfAvoid         =    4
  cfPolygon       =   10

  cfBase.1        =    99
  cfBase.2        =    0
  cfBase.3        =    99
  cfBase.4        =    99
  cfBase.5        =    99
  cfBase.6        =    99
  cfBase.7        =    99
  cfBase.8        =    99
  cfBase.9        =    99
  cfBase.10       =    99
  cfBase.11       =    99
  cfBase.12       =    99
  cfBase.13       =    99
  cfBase.14       =    99
  cfBase.15       =    0
  cfBase.16       =    99

  ; Maximum Number of...:

  mnVias          = 9999
  mnSegments      = 9999
  mnExtdSteps     = 9999
  mnRipupLevel    =   10
  mnRipupSteps    =  100
  mnRipupTotal    =  100

[Follow-me]

  @Route

  Active          =    1

[Busses]

  @Route

  Active          =    1
  cfNonPref       =    4
  cfBusImpact     =    4
  cfHugging       =    0
  mnVias          =    0

[Route]

  @Default

  Active          =    1

[Optimize1]

  @Route

  Active          =    0
  cfVia           =   99
  cfExtdStep      =   10
  cfHugging       =    1
  mnExtdSteps     =    1
  mnRipupLevel    =    0

[Optimize2]

  @Optimize1

  Active          =    0
  cfNonPref       =    0
  cfChangeDir     =    6
  cfExtdStep      =    0
  cfBonusStep     =    2
  cfMalusStep     =    2
  cfPadImpact     =    2
  cfSmdImpact     =    2
  cfHugging       =    0

[Optimize3]

  @Optimize2

  Active          =    0
  cfChangeDir     =    8
  cfPadImpact     =    0
  cfSmdImpact     =    0

[Optimize4]

  @Optimize3

  Active          =    0
  cfChangeDir     =   25


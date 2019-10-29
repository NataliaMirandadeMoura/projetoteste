¡

‰C:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.Sager.Calculo.API\Configurations\SwaggerConfig.cs
	namespace 	
Template
 
. 
API 
. 
Configurations %
{ 
public 

class 
SwaggerConfig 
{		 
public

 
bool

 
Enabled

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Version 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
RoutePrefix !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
bool 
IncludeSecurity #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} È
ŠC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.Sager.Calculo.API\Controllers\CalculoController.cs
	namespace

 	
Template


 
.

 
Controllers

 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
CalculoController "
:# $
ControllerBase% 3
{ 
public 
CalculoController  
(  !
)! "
{ 	
} 	
[ 	
HttpPost	 
] 
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
Accepted2 :
): ;
]; <
[ 	 
ProducesResponseType	 
( 
typeof $
($ %
ErroResponse% 1
)1 2
,2 3
(4 5
int5 8
)8 9
HttpStatusCode9 G
.G H

BadRequestH R
)R S
]S T
[ 	 
ProducesResponseType	 
( 
( 
int "
)" #
HttpStatusCode# 1
.1 2
InternalServerError2 E
)E F
]F G
public 
async 
Task 
< 
IActionResult '
>' (
Calcular) 1
(1 2$
CalcularParametroHPModel2 J
modelK P
)P Q
{ 	
model 
. 

DataInicio 
= 
new "
DateTime# +
(+ ,
model, 1
.1 2

DataInicio2 <
.< =
Year= A
,A B
modelC H
.H I

DataInicioI S
.S T
MonthT Y
,Y Z
$num[ \
)\ ]
.] ^
Date^ b
;b c
model 
. 
DataFim 
= 
new 
DateTime  (
(( )
model) .
.. /
DataFim/ 6
.6 7
Year7 ;
,; <
model= B
.B C
DataFimC J
.J K
MonthK P
,P Q
$numR S
)S T
.T U
	AddMonthsU ^
(^ _
$num_ `
)` a
.a b

AddMinutesb l
(l m
-m n
$numn o
)o p
;p q
return%% 
Accepted%% 
(%% 
)%% 
;%% 
}&& 	
}'' 
}(( ê2
‰C:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.Sager.Calculo.API\Extensions\SwaggerExtensions.cs
	namespace 	
Template
 
. 
API 
. 

Extensions !
{ 
public		 

static		 
class		 
SwaggerExtensions		 )
{

 
public 
static 
IServiceCollection (
AddSwaggerDocs) 7
(7 8
this8 <
IServiceCollection= O
servicesP X
)X Y
{ 	
SwaggerConfig 
options !
;! "
using 
( 
var 
serviceProvider &
=' (
services) 1
.1 2 
BuildServiceProvider2 F
(F G
)G H
)H I
{ 
var 
configuration !
=" #
serviceProvider$ 3
.3 4

GetService4 >
<> ?
IConfiguration? M
>M N
(N O
)O P
;P Q
options 
= 
configuration '
.' (

GetSection( 2
(2 3
$str3 <
)< =
.= >
Get> A
<A B
SwaggerConfigB O
>O P
(P Q
)Q R
;R S
} 
if 
( 
! 
options 
. 
Enabled  
)  !
{ 
return 
services 
;  
} 
return 
services 
. 
AddSwaggerGen )
() *
c* +
=>, .
{ 
c 
. 

SwaggerDoc 
( 
options $
.$ %
Name% )
,) *
new+ .
Info/ 3
{4 5
Title6 ;
=< =
options> E
.E F
TitleF K
,K L
VersionM T
=U V
optionsW ^
.^ _
Version_ f
}g h
)h i
;i j
if 
( 
options 
. 
IncludeSecurity +
)+ ,
{ 
c 
. !
AddSecurityDefinition +
(+ ,
$str, 4
,4 5
new6 9
ApiKeyScheme: F
{ 
Description   #
=  $ %
$str!! w
,!!w x
Name"" 
="" 
$str"" .
,"". /
In## 
=## 
$str## %
,##% &
Type$$ 
=$$ 
$str$$ '
}%% 
)%% 
;%% 
}&& 
}'' 
)'' 
;'' 
}(( 	
public** 
static** 
void** 

AddSwagger** %
(**% &
this**& *
IServiceCollection**+ =
services**> F
)**F G
{++ 	
services,, 
.,, 
AddSwaggerGen,, "
(,," #
c,,# $
=>,,% '
{-- 
c.. 
... 

SwaggerDoc.. 
(.. 
$str.. !
,..! "
new..# &
Info..' +
{.., -
Title// 
=// 
$str// %
,//% &
Version00 
=00 
$str00 "
}11 
)11 
;11 
}22 
)22 
;22 
}33 	
public55 
static55 
void55 

UseSwagger55 %
(55% &
this55& *
IApplicationBuilder55+ >
app55? B
)55B C
{66 	
app88 
.88 

UseSwagger88 
(88 
)88 
;88 
app;; 
.;; 
UseSwaggerUI;; 
(;; 
opt;;  
=>;;! #
{<< 
opt== 
.== 
SwaggerEndpoint== #
(==# $
$str==$ >
,==> ?
$str==@ L
)==L M
;==M N
}>> 
)>> 
;>> 
}?? 	
publicAA 
staticAA 
IApplicationBuilderAA )
UseSwaggerDocsAA* 8
(AA8 9
thisAA9 =
IApplicationBuilderAA> Q
builderAAR Y
)AAY Z
{BB 	
varCC 
optionsCC 
=CC 
builderCC !
.CC! "
ApplicationServicesCC" 5
.CC5 6

GetServiceCC6 @
<CC@ A
IConfigurationCCA O
>CCO P
(CCP Q
)CCQ R
.CCR S

GetSectionCCS ]
(CC] ^
$strCC^ g
)CCg h
.CCh i
GetCCi l
<CCl m
SwaggerConfigCCm z
>CCz {
(CC{ |
)CC| }
;CC} ~
ifEE 
(EE 
!EE 
optionsEE 
.EE 
EnabledEE  
)EE  !
{FF 
returnGG 
builderGG 
;GG 
}HH 
varJJ 
routePrefixJJ 
=JJ 
stringJJ $
.JJ$ %
IsNullOrWhiteSpaceJJ% 7
(JJ7 8
optionsJJ8 ?
.JJ? @
RoutePrefixJJ@ K
)JJK L
?JJM N
$strJJO X
:JJY Z
optionsJJ[ b
.JJb c
RoutePrefixJJc n
;JJn o
builderLL 
.LL 
UseStaticFilesLL "
(LL" #
)LL# $
.MM 

UseSwaggerMM 
(MM 
cMM 
=>MM  
cMM! "
.MM" #
RouteTemplateMM# 0
=MM1 2
routePrefixMM3 >
+MM? @
$strMMA _
)MM_ `
;MM` a
returnOO 
builderOO 
.OO 
UseSwaggerUIOO '
(OO' (
cOO( )
=>OO* ,
{PP 
cQQ 
.QQ 
SwaggerEndpointQQ %
(QQ% &
$"QQ& (
/QQ( )
{QQ) *
routePrefixQQ* 5
}QQ5 6
/QQ6 7
{QQ7 8
optionsQQ8 ?
.QQ? @
NameQQ@ D
}QQD E
/swagger.jsonQQE R
"QQR S
,QQS T
optionsQQU \
.QQ\ ]
TitleQQ] b
)QQb c
;QQc d
cRR 
.RR 
RoutePrefixRR !
=RR" #
routePrefixRR$ /
;RR/ 0
}SS 
)SS 
;SS 
}TT 	
}UU 
}VV û
€C:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.Sager.Calculo.API\Models\ErroResponse.cs
	namespace 	
ONS
 
. 
Sager 
. 
Calculo 
. 
API 
.  
Models  &
{ 
public 

class 
ErroResponse 
{		 
public

 
ICollection

 
<

 
string

 !
>

! "
Erros

# (
{

) *
get

+ .
;

. /
set

0 3
;

3 4
}

5 6
} 
} –	
tC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.Sager.Calculo.API\Program.cs
	namespace 	
Template
 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	 
CreateWebHostBuilder  
(  !
args! %
)% &
.& '
Build' ,
(, -
)- .
.. /
Run/ 2
(2 3
)3 4
;4 5
} 	
public 
static 
IWebHostBuilder % 
CreateWebHostBuilder& :
(: ;
string; A
[A B
]B C
argsD H
)H I
=>J L
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 

UseStartup 
< 
Startup #
># $
($ %
)% &
;& '
} 
} Ì
tC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.Sager.Calculo.API\Startup.cs
	namespace 	
Template
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddMvc 
( 
) 
. #
SetCompatibilityVersion 5
(5 6 
CompatibilityVersion6 J
.J K
Version_2_2K V
)V W
;W X
services 
. 
AddSwaggerDocs #
(# $
)$ %
;% &
services 
. 
AddBusinessServices (
(( )
)) *
;* +
services 
. 
AddRepositories $
($ %
)% &
;& '
services 
. 
UseSDK 
( 
) 
; 
} 	
public 
void 
	Configure 
( 
IApplicationBuilder 1
app2 5
,5 6
IHostingEnvironment7 J
envK N
)N O
{   	
if!! 
(!! 
env!! 
.!! 
IsDevelopment!! !
(!!! "
)!!" #
)!!# $
{"" 
app## 
.## %
UseDeveloperExceptionPage## -
(##- .
)##. /
;##/ 0
}$$ 
else%% 
{&& 
app(( 
.(( 
UseHsts(( 
((( 
)(( 
;(( 
})) 
app++ 
.++ 
UseHttpsRedirection++ #
(++# $
)++$ %
;++% &
app,, 
.,, 
UseMvc,, 
(,, 
),, 
;,, 
app-- 
.-- 
UseSwaggerDocs-- 
(-- 
)--  
;--  !
}.. 	
}// 
}00 
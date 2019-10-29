Ô.
ÉC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.Calculo.Business\DomainServiceBase.cs
	namespace 	
ONS
 
. 
SAGER 
. 
Calculo 
. 
Business $
.$ %
Impl% )
{ 
public		 

class		 
DomainServiceBase		 "
{

 
public 
IContext 
Context 
=>  "
SDKConfiguration# 3
.3 4
ServiceProvider4 C
.C D

GetServiceD N
<N O
IExecutionContextO `
>` a
(a b
)b c
. 
ExecutionParameter 
?  
.  !
Context! (
;( )
public  
IEventManagerService #
EventManagerService$ 7
=>8 :
SDKConfiguration; K
.K L
ServiceProviderL [
.[ \

GetService\ f
<f g 
IEventManagerServiceg {
>{ |
(| }
)} ~
;~ 
	protected 
void 
	EmitEvent  
<  !
T! "
>" #
(# $
string$ *
	eventName+ 4
,4 5
T6 7
payload8 ?
,? @
boolA E
disableSaveContextF X
=Y Z
true[ _
,_ `
boola e
reuseContextf r
=s t
trueu y
,y z
bool{ 
afterExecution
Ä é
=
è ê
false
ë ñ
)
ñ ó
where
ò ù
T
û ü
:
† °
IPayload
¢ ™
{ 	
var 
eventOut 
= 
new 
MemoryEvent *
(* +
)+ ,
{ 
Name 
= 
	eventName  
,  !
Payload 
= 
payload !
} 
; 
	EmitEvent 
( 
eventOut 
, 
disableSaveContext  2
,2 3
reuseContext4 @
,@ A
afterExecutionB P
)P Q
;Q R
} 	
	protected 
void 
	EmitEvent  
(  !
MemoryEvent! ,
eventOut- 5
,5 6
bool7 ;
disableSaveContext< N
=O P
trueQ U
,U V
boolW [
reuseContext\ h
=i j
truek o
,o p
boolq u
afterExecution	v Ñ
=
Ö Ü
false
á å
)
å ç
{ 	
if 
( 
Context 
!= 
null 
&&  "
reuseContext# /
)/ 0
{ 
var   
eventContext    
=  ! "
Context  # *
.  * +
GetEvent  + 3
(  3 4
)  4 5
;  5 6
eventOut"" 
."" 

InstanceId"" #
=""$ %
Context""& -
.""- .

InstanceId"". 8
;""8 9
eventOut## 
.## 
Tag## 
=## 
eventContext## +
.##+ ,
Tag##, /
;##/ 0
eventOut$$ 
.$$ 
Branch$$ 
=$$  !
eventContext$$" .
.$$. /
Branch$$/ 5
;$$5 6
eventOut%% 
.%% 
	Reprocess%% "
=%%# $
eventContext%%% 1
.%%1 2
	Reprocess%%2 ;
;%%; <
if'' 
('' 
!'' 
afterExecution'' #
)''# $
{(( 
Context)) 
.)) 
Memory)) "
.))" #
Event))# (
.))( )
Name))) -
=)). /
eventOut))0 8
.))8 9
Name))9 =
;))= >
Context** 
.** 
Memory** "
.**" #
Event**# (
.**( )
Payload**) 0
=**1 2
eventOut**3 ;
.**; <
Payload**< C
;**C D
Context++ 
.++ 
GetEvent++ $
(++$ %
)++% &
.++& '

SetPayload++' 1
(++1 2
(++2 3
IPayload++3 ;
)++; <
eventOut++< D
.++D E
Payload++E L
)++L M
;++M N
Context,, 
.,, 
DisableSaveContext,, .
=,,/ 0
disableSaveContext,,1 C
;,,C D
var..  
processMemoryService.. ,
=..- .
(// 
SDK// 
.// 
Services// %
.//% &
ProcessMemory//& 3
.//3 4!
IProcessMemoryService//4 I
)//I J
SDK//J M
.//M N
Configuration//N [
.//[ \
SDKConfiguration//\ l
.//l m
ServiceProvider//m |
.//| }

GetService	//} á
(
//á à
typeof00 "
(00" #
SDK00# &
.00& '
Services00' /
.00/ 0
ProcessMemory000 =
.00= >!
IProcessMemoryService00> S
)00S T
)00T U
;00U V 
processMemoryService11 (
.11( )
Commit11) /
(11/ 0
Context110 7
.117 8
UpdateMemory118 D
(11D E
)11E F
)11F G
;11G H
}22 
}33 
if55 
(55 
!55 
afterExecution55 
)55  
{66 
EventManagerService77 #
.77# $
Push77$ (
(77( )
eventOut77) 1
)771 2
;772 3
}88 
else99 
{:: 
Context;; 
.;; 
EventsToSend;; $
.;;$ %
Add;;% (
(;;( )
eventOut;;) 1
);;1 2
;;;2 3
}<< 
}== 	
}>> 
}?? ¥
èC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.Calculo.Business\Extensions\BusinessExtensions.cs
	namespace 	
ONS
 
. 
SAGER 
. 
Calculo 
. 
Business $
.$ %
Impl% )
.) *

Extensions* 4
{ 
public 

static 
class 
BusinessExtensions *
{ 
public 
static 
void 
AddBusinessServices .
(. /
this/ 3
IServiceCollection4 F
servicesG O
)O P
{		 	
services

 
.

 
	AddScoped

 
<

 
IParametroHPService

 2
,

2 3
ParametroHPService

4 F
>

F G
(

G H
)

H I
;

I J
} 	
} 
} ©≤
ÑC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.Calculo.Business\ParametroHPService.cs
	namespace 	
Business
 
{ 
public 

class 
ParametroHPService #
:$ %
DomainServiceBase& 7
,7 8
IParametroHPService9 L
{ 
private 
static 
readonly 
string  &
NOME_TIPO_CALCULO' 8
=9 :
$str; ?
;? @
private 
readonly 
IExecutionContext *
_executionContext+ <
;< =
private 
readonly 
IEventoRepository *
_eventoRepository+ <
;< =
private 
readonly &
IUnidadeGeradoraRepository 3&
_unidadeGeradoraRepository4 N
;N O
public 
ParametroHPService !
(! "
IExecutionContext 
executionContext .
,. /
IEventoRepository 
eventoRepository .
,. /&
IUnidadeGeradoraRepository &%
unidadeGeradoraRepository' @
)@ A
{ 	
_executionContext 
= 
executionContext  0
;0 1
_eventoRepository 
= 
eventoRepository  0
;0 1&
_unidadeGeradoraRepository &
=' (%
unidadeGeradoraRepository) B
;B C
} 	
[   	
SDKEvent  	 
(   
CalculoEvent   
.   &
ConcluirCalculoParametroHP   9
)  9 :
]  : ;
public!! 
async!! 
Task!! 
Executar!! "
(!!" #$
CalcularParametroHPModel!!# ;
model!!< A
)!!A B
{"" 	
_executionContext$$ 
.$$ 
ExecutionParameter$$ 0
.$$0 1
Context$$1 8
.$$8 9
Memory$$9 ?
.$$? @
Commit$$@ F
=$$G H
true$$I M
;$$M N
_executionContext%% 
.%% 
ExecutionParameter%% 0
.%%0 1"
SynchronousPersistence%%1 G
=%%H I
false%%J O
;%%O P
_executionContext&& 
.&& 
ExecutionParameter&& 0
.&&0 1
MemoryEvent&&1 <
.&&< =
Branch&&= C
=&&D E
model&&F K
.&&K L
	CenarioId&&L U
;&&U V
var** 
periodoCalculo** 
=**  &
ExtrairListaMesesDoPeriodo**! ;
(**; <
model**< A
.**A B

DataInicio**B L
,**L M
model**N S
.**S T
DataFim**T [
)**[ \
.**\ ]
OrderBy**] d
(**d e
e**e f
=>**g i
e**j k
.**k l
PrimeiroMinuto**l z
(**z {
)**{ |
)**| }
;**} ~
var,, 
unidadeGeradora,, 
=,,  !
await,," '&
_unidadeGeradoraRepository,,( B
.,,B C

ObterPorId,,C M
(,,M N
model,,N S
.,,S T
UnidadeGeradoraId,,T e
),,e f
;,,f g
if.. 
(.. 
unidadeGeradora.. 
is..  "
null..# '
)..' (
{// 
throw00 
new00 %
InvalidOperationException00 3
(003 4
$"004 6
{006 7
nameof007 =
(00= >
unidadeGeradora00> M
)00M N
}00N O
 n√£o pode ser nula00O a
"00a b
)00b c
;00c d
}11 
var44 '
suspensoesUnidadesGeradoras44 +
=44, -&
_unidadeGeradoraRepository44. H
.44H I
ObterSuspensoes44I X
(44X Y
unidadeGeradora44Y h
.44h i
Id44i k
,44k l
model44m r
.44r s
	CenarioId44s |
)44| }
;44} ~
var77 
eventos77 
=77 
_eventoRepository77 +
.77+ ,
ObterEventos77, 8
(778 9
periodoCalculo779 G
.77G H
First77H M
(77M N
)77N O
.77O P
PrimeiroMinuto77P ^
(77^ _
)77_ `
,77` a
periodoCalculo77b p
.77p q
Last77q u
(77u v
)77v w
.77w x
UltimoMinutoMes	77x á
(
77á à
)
77à â
,
77â ä
unidadeGeradora
77ã ö
.
77ö õ
Id
77õ ù
)
77ù û
;
77û ü
await99 
Task99 
.99 
WhenAll99 
(99 '
suspensoesUnidadesGeradoras99 :
,99: ;
eventos99< C
)99C D
;99D E
var<< 
mesesCalculados<< 
=<<  !

CalcularHP<<" ,
(<<, -
unidadeGeradora<<- <
,<<< ='
suspensoesUnidadesGeradoras<<> Y
.<<Y Z
Result<<Z `
,<<` a
eventos<<b i
.<<i j
Result<<j p
,<<p q
periodoCalculo	<<r Ä
)
<<Ä Å
;
<<Å Ç
foreach?? 
(?? 
var?? 
mesCalculado?? %
in??& (
mesesCalculados??) 8
)??8 9
{@@ 
	EmitEventAA 
(AA 
CalculoEventAA &
.AA& '&
ConcluirCalculoParametroHPAA' A
,AAA B
newAAC F$
ConcluirParametroHPModelAAG _
(AA_ `
)AA` a
{BB 
	CenarioIdCC 
=CC 
modelCC  %
.CC% &
	CenarioIdCC& /
,CC/ 0
UnidadeGeradoraIdDD %
=DD& '
unidadeGeradoraDD( 7
.DD7 8
IdDD8 :
,DD: ;
MesAnoEE 
=EE 
mesCalculadoEE )
.EE) *
MesAnoEE* 0
.EE0 1
PrimeiroMinutoEE1 ?
(EE? @
)EE@ A
,EEA B
NomeTipoCalculoGG #
=GG$ %
NOME_TIPO_CALCULOGG& 7
}II 
,II 
reuseContextII 
:II  
falseII! &
)II& '
;II' (
}NN 
}OO 	
privateQQ 
ListQQ 
<QQ 
CalculoParametroHPQQ '
>QQ' (

CalcularHPQQ) 3
(QQ3 4
UnidadeGeradoraQQ4 C
unidadeGeradoraQQD S
,QQS T
IEnumerableQQU `
<QQ` a$
SuspensaoUnidadeGeradoraQQa y
>QQy z(
suspensoesUnidadesGeradoras	QQ{ ñ
,
QQñ ó
List
QQò ú
<
QQú ù*
EventoMudancaEstadoOperativo
QQù π
>
QQπ ∫
eventos
QQª ¬
,
QQ¬ √ 
IOrderedEnumerable
QQƒ ÷
<
QQ÷ ◊
Data
QQ◊ €
>
QQ€ ‹
periodoCalculo
QQ› Î
)
QQÎ Ï
{RR 	
varUU $
entradaOperacaoComercialUU (
=UU) *
unidadeGeradoraUU+ :
.UU: ;
DataEventoEOCUU; H
??UUI K
unidadeGeradoraUUL [
.UU[ \
DataEntradaOperacaoUU\ o
.UUo p
ValueUUp u
;UUu v
varVV 
mesesCalculadosVV 
=VV  !
newVV" %
ListVV& *
<VV* +
CalculoParametroHPVV+ =
>VV= >
(VV> ?
)VV? @
;VV@ A
foreachXX 
(XX 
varXX 
mesAnoXX 
inXX  "
periodoCalculoXX# 1
)XX1 2
{YY 
varZZ 
duracaoTotalZZ  
=ZZ! "
newZZ# &
TimeSpanZZ' /
(ZZ/ 0
)ZZ0 1
;ZZ1 2
var\\ 
periodoInicio\\ !
=\\" #
mesAno\\$ *
.\\* +
PrimeiroMinuto\\+ 9
(\\9 :
)\\: ;
;\\; <
var]] 

periodoFim]] 
=]]  
mesAno]]! '
.]]' ($
PrimeiroMinutoProximoMes]]( @
(]]@ A
)]]A B
;]]B C
var__ 

dataInicio__ 
=__  $
entradaOperacaoComercial__! 9
<__: ;
periodoInicio__< I
?__J K
periodoInicio__L Y
:__Z [$
entradaOperacaoComercial__\ t
;__t u
var`` 
dataFim`` 
=`` 
unidadeGeradora`` -
.``- .
DataDesativacao``. =
is``> @
null``A E
||``F H
unidadeGeradora``I X
.``X Y
DataDesativacao``Y h
.``h i
Value``i n
>``o p

periodoFim``q {
?``| }

periodoFim	``~ à
:
``â ä
unidadeGeradora
``ã ö
.
``ö õ
DataDesativacao
``õ ™
;
``™ ´
forbb 
(bb 
LinkedListNodebb #
<bb# $(
EventoMudancaEstadoOperativobb$ @
>bb@ A
eventobbB H
=bbI J
EventosNoPeriodobbK [
(bb[ \
eventosbb\ c
,bbc d

dataIniciobbe o
,bbo p
dataFimbbq x
)bbx y
.bby z
Firstbbz 
;	bb Ä
evento
bbÅ á
!=
bbà ä
null
bbã è
;
bbè ê
)
bbê ë
{cc 
vardd 
duracaodd 
=dd  !
CalcularDuracaodd" 1
(dd1 2
eventodd2 8
)dd8 9
;dd9 :
ifff 
(ff 
dataFimff 
.ff  
HasValueff  (
&&ff) +
eventoff, 2
.ff2 3
Valueff3 8
.ff8 9
DataVerificadaff9 G
+ffH I
duracaoffJ Q
>ffR S
dataFimffT [
)ff[ \
duracaogg 
=gg  !
dataFimgg" )
.gg) *
Valuegg* /
-gg0 1
(gg2 3
DateTimegg3 ;
)gg; <
eventogg< B
.ggB C
ValueggC H
.ggH I
DataVerificadaggI W
;ggW X
ifhh 
(hh '
suspensoesUnidadesGeradorashh 3
.hh3 4
Anyhh4 7
(hh7 8
)hh8 9
)hh9 :
duracaoii 
=ii  !<
0RecalcularDuracaoEventoConsiderandoSuspensoesUgeii" R
(iiR S'
suspensoesUnidadesGeradorasiiS n
,iin o
(iip q
DateTimeiiq y
)iiy z
evento	iiz Ä
.
iiÄ Å
Value
iiÅ Ü
.
iiÜ á
DataVerificada
iiá ï
,
iiï ñ
duracao
iió û
)
iiû ü
;
iiü †
duracaoTotaljj  
+=jj! #
duracaojj$ +
;jj+ ,
}kk 
mesesCalculadosll 
.ll  
Addll  #
(ll# $
newll$ '
CalculoParametroHPll( :
(ll: ;
)ll; <
{mm 
MesAnonn 
=nn 
mesAnonn #
,nn# $
	Resultadooo 
=oo 
duracaoTotaloo  ,
}pp 
)pp 
;pp 
}qq 
returnrr 
mesesCalculadosrr "
;rr" #
}ss 	
privatevv 
TimeSpanvv 
CalcularDuracaovv (
(vv( )
LinkedListNodevv) 7
<vv7 8(
EventoMudancaEstadoOperativovv8 T
>vvT U

referenciavvV `
,vv` a
DateTimevvb j
?vvj k
fimvvl o
=vvp q
nullvvr v
)vvv w
{ww 	
varxx 
dataVerificadaxx 
=xx  

referenciaxx! +
.xx+ ,
Valuexx, 1
.xx1 2
DataVerificadaxx2 @
??xxA C
throwyy 
newyy 
ArgumentExceptionyy +
(yy+ ,
$stryy, E
)yyE F
;yyF G
varzz 
proximaVerificadazz !
=zz" #

referenciazz$ .
.zz. /
Nextzz/ 3
!=zz4 6
nullzz7 ;
?zz< =

referencia{{ 
.{{ 
Next{{ 
.{{  
Value{{  %
.{{% &
DataVerificada{{& 4
??{{5 7
throw|| 
new|| 
ArgumentException|| +
(||+ ,
$str||, E
)||E F
:||G H
new||I L
DateTime||M U
(||U V
dataVerificada||V d
.||d e
	AddMonths||e n
(||n o
$num||o p
)||p q
.||q r
Year||r v
,||v w
dataVerificada	||x Ü
.
||Ü á
	AddMonths
||á ê
(
||ê ë
$num
||ë í
)
||í ì
.
||ì î
Month
||î ô
,
||ô ö
$num
||õ ú
,
||ú ù
$num
||û ü
,
||ü †
$num
||° ¢
,
||¢ £
$num
||§ •
)
||• ¶
;
||¶ ß
return~~ 
fim~~ 
.~~ 
HasValue~~ 
&&~~  "
fim~~# &
<~~' (
proximaVerificada~~) :
?~~; <
fim~~= @
.~~@ A
Value~~A F
-~~G H
dataVerificada~~I W
:~~X Y
proximaVerificada~~Z k
-~~l m
dataVerificada~~n |
;~~| }
} 	
private
ÅÅ 
TimeSpan
ÅÅ >
0RecalcularDuracaoEventoConsiderandoSuspensoesUge
ÅÅ I
(
ÅÅI J
IEnumerable
ÅÅJ U
<
ÅÅU V&
SuspensaoUnidadeGeradora
ÅÅV n
>
ÅÅn o

suspensoes
ÅÅp z
,
ÅÅz {
DateTimeÅÅ| Ñ
dataVerificadaÅÅÖ ì
,ÅÅì î
TimeSpanÅÅï ù
duracaoEventoÅÅû ´
)ÅÅ´ ¨
{
ÇÇ 	
var
ÉÉ 
periodoEvento
ÉÉ 
=
ÉÉ 
new
ÉÉ  #
Periodo
ÉÉ$ +
(
ÉÉ+ ,
dataVerificada
ÉÉ, :
,
ÉÉ: ;
dataVerificada
ÉÉ< J
+
ÉÉK L
duracaoEvento
ÉÉM Z
)
ÉÉZ [
;
ÉÉ[ \
var
ÖÖ +
suspensoesAfetamDuracaoEvento
ÖÖ -
=
ÖÖ. /

suspensoes
ÖÖ0 :
.
ÖÖ: ;
Where
ÖÖ; @
(
ÖÖ@ A
	suspensao
ÖÖA J
=>
ÖÖK M
	suspensao
ÜÜ 
.
ÜÜ 
Periodo
ÜÜ !
.
ÜÜ! "

Intersecao
ÜÜ" ,
(
ÜÜ, -
periodoEvento
ÜÜ- :
)
ÜÜ: ;
)
áá 
.
áá 
ToList
áá 
(
áá 
)
áá 
;
áá 
if
àà 
(
àà 
!
àà 

suspensoes
àà 
.
àà 
Any
àà 
(
àà  
)
àà  !
||
àà" $
!
àà% &+
suspensoesAfetamDuracaoEvento
àà& C
.
ààC D
Any
ààD G
(
ààG H
)
ààH I
)
ààI J
return
ààK Q
duracaoEvento
ààR _
;
àà_ `
var
ää +
duracaoSuspensoesDentroEvento
ää -
=
ää. /
new
ää0 3
TimeSpan
ää4 <
(
ää< =
)
ää= >
;
ää> ?+
suspensoesAfetamDuracaoEvento
ãã )
.
ãã) *
ForEach
ãã* 1
(
ãã1 2
susp
ãã2 6
=>
ãã7 9
{
åå +
duracaoSuspensoesDentroEvento
çç -
+=
çç. 01
#ObterDuracaoSuspensaoDentroDoEvento
çç1 T
(
ççT U
periodoEvento
ççU b
.
ççb c
Inicio
ççc i
,
ççi j
periodoEvento
ççk x
.
ççx y
Fim
ççy |
.
çç| }
Valueçç} Ç
,ççÇ É
suspççÑ à
)ççà â
;ççâ ä
}
éé 
)
éé 
;
éé 
return
èè +
duracaoSuspensoesDentroEvento
èè 0
>
èè1 2
duracaoEvento
èè3 @
?
èèA B
new
èèC F
TimeSpan
èèG O
(
èèO P
)
èèP Q
:
èèR S
duracaoEvento
èèT a
-
èèb c,
duracaoSuspensoesDentroEventoèèd Å
;èèÅ Ç
}
êê 	
private
íí 
TimeSpan
íí 1
#ObterDuracaoSuspensaoDentroDoEvento
íí <
(
íí< =
DateTime
íí= E
dataInicioEvento
ííF V
,
ííV W
DateTime
ííX `
dataFimEvento
íía n
,
íín o'
SuspensaoUnidadeGeradoraííp à
	suspensaoííâ í
)ííí ì
{
ìì 	
TimeSpan
îî 
duracaoSuspensao
îî %
=
îî& '
new
îî( +
TimeSpan
îî, 4
(
îî4 5
)
îî5 6
;
îî6 7
var
ïï 
duracaoEvento
ïï 
=
ïï 
(
ïï  !
dataFimEvento
ïï! .
-
ïï/ 0
dataInicioEvento
ïï1 A
)
ïïA B
;
ïïB C
if
ññ 
(
ññ 
	suspensao
ññ 
.
ññ 
Periodo
ññ !
.
ññ! "
Fim
ññ" %
.
ññ% &
HasValue
ññ& .
)
ññ. /
{
óó 
if
òò 
(
òò 
	suspensao
òò 
.
òò 
Periodo
òò %
.
òò% &
Inicio
òò& ,
>=
òò- /
dataInicioEvento
òò0 @
)
òò@ A
duracaoSuspensao
ôô $
+=
ôô% '
TimeSpan
ôô( 0
.
ôô0 1
	FromHours
ôô1 :
(
ôô: ;
Math
ôô; ?
.
ôô? @
Abs
ôô@ C
(
ôôC D
(
ôôD E
	suspensao
ôôE N
.
ôôN O
Periodo
ôôO V
.
ôôV W
Inicio
ôôW ]
-
ôô^ _
dataInicioEvento
ôô` p
)
ôôp q
.
ôôq r

TotalHours
ôôr |
)
ôô| }
)
ôô} ~
;
ôô~ 
if
öö 
(
öö 
	suspensao
öö 
.
öö 
Periodo
öö %
.
öö% &
Fim
öö& )
<=
öö* ,
dataFimEvento
öö- :
)
öö: ;
duracaoSuspensao
õõ $
+=
õõ% '
TimeSpan
õõ( 0
.
õõ0 1
	FromHours
õõ1 :
(
õõ: ;
Math
õõ; ?
.
õõ? @
Abs
õõ@ C
(
õõC D
(
õõD E
	suspensao
õõE N
.
õõN O
Periodo
õõO V
.
õõV W
Fim
õõW Z
.
õõZ [
Value
õõ[ `
-
õõa b
dataFimEvento
õõc p
)
õõp q
.
õõq r

TotalHours
õõr |
)
õõ| }
)
õõ} ~
;
õõ~ 
if
úú 
(
úú 
	suspensao
úú 
.
úú 
Periodo
úú %
.
úú% &
Inicio
úú& ,
<=
úú- /
dataInicioEvento
úú0 @
&&
úúA C
	suspensao
úúD M
.
úúM N
Periodo
úúN U
.
úúU V
Fim
úúV Y
>=
úúZ \
dataFimEvento
úú] j
)
úúj k
return
ùù 
duracaoEvento
ùù (
;
ùù( )
}
ûû 
else
üü 
{
†† 
duracaoSuspensao
°°  
=
°°! "
TimeSpan
°°# +
.
°°+ ,
	FromHours
°°, 5
(
°°5 6
Math
°°6 :
.
°°: ;
Abs
°°; >
(
°°> ?
(
°°? @
dataInicioEvento
°°@ P
-
°°Q R
	suspensao
°°S \
.
°°\ ]
Periodo
°°] d
.
°°d e
Inicio
°°e k
)
°°k l
.
°°l m

TotalHours
°°m w
)
°°w x
)
°°x y
;
°°y z
}
¢¢ 
return
££ 
(
££ 
duracaoEvento
££ !
-
££" #
duracaoSuspensao
££$ 4
)
££4 5
.
££5 6

TotalHours
££6 @
<
££A B
$num
££C D
?
££E F
new
££G J
TimeSpan
££K S
(
££S T
)
££T U
:
££V W
duracaoEvento
££X e
-
££f g
duracaoSuspensao
££h x
;
££x y
}
§§ 	
private
¶¶ 

LinkedList
¶¶ 
<
¶¶ *
EventoMudancaEstadoOperativo
¶¶ 7
>
¶¶7 8
EventosNoPeriodo
¶¶9 I
(
¶¶I J
IEnumerable
¶¶J U
<
¶¶U V*
EventoMudancaEstadoOperativo
¶¶V r
>
¶¶r s
eventos
¶¶t {
,
¶¶{ |
DateTime¶¶} Ö

dataInicio¶¶Ü ê
,¶¶ê ë
DateTime¶¶í ö
?¶¶ö õ
dataFim¶¶ú £
)¶¶£ §
{
ßß 	
var
®® 
filtradoPorData
®® 
=
®®  !
dataFim
®®" )
.
®®) *
HasValue
®®* 2
?
®®3 4
eventos
®®5 <
.
®®< =
Where
®®= B
(
®®B C
e
®®C D
=>
®®E G
e
®®H I
.
®®I J
DataVerificada
®®J X
>=
®®Y [

dataInicio
®®\ f
&&
®®g i
e
®®j k
.
®®k l
DataVerificada
®®l z
<=
®®{ }
dataFim®®~ Ö
.®®Ö Ü
Value®®Ü ã
)®®ã å
.®®å ç
ToList®®ç ì
(®®ì î
)®®î ï
:®®ñ ó
eventos®®ò ü
.®®ü †
Where®®† •
(®®• ¶
e®®¶ ß
=>®®® ™
e®®´ ¨
.®®¨ ≠
DataVerificada®®≠ ª
>=®®º æ

dataInicio®®ø …
)®®…  
;®®  À
return
©© 
new
©© 

LinkedList
©© !
<
©©! "*
EventoMudancaEstadoOperativo
©©" >
>
©©> ?
(
©©? @
filtradoPorData
©©@ O
)
©©O P
;
©©P Q
}
™™ 	
private
¨¨ 
ICollection
¨¨ 
<
¨¨ 
Data
¨¨  
>
¨¨  !(
ExtrairListaMesesDoPeriodo
¨¨" <
(
¨¨< =
DateTime
¨¨= E
inicio
¨¨F L
,
¨¨L M
DateTime
¨¨N V
fim
¨¨W Z
)
¨¨Z [
{
≠≠ 	
var
ÆÆ 

listaMeses
ÆÆ 
=
ÆÆ 
new
ÆÆ  
List
ÆÆ! %
<
ÆÆ% &
Data
ÆÆ& *
>
ÆÆ* +
(
ÆÆ+ ,
)
ÆÆ, -
;
ÆÆ- .
inicio
ØØ 
=
ØØ 
new
ØØ 
DateTime
ØØ !
(
ØØ! "
inicio
ØØ" (
.
ØØ( )
Year
ØØ) -
,
ØØ- .
inicio
ØØ/ 5
.
ØØ5 6
Month
ØØ6 ;
,
ØØ; <
$num
ØØ= >
)
ØØ> ?
.
ØØ? @
Date
ØØ@ D
;
ØØD E
while
±± 
(
±± 
inicio
±± 
<
±± 
fim
±± 
)
±±  
{
≤≤ 

listaMeses
≥≥ 
.
≥≥ 
Add
≥≥ 
(
≥≥ 
new
≥≥ "
Data
≥≥# '
(
≥≥' (
inicio
≥≥( .
.
≥≥. /
Year
≥≥/ 3
,
≥≥3 4
inicio
≥≥5 ;
.
≥≥; <
Month
≥≥< A
)
≥≥A B
)
≥≥B C
;
≥≥C D
inicio
¥¥ 
=
¥¥ 
inicio
¥¥ 
.
¥¥  
	AddMonths
¥¥  )
(
¥¥) *
$num
¥¥* +
)
¥¥+ ,
;
¥¥, -
}
µµ 
return
∑∑ 

listaMeses
∑∑ 
;
∑∑ 
}
∏∏ 	
}
ππ 
}∫∫ 
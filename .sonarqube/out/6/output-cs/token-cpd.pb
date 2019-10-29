�.
�C:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.Calculo.Business\DomainServiceBase.cs
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
� �
=
� �
false
� �
)
� �
where
� �
T
� �
:
� �
IPayload
� �
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
afterExecution	v �
=
� �
false
� �
)
� �
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

GetService	//} �
(
//� �
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
}?? �
�C:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.Calculo.Business\Extensions\BusinessExtensions.cs
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
} ��
�C:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.Calculo.Business\ParametroHPService.cs
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
 não pode ser nula00O a
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
UltimoMinutoMes	77x �
(
77� �
)
77� �
,
77� �
unidadeGeradora
77� �
.
77� �
Id
77� �
)
77� �
;
77� �
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
periodoCalculo	<<r �
)
<<� �
;
<<� �
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
suspensoesUnidadesGeradoras	QQ{ �
,
QQ� �
List
QQ� �
<
QQ� �*
EventoMudancaEstadoOperativo
QQ� �
>
QQ� �
eventos
QQ� �
,
QQ� � 
IOrderedEnumerable
QQ� �
<
QQ� �
Data
QQ� �
>
QQ� �
periodoCalculo
QQ� �
)
QQ� �
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

periodoFim	``~ �
:
``� �
unidadeGeradora
``� �
.
``� �
DataDesativacao
``� �
;
``� �
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
;	bb �
evento
bb� �
!=
bb� �
null
bb� �
;
bb� �
)
bb� �
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
evento	iiz �
.
ii� �
Value
ii� �
.
ii� �
DataVerificada
ii� �
,
ii� �
duracao
ii� �
)
ii� �
;
ii� �
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
dataVerificada	||x �
.
||� �
	AddMonths
||� �
(
||� �
$num
||� �
)
||� �
.
||� �
Month
||� �
,
||� �
$num
||� �
,
||� �
$num
||� �
,
||� �
$num
||� �
,
||� �
$num
||� �
)
||� �
;
||� �
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
�� 
TimeSpan
�� >
0RecalcularDuracaoEventoConsiderandoSuspensoesUge
�� I
(
��I J
IEnumerable
��J U
<
��U V&
SuspensaoUnidadeGeradora
��V n
>
��n o

suspensoes
��p z
,
��z {
DateTime��| �
dataVerificada��� �
,��� �
TimeSpan��� �
duracaoEvento��� �
)��� �
{
�� 	
var
�� 
periodoEvento
�� 
=
�� 
new
��  #
Periodo
��$ +
(
��+ ,
dataVerificada
��, :
,
��: ;
dataVerificada
��< J
+
��K L
duracaoEvento
��M Z
)
��Z [
;
��[ \
var
�� +
suspensoesAfetamDuracaoEvento
�� -
=
��. /

suspensoes
��0 :
.
��: ;
Where
��; @
(
��@ A
	suspensao
��A J
=>
��K M
	suspensao
�� 
.
�� 
Periodo
�� !
.
��! "

Intersecao
��" ,
(
��, -
periodoEvento
��- :
)
��: ;
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
if
�� 
(
�� 
!
�� 

suspensoes
�� 
.
�� 
Any
�� 
(
��  
)
��  !
||
��" $
!
��% &+
suspensoesAfetamDuracaoEvento
��& C
.
��C D
Any
��D G
(
��G H
)
��H I
)
��I J
return
��K Q
duracaoEvento
��R _
;
��_ `
var
�� +
duracaoSuspensoesDentroEvento
�� -
=
��. /
new
��0 3
TimeSpan
��4 <
(
��< =
)
��= >
;
��> ?+
suspensoesAfetamDuracaoEvento
�� )
.
��) *
ForEach
��* 1
(
��1 2
susp
��2 6
=>
��7 9
{
�� +
duracaoSuspensoesDentroEvento
�� -
+=
��. 01
#ObterDuracaoSuspensaoDentroDoEvento
��1 T
(
��T U
periodoEvento
��U b
.
��b c
Inicio
��c i
,
��i j
periodoEvento
��k x
.
��x y
Fim
��y |
.
��| }
Value��} �
,��� �
susp��� �
)��� �
;��� �
}
�� 
)
�� 
;
�� 
return
�� +
duracaoSuspensoesDentroEvento
�� 0
>
��1 2
duracaoEvento
��3 @
?
��A B
new
��C F
TimeSpan
��G O
(
��O P
)
��P Q
:
��R S
duracaoEvento
��T a
-
��b c,
duracaoSuspensoesDentroEvento��d �
;��� �
}
�� 	
private
�� 
TimeSpan
�� 1
#ObterDuracaoSuspensaoDentroDoEvento
�� <
(
��< =
DateTime
��= E
dataInicioEvento
��F V
,
��V W
DateTime
��X `
dataFimEvento
��a n
,
��n o'
SuspensaoUnidadeGeradora��p �
	suspensao��� �
)��� �
{
�� 	
TimeSpan
�� 
duracaoSuspensao
�� %
=
��& '
new
��( +
TimeSpan
��, 4
(
��4 5
)
��5 6
;
��6 7
var
�� 
duracaoEvento
�� 
=
�� 
(
��  !
dataFimEvento
��! .
-
��/ 0
dataInicioEvento
��1 A
)
��A B
;
��B C
if
�� 
(
�� 
	suspensao
�� 
.
�� 
Periodo
�� !
.
��! "
Fim
��" %
.
��% &
HasValue
��& .
)
��. /
{
�� 
if
�� 
(
�� 
	suspensao
�� 
.
�� 
Periodo
�� %
.
��% &
Inicio
��& ,
>=
��- /
dataInicioEvento
��0 @
)
��@ A
duracaoSuspensao
�� $
+=
��% '
TimeSpan
��( 0
.
��0 1
	FromHours
��1 :
(
��: ;
Math
��; ?
.
��? @
Abs
��@ C
(
��C D
(
��D E
	suspensao
��E N
.
��N O
Periodo
��O V
.
��V W
Inicio
��W ]
-
��^ _
dataInicioEvento
��` p
)
��p q
.
��q r

TotalHours
��r |
)
��| }
)
��} ~
;
��~ 
if
�� 
(
�� 
	suspensao
�� 
.
�� 
Periodo
�� %
.
��% &
Fim
��& )
<=
��* ,
dataFimEvento
��- :
)
��: ;
duracaoSuspensao
�� $
+=
��% '
TimeSpan
��( 0
.
��0 1
	FromHours
��1 :
(
��: ;
Math
��; ?
.
��? @
Abs
��@ C
(
��C D
(
��D E
	suspensao
��E N
.
��N O
Periodo
��O V
.
��V W
Fim
��W Z
.
��Z [
Value
��[ `
-
��a b
dataFimEvento
��c p
)
��p q
.
��q r

TotalHours
��r |
)
��| }
)
��} ~
;
��~ 
if
�� 
(
�� 
	suspensao
�� 
.
�� 
Periodo
�� %
.
��% &
Inicio
��& ,
<=
��- /
dataInicioEvento
��0 @
&&
��A C
	suspensao
��D M
.
��M N
Periodo
��N U
.
��U V
Fim
��V Y
>=
��Z \
dataFimEvento
��] j
)
��j k
return
�� 
duracaoEvento
�� (
;
��( )
}
�� 
else
�� 
{
�� 
duracaoSuspensao
��  
=
��! "
TimeSpan
��# +
.
��+ ,
	FromHours
��, 5
(
��5 6
Math
��6 :
.
��: ;
Abs
��; >
(
��> ?
(
��? @
dataInicioEvento
��@ P
-
��Q R
	suspensao
��S \
.
��\ ]
Periodo
��] d
.
��d e
Inicio
��e k
)
��k l
.
��l m

TotalHours
��m w
)
��w x
)
��x y
;
��y z
}
�� 
return
�� 
(
�� 
duracaoEvento
�� !
-
��" #
duracaoSuspensao
��$ 4
)
��4 5
.
��5 6

TotalHours
��6 @
<
��A B
$num
��C D
?
��E F
new
��G J
TimeSpan
��K S
(
��S T
)
��T U
:
��V W
duracaoEvento
��X e
-
��f g
duracaoSuspensao
��h x
;
��x y
}
�� 	
private
�� 

LinkedList
�� 
<
�� *
EventoMudancaEstadoOperativo
�� 7
>
��7 8
EventosNoPeriodo
��9 I
(
��I J
IEnumerable
��J U
<
��U V*
EventoMudancaEstadoOperativo
��V r
>
��r s
eventos
��t {
,
��{ |
DateTime��} �

dataInicio��� �
,��� �
DateTime��� �
?��� �
dataFim��� �
)��� �
{
�� 	
var
�� 
filtradoPorData
�� 
=
��  !
dataFim
��" )
.
��) *
HasValue
��* 2
?
��3 4
eventos
��5 <
.
��< =
Where
��= B
(
��B C
e
��C D
=>
��E G
e
��H I
.
��I J
DataVerificada
��J X
>=
��Y [

dataInicio
��\ f
&&
��g i
e
��j k
.
��k l
DataVerificada
��l z
<=
��{ }
dataFim��~ �
.��� �
Value��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
eventos��� �
.��� �
Where��� �
(��� �
e��� �
=>��� �
e��� �
.��� �
DataVerificada��� �
>=��� �

dataInicio��� �
)��� �
;��� �
return
�� 
new
�� 

LinkedList
�� !
<
��! "*
EventoMudancaEstadoOperativo
��" >
>
��> ?
(
��? @
filtradoPorData
��@ O
)
��O P
;
��P Q
}
�� 	
private
�� 
ICollection
�� 
<
�� 
Data
��  
>
��  !(
ExtrairListaMesesDoPeriodo
��" <
(
��< =
DateTime
��= E
inicio
��F L
,
��L M
DateTime
��N V
fim
��W Z
)
��Z [
{
�� 	
var
�� 

listaMeses
�� 
=
�� 
new
��  
List
��! %
<
��% &
Data
��& *
>
��* +
(
��+ ,
)
��, -
;
��- .
inicio
�� 
=
�� 
new
�� 
DateTime
�� !
(
��! "
inicio
��" (
.
��( )
Year
��) -
,
��- .
inicio
��/ 5
.
��5 6
Month
��6 ;
,
��; <
$num
��= >
)
��> ?
.
��? @
Date
��@ D
;
��D E
while
�� 
(
�� 
inicio
�� 
<
�� 
fim
�� 
)
��  
{
�� 

listaMeses
�� 
.
�� 
Add
�� 
(
�� 
new
�� "
Data
��# '
(
��' (
inicio
��( .
.
��. /
Year
��/ 3
,
��3 4
inicio
��5 ;
.
��; <
Month
��< A
)
��A B
)
��B C
;
��C D
inicio
�� 
=
�� 
inicio
�� 
.
��  
	AddMonths
��  )
(
��) *
$num
��* +
)
��+ ,
;
��, -
}
�� 
return
�� 

listaMeses
�� 
;
�� 
}
�� 	
}
�� 
}�� 
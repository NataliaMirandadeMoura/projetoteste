÷
rC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.DataAccess\Class1.cs
	namespace 	
ONS
 
. 
SAGER 
. 

DataAccess 
{ 
public 

class 
Class1 
{ 
} 
} Ã
ãC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.DataAccess\Extensions\DataAccessExtensions.cs
	namespace 	
ONS
 
. 
SAGER 
. 

DataAccess 
. 

Extensions )
{ 
public 

static 
class  
DataAccessExtensions ,
{ 
public		 
static		 
void		 
AddRepositories		 *
(		* +
this		+ /
IServiceCollection		0 B
services		C K
)		K L
{

 	
services 
. 
	AddScoped 
< &
IUnidadeGeradoraRepository 9
,9 :%
UnidadeGeradoraRepository; T
>T U
(U V
)V W
;W X
services 
. 
	AddScoped 
< 
IEventoRepository 0
,0 1
EventoRepository2 B
>B C
(C D
)D E
;E F
} 	
} 
} ©
àC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.DataAccess\Interfaces\IEventoRepository.cs
	namespace 	
ONS
 
. 
SAGER 
. 

DataAccess 
. 

Interfaces )
{ 
public 

	interface 
IEventoRepository &
{		 
Task

 
<

 
List

 
<

 (
EventoMudancaEstadoOperativo

 .
>

. /
>

/ 0
ObterEventos

1 =
(

= >
DateTime

> F
inicioPeriodo

G T
,

T U
DateTime

V ^

fimPeriodo

_ i
,

i j
string

k q
unidadeGeradoraId	

r É
)


É Ñ
;


Ñ Ö
} 
} ’
ëC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.DataAccess\Interfaces\IUnidadeGeradoraRepository.cs
	namespace 	
ONS
 
. 
SAGER 
. 

DataAccess 
. 

Interfaces )
{ 
public 

	interface &
IUnidadeGeradoraRepository /
{ 
Task		 
<		 
UnidadeGeradora		 
>		 

ObterPorId		 (
(		( )
string		) /
id		0 2
)		2 3
;		3 4
Task

 
<

 
ICollection

 
<

 
UnidadeGeradora

 (
>

( )
>

) *
ObterPorIds

+ 6
(

6 7
IEnumerable

7 B
<

B C
string

C I
>

I J
ids

K N
)

N O
;

O P
Task 
< 
ICollection 
< $
SuspensaoUnidadeGeradora 1
>1 2
>2 3
ObterSuspensoes4 C
(C D
stringD J
UnidadeGeradorasIdK ]
,] ^
string_ e
	cenarioIdf o
)o p
;p q
Task 
< 
ICollection 
< $
SuspensaoUnidadeGeradora 1
>1 2
>2 3
ObterSuspensoes4 C
(C D
IEnumerableD O
<O P
stringP V
>V W 
UnidadesGeradorasIdsX l
,l m
stringn t
	cenarioIdu ~
)~ 
;	 Ä
} 
} Ü
âC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.DataAccess\Repositories\EventoRepository.cs
	namespace 	
ONS
 
. 
SAGER 
. 

DataAccess 
. 
Repositories +
{ 
public		 

class		 
EventoRepository		 !
:		" #
IEventoRepository		$ 5
{

 
public 
async 
Task 
< 
List 
< (
EventoMudancaEstadoOperativo ;
>; <
>< =
ObterEventos> J
(J K
DateTimeK S
inicioPeriodoT a
,a b
DateTimec k

fimPeriodol v
,v w
stringx ~
unidadeGeradoraId	 ê
)
ê ë
{ 	
return 
new 
List 
< (
EventoMudancaEstadoOperativo 8
>8 9
(9 :
): ;
{ 
new (
EventoMudancaEstadoOperativo 0
(0 1
)1 2
{ 
	NumeroOns 
= 
Guid  $
.$ %
NewGuid% ,
(, -
)- .
.. /
ToString/ 7
(7 8
)8 9
,9 :
DataVerificada "
=# $
new% (
DateTime) 1
(1 2
$num2 6
,6 7
$num8 9
,9 :
$num; <
)< =
} 
, 
new (
EventoMudancaEstadoOperativo 0
(0 1
)1 2
{ 
	NumeroOns 
= 
Guid  $
.$ %
NewGuid% ,
(, -
)- .
.. /
ToString/ 7
(7 8
)8 9
,9 :
DataVerificada "
=# $
new% (
DateTime) 1
(1 2
$num2 6
,6 7
$num8 9
,9 :
$num; <
)< =
} 
, 
new (
EventoMudancaEstadoOperativo 0
(0 1
)1 2
{ 
	NumeroOns 
= 
Guid  $
.$ %
NewGuid% ,
(, -
)- .
.. /
ToString/ 7
(7 8
)8 9
,9 :
DataVerificada "
=# $
new% (
DateTime) 1
(1 2
$num2 6
,6 7
$num8 9
,9 :
$num; <
)< =
} 
} 
; 
} 	
}   
}!! ˚
íC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Server\ONS.SAGER.DataAccess\Repositories\UnidadeGeradoraRepository.cs
	namespace 	
ONS
 
. 
SAGER 
. 

DataAccess 
. 
Repositories +
{ 
internal 
class %
UnidadeGeradoraRepository ,
:- .&
IUnidadeGeradoraRepository/ I
{		 
public

 
async

 
Task

 
<

 
UnidadeGeradora

 )
>

) *

ObterPorId

+ 5
(

5 6
string

6 <
id

= ?
)

? @
{ 	
throw 
new 
System 
. #
NotImplementedException 4
(4 5
)5 6
;6 7
} 	
public 
async 
Task 
< 
ICollection %
<% &
UnidadeGeradora& 5
>5 6
>6 7
ObterPorIds8 C
(C D
IEnumerableD O
<O P
stringP V
>V W
idsX [
)[ \
{ 	
throw 
new 
System 
. #
NotImplementedException 4
(4 5
)5 6
;6 7
} 	
public 
async 
Task 
< 
ICollection %
<% &$
SuspensaoUnidadeGeradora& >
>> ?
>? @
ObterSuspensoesA P
(P Q
stringQ W
unidadeGeradorasIdX j
,j k
stringl r
	cenarioIds |
)| }
{ 	
return 
await 
ObterSuspensoes (
(( )
new) ,
List- 1
<1 2
string2 8
>8 9
(9 :
): ;
{< =
unidadeGeradorasId> P
}Q R
,R S
	cenarioIdT ]
)] ^
;^ _
} 	
public 
async 
Task 
< 
ICollection %
<% &$
SuspensaoUnidadeGeradora& >
>> ?
>? @
ObterSuspensoesA P
(P Q
IEnumerableQ \
<\ ]
string] c
>c d 
unidadesGeradorasIdse y
,y z
string	{ Å
	cenarioId
Ç ã
)
ã å
{ 	
throw 
new 
System 
. #
NotImplementedException 4
(4 5
)5 6
;6 7
} 	
} 
} 
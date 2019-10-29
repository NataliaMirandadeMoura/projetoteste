æ
lC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Selenium.Utils\Utils\Browser.cs
	namespace 	
Selenium
 
. 
Utils 
{ 
public 

enum 
Browser 
{ 
Chrome 
, 
Firefox		 
}

 
} ‰
sC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Selenium.Utils\Utils\BrowserContext.cs
	namespace 	
Selenium
 
. 
Utils 
{ 
public		 

class		 
BrowserContext		 
{

 
private 
readonly 
Browser  
_browser! )
;) *
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 

IWebDriver 
	WebDriver #
{$ %
get& )
;) *
}+ ,
public 
BrowserContext 
( 
Browser %
browser& -
,- .
IConfiguration/ =
configuration> K
)K L
{ 	
_browser 
= 
browser 
; 
Configuration 
= 
configuration )
;) *
string 
caminhoDriver  
=! "
null# '
;' (
if 
( 
browser 
== 
Browser "
." #
Firefox# *
)* +
{ 
caminhoDriver 
= 
Configuration !
.! "

GetSection" ,
(, -
$str- L
)L M
.M N
ValueN S
;S T
} 
else 
if 
( 
browser 
== 
Browser  '
.' (
Chrome( .
). /
{ 
caminhoDriver 
= 
Configuration !
.! "

GetSection" ,
(, -
$str- K
)K L
.L M
ValueM R
;R S
} 
else 
{   
throw!! 
new!! 
	Exception!! #
(!!# $
$str!!$ =
)!!= >
;!!> ?
}"" 
	WebDriver$$ 
=$$ 
WebDriverFactory$$ (
.$$( )
CreateWebDriver$$) 8
($$8 9
browser%% 
,%% 
caminhoDriver%% &
)%%& '
;%%' (
}&& 	
}'' 
}(( Ž
sC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Selenium.Utils\Utils\WaitExtensions.cs
	namespace 	
Selenium
 
. 
Utils 
{ 
public 

static 
class 
WaitExtensions &
{ 
public		 
static		 
WebDriverWait		 #
Until		$ )
(		) *
this		* .
WebDriverWait		/ <
wait		= A
)		A B
=>

 
wait

 
;

 
public 
static 
bool 
NameAppears &
(& '
this' +
WebDriverWait, 9
wait: >
,> ?
string@ F
nameG K
)K L
=> 
wait 
. 
Until 
( 
( 
d 
) 
=>  
d! "
." #
FindElement# .
(. /
By/ 1
.1 2
Name2 6
(6 7
name7 ;
); <
)< =
.= >
	Displayed> G
)G H
;H I
public 
static 
WebDriverWait #
Wait$ (
(( )
this) -

IWebDriver. 8
	webdriver9 B
,B C
longD H
secondsI P
)P Q
=> 
new 
WebDriverWait  
(  !
	webdriver! *
,* +
TimeSpan, 4
.4 5
FromSeconds5 @
(@ A
secondsA H
)H I
)I J
;J K
} 
} ß
xC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Selenium.Utils\Utils\WebDriverExtensions.cs
	namespace 	
Selenium
 
. 
Utils 
{ 
public		 

static		 
class		 
WebDriverExtensions		 +
{

 
public 
static 
void 
LoadPage #
(# $
this$ (

IWebDriver) 3
	webDriver4 =
,= >
TimeSpan 
timeout 
, 
string $
url% (
)( )
{ 	
	webDriver 
. 
Manage 
( 
) 
. 
Timeouts '
(' (
)( )
.) *
PageLoad* 2
=3 4
timeout5 <
;< =
	webDriver 
. 
Navigate 
( 
)  
.  !
GoToUrl! (
(( )
url) ,
), -
;- .
} 	
public 
static 
string 
GetText $
($ %
this% )

IWebDriver* 4
	webDriver5 >
,> ?
By@ B
byC E
)E F
{ 	
IWebElement 

webElement "
=# $
	webDriver% .
.. /
FindElement/ :
(: ;
by; =
)= >
;> ?
return 

webElement 
. 
Text "
;" #
} 	
public 
static 
void 
SetText "
(" #
this# '

IWebDriver( 2
	webDriver3 <
,< =
By 
by 
, 
string 
text 
) 
{ 	
IWebElement 

webElement "
=# $
	webDriver% .
.. /
FindElement/ :
(: ;
by; =
)= >
;> ?

webElement 
. 
SendKeys 
(  
text  $
)$ %
;% &
} 	
public 
static 
void 
Submit !
(! "
this" &

IWebDriver' 1
	webDriver2 ;
,; <
By= ?
by@ B
)B C
{   	
IWebElement!! 

webElement!! "
=!!# $
	webDriver!!% .
.!!. /
FindElement!!/ :
(!!: ;
by!!; =
)!!= >
;!!> ?

webElement"" 
."" 
Click"" 
("" 
)"" 
;"" 
}## 	
}&& 
}'' Ð
uC:\Users\natalia.moura\Downloads\calculo-sample-master\calculo-sample-master\Selenium.Utils\Utils\WebDriverFactory.cs
	namespace 	
Selenium
 
. 
Utils 
{ 
public 

static 
class 
WebDriverFactory (
{ 
public 
static 

IWebDriver  
CreateWebDriver! 0
(0 1
Browser 
browser 
, 
string #

pathDriver$ .
). /
{ 	

IWebDriver 
	webDriver  
=! "
null# '
;' (
switch 
( 
browser 
) 
{ 
case 
Browser 
. 
Firefox $
:$ % 
FirefoxDriverService (
service) 0
=1 2 
FirefoxDriverService ,
., - 
CreateDefaultService- A
(A B

pathDriverB L
)L M
;M N
	webDriver 
= 
new  #
FirefoxDriver$ 1
(1 2
service2 9
)9 :
;: ;
break 
; 
case 
Browser 
. 
Chrome #
:# $
	webDriver 
= 
new  #
ChromeDriver$ 0
(0 1

pathDriver1 ;
); <
;< =
break 
; 
}   
return"" 
	webDriver"" 
;"" 
}## 	
}$$ 
}%% 
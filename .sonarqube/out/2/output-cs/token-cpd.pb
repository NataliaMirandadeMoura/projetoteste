�
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
} �
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

{, -
get. 1
;1 2
}3 4
public

IWebDriver
	WebDriver
{
get
;
}
public 
BrowserContext 
( 
Browser %
browser& -
,- .
IConfiguration/ =

)K L
{ 	
_browser 
= 
browser 
; 

= 

;) *
string 

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
{ 

= 

.! "

GetSection" ,
(, -
$str- L
)L M
.M N
ValueN S
;S T
} 
else 
if 
( 
browser 
== 
Browser  '
.' (
Chrome( .
). /
{ 

= 

.! "

GetSection" ,
(, -
$str- K
)K L
.L M
ValueM R
;R S
} 
else 
{   
throw!! 
new!! 
	Exception!! #
(!!# $
$str!!$ =
)!!= >
;!!> ?
}"" 
	WebDriver$$ 
=$$ 
WebDriverFactory$$ (
.$$( )
CreateWebDriver$$) 8
($$8 9
browser%% 
,%% 

)%%& '
;%%' (
}&& 	
}'' 
}(( �
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

Until		$ )
(		) *
this		* .

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

wait: >
,> ?
string@ F
nameG K
)K L
=>
wait
.
Until
(
(
d
)
=>
d
.
FindElement
(
By
.
Name
(
name
)
)
.
	Displayed
)
;
public 
static 

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
} �
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
{
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
}'' �
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
{
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
{ 
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
}   
return"" 
	webDriver"" 
;"" 
}## 	
}$$ 
}%% 
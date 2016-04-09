module React.DOM where

import Prelude (unit)

import React ( ReactElement()
             , ReactElementImpl(..)
             , ReactElementRaw()
             , TaggedReactElement(..)
             , TagName()
             , createElementTagName
             )
import React.DOM.Props (Props(), unsafeFromPropsArray)

mkDOM :: TagName -> Array Props -> ReactElement -> ReactElement
mkDOM tag props = createElementTagName tag (unsafeFromPropsArray props)

foreign import textImpl :: String -> ReactElementRaw

text :: String -> ReactElement
text str = ReactElement [StaticElement (textImpl str)] unit

a :: Array Props -> ReactElement -> ReactElement
a = mkDOM "a"

a' :: ReactElement -> ReactElement
a' = a []

abbr :: Array Props -> ReactElement -> ReactElement
abbr = mkDOM "abbr"

abbr' :: ReactElement -> ReactElement
abbr' = abbr []

address :: Array Props -> ReactElement -> ReactElement
address = mkDOM "address"

address' :: ReactElement -> ReactElement
address' = address []

area :: Array Props -> ReactElement -> ReactElement
area = mkDOM "area"

area' :: ReactElement -> ReactElement
area' = area []

article :: Array Props -> ReactElement -> ReactElement
article = mkDOM "article"

article' :: ReactElement -> ReactElement
article' = article []

aside :: Array Props -> ReactElement -> ReactElement
aside = mkDOM "aside"

aside' :: ReactElement -> ReactElement
aside' = aside []

audio :: Array Props -> ReactElement -> ReactElement
audio = mkDOM "audio"

audio' :: ReactElement -> ReactElement
audio' = audio []

b :: Array Props -> ReactElement -> ReactElement
b = mkDOM "b"

b' :: ReactElement -> ReactElement
b' = b []

base :: Array Props -> ReactElement -> ReactElement
base = mkDOM "base"

base' :: ReactElement -> ReactElement
base' = base []

bdi :: Array Props -> ReactElement -> ReactElement
bdi = mkDOM "bdi"

bdi' :: ReactElement -> ReactElement
bdi' = bdi []

bdo :: Array Props -> ReactElement -> ReactElement
bdo = mkDOM "bdo"

bdo' :: ReactElement -> ReactElement
bdo' = bdo []

big :: Array Props -> ReactElement -> ReactElement
big = mkDOM "big"

big' :: ReactElement -> ReactElement
big' = big []

blockquote :: Array Props -> ReactElement -> ReactElement
blockquote = mkDOM "blockquote"

blockquote' :: ReactElement -> ReactElement
blockquote' = blockquote []

body :: Array Props -> ReactElement -> ReactElement
body = mkDOM "body"

body' :: ReactElement -> ReactElement
body' = body []

br :: Array Props -> ReactElement -> ReactElement
br = mkDOM "br"

br' :: ReactElement -> ReactElement
br' = br []

button :: Array Props -> ReactElement -> ReactElement
button = mkDOM "button"

button' :: ReactElement -> ReactElement
button' = button []

canvas :: Array Props -> ReactElement -> ReactElement
canvas = mkDOM "canvas"

canvas' :: ReactElement -> ReactElement
canvas' = canvas []

caption :: Array Props -> ReactElement -> ReactElement
caption = mkDOM "caption"

caption' :: ReactElement -> ReactElement
caption' = caption []

cite :: Array Props -> ReactElement -> ReactElement
cite = mkDOM "cite"

cite' :: ReactElement -> ReactElement
cite' = cite []

code :: Array Props -> ReactElement -> ReactElement
code = mkDOM "code"

code' :: ReactElement -> ReactElement
code' = code []

col :: Array Props -> ReactElement -> ReactElement
col = mkDOM "col"

col' :: ReactElement -> ReactElement
col' = col []

colgroup :: Array Props -> ReactElement -> ReactElement
colgroup = mkDOM "colgroup"

colgroup' :: ReactElement -> ReactElement
colgroup' = colgroup []

_data :: Array Props -> ReactElement -> ReactElement
_data = mkDOM "data"

_data' :: ReactElement -> ReactElement
_data' = _data []

datalist :: Array Props -> ReactElement -> ReactElement
datalist = mkDOM "datalist"

datalist' :: ReactElement -> ReactElement
datalist' = datalist []

dd :: Array Props -> ReactElement -> ReactElement
dd = mkDOM "dd"

dd' :: ReactElement -> ReactElement
dd' = dd []

del :: Array Props -> ReactElement -> ReactElement
del = mkDOM "del"

del' :: ReactElement -> ReactElement
del' = del []

details :: Array Props -> ReactElement -> ReactElement
details = mkDOM "details"

details' :: ReactElement -> ReactElement
details' = details []

dfn :: Array Props -> ReactElement -> ReactElement
dfn = mkDOM "dfn"

dfn' :: ReactElement -> ReactElement
dfn' = dfn []

dialog :: Array Props -> ReactElement -> ReactElement
dialog = mkDOM "dialog"

dialog' :: ReactElement -> ReactElement
dialog' = dialog []

div :: Array Props -> ReactElement -> ReactElement
div = mkDOM "div"

div' :: ReactElement -> ReactElement
div' = div []

dl :: Array Props -> ReactElement -> ReactElement
dl = mkDOM "dl"

dl' :: ReactElement -> ReactElement
dl' = dl []

dt :: Array Props -> ReactElement -> ReactElement
dt = mkDOM "dt"

dt' :: ReactElement -> ReactElement
dt' = dt []

em :: Array Props -> ReactElement -> ReactElement
em = mkDOM "em"

em' :: ReactElement -> ReactElement
em' = em []

embed :: Array Props -> ReactElement -> ReactElement
embed = mkDOM "embed"

embed' :: ReactElement -> ReactElement
embed' = embed []

fieldset :: Array Props -> ReactElement -> ReactElement
fieldset = mkDOM "fieldset"

fieldset' :: ReactElement -> ReactElement
fieldset' = fieldset []

figcaption :: Array Props -> ReactElement -> ReactElement
figcaption = mkDOM "figcaption"

figcaption' :: ReactElement -> ReactElement
figcaption' = figcaption []

figure :: Array Props -> ReactElement -> ReactElement
figure = mkDOM "figure"

figure' :: ReactElement -> ReactElement
figure' = figure []

footer :: Array Props -> ReactElement -> ReactElement
footer = mkDOM "footer"

footer' :: ReactElement -> ReactElement
footer' = footer []

form :: Array Props -> ReactElement -> ReactElement
form = mkDOM "form"

form' :: ReactElement -> ReactElement
form' = form []

h1 :: Array Props -> ReactElement -> ReactElement
h1 = mkDOM "h1"

h1' :: ReactElement -> ReactElement
h1' = h1 []

h2 :: Array Props -> ReactElement -> ReactElement
h2 = mkDOM "h2"

h2' :: ReactElement -> ReactElement
h2' = h2 []

h3 :: Array Props -> ReactElement -> ReactElement
h3 = mkDOM "h3"

h3' :: ReactElement -> ReactElement
h3' = h3 []

h4 :: Array Props -> ReactElement -> ReactElement
h4 = mkDOM "h4"

h4' :: ReactElement -> ReactElement
h4' = h4 []

h5 :: Array Props -> ReactElement -> ReactElement
h5 = mkDOM "h5"

h5' :: ReactElement -> ReactElement
h5' = h5 []

h6 :: Array Props -> ReactElement -> ReactElement
h6 = mkDOM "h6"

h6' :: ReactElement -> ReactElement
h6' = h6 []

head :: Array Props -> ReactElement -> ReactElement
head = mkDOM "head"

head' :: ReactElement -> ReactElement
head' = head []

header :: Array Props -> ReactElement -> ReactElement
header = mkDOM "header"

header' :: ReactElement -> ReactElement
header' = header []

hr :: Array Props -> ReactElement -> ReactElement
hr = mkDOM "hr"

hr' :: ReactElement -> ReactElement
hr' = hr []

html :: Array Props -> ReactElement -> ReactElement
html = mkDOM "html"

html' :: ReactElement -> ReactElement
html' = html []

i :: Array Props -> ReactElement -> ReactElement
i = mkDOM "i"

i' :: ReactElement -> ReactElement
i' = i []

iframe :: Array Props -> ReactElement -> ReactElement
iframe = mkDOM "iframe"

iframe' :: ReactElement -> ReactElement
iframe' = iframe []

img :: Array Props -> ReactElement -> ReactElement
img = mkDOM "img"

img' :: ReactElement -> ReactElement
img' = img []

input :: Array Props -> ReactElement -> ReactElement
input = mkDOM "input"

input' :: ReactElement -> ReactElement
input' = input []

ins :: Array Props -> ReactElement -> ReactElement
ins = mkDOM "ins"

ins' :: ReactElement -> ReactElement
ins' = ins []

kbd :: Array Props -> ReactElement -> ReactElement
kbd = mkDOM "kbd"

kbd' :: ReactElement -> ReactElement
kbd' = kbd []

keygen :: Array Props -> ReactElement -> ReactElement
keygen = mkDOM "keygen"

keygen' :: ReactElement -> ReactElement
keygen' = keygen []

label :: Array Props -> ReactElement -> ReactElement
label = mkDOM "label"

label' :: ReactElement -> ReactElement
label' = label []

legend :: Array Props -> ReactElement -> ReactElement
legend = mkDOM "legend"

legend' :: ReactElement -> ReactElement
legend' = legend []

li :: Array Props -> ReactElement -> ReactElement
li = mkDOM "li"

li' :: ReactElement -> ReactElement
li' = li []

link :: Array Props -> ReactElement -> ReactElement
link = mkDOM "link"

link' :: ReactElement -> ReactElement
link' = body []

main :: Array Props -> ReactElement -> ReactElement
main = mkDOM "main"

main' :: ReactElement -> ReactElement
main' = main []

map :: Array Props -> ReactElement -> ReactElement
map = mkDOM "map"

map' :: ReactElement -> ReactElement
map' = map []

mark :: Array Props -> ReactElement -> ReactElement
mark = mkDOM "mark"

mark' :: ReactElement -> ReactElement
mark' = mark []

menu :: Array Props -> ReactElement -> ReactElement
menu = mkDOM "menu"

menu' :: ReactElement -> ReactElement
menu' = menu []

menuitem :: Array Props -> ReactElement -> ReactElement
menuitem = mkDOM "menuitem"

menuitem' :: ReactElement -> ReactElement
menuitem' = menuitem []

meta :: Array Props -> ReactElement -> ReactElement
meta = mkDOM "meta"

meta' :: ReactElement -> ReactElement
meta' = meta []

meter :: Array Props -> ReactElement -> ReactElement
meter = mkDOM "meter"

meter' :: ReactElement -> ReactElement
meter' = meter []

nav :: Array Props -> ReactElement -> ReactElement
nav = mkDOM "nav"

nav' :: ReactElement -> ReactElement
nav' = nav []

noscript :: Array Props -> ReactElement -> ReactElement
noscript = mkDOM "noscript"

noscript' :: ReactElement -> ReactElement
noscript' = noscript []

object :: Array Props -> ReactElement -> ReactElement
object = mkDOM "object"

object' :: ReactElement -> ReactElement
object' = object []

ol :: Array Props -> ReactElement -> ReactElement
ol = mkDOM "ol"

ol' :: ReactElement -> ReactElement
ol' = ol []

optgroup :: Array Props -> ReactElement -> ReactElement
optgroup = mkDOM "optgroup"

optgroup' :: ReactElement -> ReactElement
optgroup' = optgroup []

option :: Array Props -> ReactElement -> ReactElement
option = mkDOM "option"

option' :: ReactElement -> ReactElement
option' = option []

output :: Array Props -> ReactElement -> ReactElement
output = mkDOM "output"

output' :: ReactElement -> ReactElement
output' = output []

p :: Array Props -> ReactElement -> ReactElement
p = mkDOM "p"

p' :: ReactElement -> ReactElement
p' = p []

param :: Array Props -> ReactElement -> ReactElement
param = mkDOM "param"

param' :: ReactElement -> ReactElement
param' = param []

picture :: Array Props -> ReactElement -> ReactElement
picture = mkDOM "picture"

picture' :: ReactElement -> ReactElement
picture' = picture []

pre :: Array Props -> ReactElement -> ReactElement
pre = mkDOM "pre"

pre' :: ReactElement -> ReactElement
pre' = pre []

progress :: Array Props -> ReactElement -> ReactElement
progress = mkDOM "progress"

progress' :: ReactElement -> ReactElement
progress' = progress []

q :: Array Props -> ReactElement -> ReactElement
q = mkDOM "q"

q' :: ReactElement -> ReactElement
q' = q []

rp :: Array Props -> ReactElement -> ReactElement
rp = mkDOM "rp"

rp' :: ReactElement -> ReactElement
rp' = rp []

rt :: Array Props -> ReactElement -> ReactElement
rt = mkDOM "rt"

rt' :: ReactElement -> ReactElement
rt' = rt []

ruby :: Array Props -> ReactElement -> ReactElement
ruby = mkDOM "ruby"

ruby' :: ReactElement -> ReactElement
ruby' = ruby []

s :: Array Props -> ReactElement -> ReactElement
s = mkDOM "s"

s' :: ReactElement -> ReactElement
s' = s []

samp :: Array Props -> ReactElement -> ReactElement
samp = mkDOM "samp"

samp' :: ReactElement -> ReactElement
samp' = samp []

script :: Array Props -> ReactElement -> ReactElement
script = mkDOM "script"

script' :: ReactElement -> ReactElement
script' = script []

section :: Array Props -> ReactElement -> ReactElement
section = mkDOM "section"

section' :: ReactElement -> ReactElement
section' = section []

select :: Array Props -> ReactElement -> ReactElement
select = mkDOM "select"

select' :: ReactElement -> ReactElement
select' = select []

small :: Array Props -> ReactElement -> ReactElement
small = mkDOM "small"

small' :: ReactElement -> ReactElement
small' = small []

source :: Array Props -> ReactElement -> ReactElement
source = mkDOM "source"

source' :: ReactElement -> ReactElement
source' = source []

span :: Array Props -> ReactElement -> ReactElement
span = mkDOM "span"

span' :: ReactElement -> ReactElement
span' = span []

strong :: Array Props -> ReactElement -> ReactElement
strong = mkDOM "strong"

strong' :: ReactElement -> ReactElement
strong' = strong []

style :: Array Props -> ReactElement -> ReactElement
style = mkDOM "style"

style' :: ReactElement -> ReactElement
style' = style []

sub :: Array Props -> ReactElement -> ReactElement
sub = mkDOM "sub"

sub' :: ReactElement -> ReactElement
sub' = sub []

summary :: Array Props -> ReactElement -> ReactElement
summary = mkDOM "summary"

summary' :: ReactElement -> ReactElement
summary' = summary []

sup :: Array Props -> ReactElement -> ReactElement
sup = mkDOM "sup"

sup' :: ReactElement -> ReactElement
sup' = sup []

table :: Array Props -> ReactElement -> ReactElement
table = mkDOM "table"

table' :: ReactElement -> ReactElement
table' = table []

tbody :: Array Props -> ReactElement -> ReactElement
tbody = mkDOM "tbody"

tbody' :: ReactElement -> ReactElement
tbody' = tbody []

td :: Array Props -> ReactElement -> ReactElement
td = mkDOM "td"

td' :: ReactElement -> ReactElement
td' = td []

textarea :: Array Props -> ReactElement -> ReactElement
textarea = mkDOM "textarea"

textarea' :: ReactElement -> ReactElement
textarea' = textarea []

tfoot :: Array Props -> ReactElement -> ReactElement
tfoot = mkDOM "tfoot"

tfoot' :: ReactElement -> ReactElement
tfoot' = tfoot []

th :: Array Props -> ReactElement -> ReactElement
th = mkDOM "th"

th' :: ReactElement -> ReactElement
th' = th []

thead :: Array Props -> ReactElement -> ReactElement
thead = mkDOM "thead"

thead' :: ReactElement -> ReactElement
thead' = thead []

time :: Array Props -> ReactElement -> ReactElement
time = mkDOM "time"

time' :: ReactElement -> ReactElement
time' = time []

title :: Array Props -> ReactElement -> ReactElement
title = mkDOM "title"

title' :: ReactElement -> ReactElement
title' = title []

tr :: Array Props -> ReactElement -> ReactElement
tr = mkDOM "tr"

tr' :: ReactElement -> ReactElement
tr' = tr []

track :: Array Props -> ReactElement -> ReactElement
track = mkDOM "track"

track' :: ReactElement -> ReactElement
track' = track []

u :: Array Props -> ReactElement -> ReactElement
u = mkDOM "u"

u' :: ReactElement -> ReactElement
u' = u []

ul :: Array Props -> ReactElement -> ReactElement
ul = mkDOM "ul"

ul' :: ReactElement -> ReactElement
ul' = ul []

var :: Array Props -> ReactElement -> ReactElement
var = mkDOM "var"

var' :: ReactElement -> ReactElement
var' = var []

video :: Array Props -> ReactElement -> ReactElement
video = mkDOM "video"

video' :: ReactElement -> ReactElement
video' = video []

wbr :: Array Props -> ReactElement -> ReactElement
wbr = mkDOM "body"

wbr' :: ReactElement -> ReactElement
wbr' = wbr []

module React.DOM.SVG where

import React (ReactElement())
import React.DOM (mkDOM)
import React.DOM.Props (Props())

circle :: Array Props -> ReactElement -> ReactElement
circle = mkDOM "circle"

clipPath :: Array Props -> ReactElement -> ReactElement
clipPath = mkDOM "clipPath"

defs :: Array Props -> ReactElement -> ReactElement
defs = mkDOM "defs"

ellipse :: Array Props -> ReactElement -> ReactElement
ellipse = mkDOM "ellipse"

g :: Array Props -> ReactElement -> ReactElement
g = mkDOM "g"

line :: Array Props -> ReactElement -> ReactElement
line = mkDOM "line"

linearGradient :: Array Props -> ReactElement -> ReactElement
linearGradient = mkDOM "linearGradient"

mask :: Array Props -> ReactElement -> ReactElement
mask = mkDOM "mask"

path :: Array Props -> ReactElement -> ReactElement
path = mkDOM "path"

pattern :: Array Props -> ReactElement -> ReactElement
pattern = mkDOM "pattern"

polygon :: Array Props -> ReactElement -> ReactElement
polygon = mkDOM "polygon"

polyline :: Array Props -> ReactElement -> ReactElement
polyline = mkDOM "polyline"

radialGradient :: Array Props -> ReactElement -> ReactElement
radialGradient = mkDOM "radialGradient"

rect :: Array Props -> ReactElement -> ReactElement
rect = mkDOM "rect"

stop :: Array Props -> ReactElement -> ReactElement
stop = mkDOM "stop"

svg :: Array Props -> ReactElement -> ReactElement
svg = mkDOM "svg"

text :: Array Props -> ReactElement -> ReactElement
text = mkDOM "text"

tspan :: Array Props -> ReactElement -> ReactElement
tspan = mkDOM "tspan"

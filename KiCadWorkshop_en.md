![](images/title.jpg)

## SCHEDULE
- Introduction
- svg2shenzen & KiCad presentation
- Demos 
- Individual lunch
- Make your onw 

## ABOUT ME
- Tillo
- @morgulbrut on the twitters
- Electronics Engineer by day
- Dev-board hoarder by night

## PCB ART
- done a long time by various folks
- boomed in recent years as #badgelife
- badges for hacker cons

## PCB ART

\begin{figure}
      \centering
      \only<1>
        {%
          \includegraphics[width=.8\textwidth]{images/Micronoise.png}%
        }%
      \only<2>
        {%
          \includegraphics[width=.8\textwidth]{images/viking-badge.jpg}%
        }%
      \only<3>
        {%
          \includegraphics[width=.8\textwidth]{images/Jogjarmageddon.jpg}%
        }%
    \only<4>
        {%
          \includegraphics[width=.8\textwidth]{images/queercon.jpg}%
        }%
    \end{figure}

## SHITTY ADD-ON
- addon for badges, originally for DEF CON
- easy entry to PCB art
- MZ badge will have some connectors too

## SOME SHITTY ADD-ONS
![](images/shittyadd-ons.png)

## SAO 1.69BIS
- 3V3 and GND
- I²C
- Two GPIO
- Max power 1.1 millihorsepower (250mA @ 3.3V)
- Serial Port on one of the badge

## TOOLS WE WILL USE
- Inkscape
- svg2shenzen
- KiCad

## INKSCAPE
- Vectorgraphics editor
- FOSS 

## SVG2SHENZEN
- An inkscape plugin for PCB art.
- Layer "-disable" disables that Layer.
- The stuff you want to have in your design needs to be "dark".
- made by Budi from Indonesia 
- @manticore_ on the twitters
- badgeek on github

## KICAD
![](images/kicad.png)

## KICAD
- EDA (Electronics Design Automation Suite)
- FOSS (mostly GPL)
- Used to be pretty bad in the past
- Now: developed at CERN

## EDA WORKFLOW
- Draw schematics 
- Annotate schematics (in KiCad also: assign footprints to symbol)
- Layout 
- Generate data 

## SCHEMATICS EDITOR
![](images/schema_editor.png)

## DRAW SCHEMATICS
- Place symbols and connect them.
- Make new components if needed.

## MAKE COMPONENTS
- Symbol
- Footprint
- Add 3d model(s) to a footprint (if wanted)

## ANNOTATE SYMBOLS
- Automatically number the components.
- Manually assign footprints to symbols.

## SCHEMATIC TO LAYOUT
- Before KiCAD 5 it was needed to generate a netlist and load it into the layout.
- KiCAD 5 can do it in one step.

## LAYOUT EDITOR
![](images/layout_editor.png)

## LAYOUT HINTS
- Always start with diff pairs.
- Route mainly horizontal on one layer and mainly vertical on another.
- Tented vias: Some say do it, some say don't. I don't really know.

## LAYERSTACK
- 2 layer: parts & routing & GND, routing & GND or VCC
- 4 layer: parts & routing(& GND), GND, VCC, GND & routing

## ROUTE
- Angles should be bigger than 90°. Using a 45° raster is recommended.
- Make polygons if possible
- .5 mm - .3 mm are etchable in your homelab
- Vias are a pain if you etch the prints yourself

## CURVED TRACES
- A KiCad Plugin which makes curves traces
- Adds that hand drawn touch
- Route first, run the plugin, get a new layout.

## GENERATE GERBERS
- Check if every layer you need is in the output.
- Check the gerbers after generating them.

## KITSPACE.ORG
- Sharing is caring
- Upload gerbers and BOM
- Connects to github
- Made by Kaspar
- kasbah on github

## FILES 

github.com/morgulbrut/kicadWorkshop Branch: SAO-Workshop

- Slides
- Documentation
- Example project
# Shitty add-on

![Some shitty add-ons](images/shittyadd-ons.png)

Since the electronic badges at DEF CON became more and more sophisticated and expensive to produce (heard the 40k $ once), somebody came up with the idea of making add-ons for the badges both as a easy way to get into electronics design as well as a way to extend/hack the badges. 

Originally they specified a 4 pin header, for ground, 3V3, and I²C, at some point they added another two for GPIO or whatever. To clear, it's not a standard some gremium came up, but more of a "dumb" "lets do this for teh lulz" idea, which went off. 

# Prerequisites

We gonna use KiCad 5, since there are tons of improvements, coming from KiCad 5.

## KiCad and Inkscape

**Disclaimer:** I use Arch BTW. Well and I know how to install it on windows.

I use **KiCad 5.1** and **Inkscape 0.92.4**

### Windows

Go to [http://www.kicad-pcb.org](http://www.kicad-pcb.org) and grab the installer, the standard libraries comes with it and is pretty powerful.

Go to [https://inkscape.org/release/0.92.4/platforms](https://inkscape.org/release/0.92.4/platforms) and grab the installer. 

### Linux

1. Search  for it in the repos.
2. Grab also libraries, if it's a separate package.

or if not in your package system: see **Windows**

### Mac

See **Windows** 

#### Useful router settings.
1. Set to GL mode (named bit differently on differen OS) using \menu{Preferences > Modern Graphics Toolset} or \menu{Preferences > GL Graphics Mode}.
2. While routing make a right click and go to interactive Router settings.
3. Set \menu{Mouse drag behaviour} to \menu{Interactive drag} to be able to drag traces around in a useful way.
4. Check \menu{Mode > Shove} to push around other elements while routing.

## svg2shenzen

An Inkscape plugin we use for PCB art, get it from [https://github.com/badgeek/svg2shenzhen](https://github.com/badgeek/svg2shenzhen) and install it as described there.

### Linux:

- be sure to have lxml for python2 installed.
- be sure to set the exec bits correctly. [https://github.com/badgeek/svg2shenzhen/issues/52](https://github.com/badgeek/svg2shenzhen/issues/52)

## Shitty Add-On library

Get it from [https://hackaday.io/project/52950/files](https://hackaday.io/project/52950/files)

### Installation and setup 

Since Kicads Library management is a bit quirky I usually just put the used external libraries into a folder inside my project folder. Works always.


# Workflow

![General workflow](images/workflow.png)

That's roughly the workflow I use. You maybe found one which suits you better.

## Setting up project

1. In the KiCad main window make a new project \menu{File > New > Project}
2. If if a .kicad_pcb is generated, you can delete it.
3. Close KiCad.

## svg2shenzen & Inkscape

1. Initalize a new drawing using \menu{Extensions > Svg2Shenzhen > Prepare Document...}
2. Draw your thing. 
   1. Keep in mind, there are some layer combinations that make no sense.
   2. If the layers has the suffix *disabled* it is disabled. Rename it from *<X>-disabled* to *<X>*.
   3. Check if the layers are dark enough.
   4. If you import from Illustrator, check the size.
3. Convert objects to paths. Cleanup SVG.
4. Export to KiCad.
   1. Check \menu{Open Kicad after export?}.
   2. Uncheck \menu{Open PCBWay after export?}.
   3. Set the path to the directory of your project.
   4. Export as a KiCad Layout.
   
## KiCad

### Draw schematics

1. Make sure the schematics and the layout are named equally.
2. Place new components with \keys{A} (or using the menu on the right side of the schematics editor).
3. Draw the connections with \keys{W} (or using the menu on the right side of the schematics editor).
4. Doubleclick components to changes their values if needed (Resistors, Capacitors)

**Tip:** Since you can assign basically every footprint to every schematics symbol later, allways use a proper symbol. For example, if you use a pot which is connected ower some cables, use a pot symbol and assign some connector later. I used big SMD resistors as footprints for solder pads quite often.

#### Annotate schematics & asssign footprint0

1. Annotate the schematics using \menu{Tools > Annotate Schematics...}.
2. Assign footprints using \menu{Tools > Assign Footprints...} or double click on the component.

#### Schematic to layout
- Before KiCAD 5 it was needed to generate a netlist and load it into the layout.
- KiCAD 5 can do it in one step, by pressing \keys{F8}


### Layout
1. Define the design rules, for most projects your fine with the default. Also define keepout areas, below antennas for example.
2. Place the parts, in a meaninful way reduces complicated routing afterwards.
3. Route all lenghtmatched / diff-pair connections
4. Route power(\keys{X}), use polygons if possible.
5. Route the rest. Route mainly horizontal on one layer and mainly vertical on another.

#### Layerstack
My normally used Layerstacks are:

- 2 layer: parts & routing & GND, routing & GND or VCC
- 4 layer: parts & routing(& GND), GND, VCC, GND & routing

#### Tips & Infos
- **Tented vias** do whatever you want, tented looks cleaner but legends say the can pop if reflowed.
- Angles should be bigger than 90°. Using a 45° raster is recommended.
- .5 mm - .3 mm are etchable in your homelab.
- Vias are a pain if you etch the prints yourself.

### Generate gerber
1. Go to \menu{File > Plot}.
2. Set all the layers you want. Usually:
    - copper layers (*.Cu*)
    - board outline (*Edge.Cuts*)
    - silkscreens (*F.SilkS*,*B.SilkS*)
    - solder masks (*F.Mask*,*B.Mask*)
    - paste masks (*F.Paste*,*B.Paste*)
3. Set the options according to your manufacturer
4. Set the Output directory (\path{PROJECT > gerber} for example)
5. Generate the drill files using \menu{Generate Drill Files...}
6. Generate the gerber files using \menu{Plot...}
7. Check them in the Gerberviewer

**Hint:** some supliers accept KiCad files directly. So you don't need to export gerbers.

**Tip:** For self etching \menu{File > Print...} works way better than gerber files.

## Libraries 
Libraries can be installed globally or for a project. If you want to share your project your mostly better off putting them into a subdirectory of your project, and then install it for that project.

```
your_kickass_project
├── external_libs
|    ├── lib1
|    |    ├── lib1.pretty
|    |    └── lib1.lib
|    └── lib2
|         ├── lib2.pretty
|         └── lib2.lib
├── your_kickass_project.kicad_pcb
├── your_kickass_project.pro
└── your_kickass_project.sch
    
```

## Plugins
KiCad has a plugin system. Unfortunately there is no offical plugin database, repo, whaterver yet.

As a cool example I recommend to look at [kicad-round-tracks](https://github.com/stimulu/kicad-round-tracks).

## Shortcuts 
Some handy shortcuts I found out there on the Web. 

| Key               | Schematic editor         | PCB Editor                     |
|:------------------|:-------------------------|:-------------------------------|
| \keys[/]{+}       |                          | **Switch to Next Layer**       |
| \keys{-}          |                          | **Switch to Previous Layer**   |
| \keys{/}          | Add Bus Entry            | Switch Track Posture           |
| \keys{?}          | Help                     |                                |
| \keys{A}          | **Add Component**        |                                |
| \keys{B}          | Begin Bus                | **Redraw polygons**            |
| \keys{\backspace} |                          | Delete Track Segment           |
| \keys{C}          | Copy Component or Label  | Copy Item                      |
| \keys{\ctrl+F}    |                          | Find Item                      |
| \keys{\ctrl+L}    |                          | Load Board                     |
| \keys{\ctrl+S}    |                          | Save Board                     |
| \keys{\ctrl+V}    |                          | Add Microvia                   |
| \keys{\ctrl+W}    |                          | Switch Track Width to Previous |
| \keys{\ctrl+Y}    |                          | Redo                           |
| \keys{\ctrl+Z}    |                          | Undo                           |
| \keys{D}          |                          | Drag Track, Keep Slope         |
| \keys{\del}       | **Delete Item**          | Delete Item                    |
| \keys{E}          | **Edit Item**            | Edit Item                      |
| \keys{End}        |                          | End Track                      |
| \keys{F}          | Edit Footprint           | Flip Item                      |
| \keys{F1}         | Zoom In                  |                                |
| \keys{F2}         | Zoom Out                 |                                |
| \keys{F3}         | Zoom Redraw              |                                |
| \keys{F4}         | Zoom Center              |                                |
| \keys{F5}         |                          | Switch to Inner Layer 1        |
| \keys{F6}         |                          | Switch to Inner Layer 2        |
| \keys{F8}         | **Schematic to Layout**  |                                |
| \keys{G}          | **Drag Item**            | **Drag Item**                  |
| \keys{H}          | Add Hierarchical Label   | Switch Highcontrast Mode       |
| \keys{Home}       | Fit on Screen            |                                |
| \keys{Insert}     | Repeat Lest Item         |                                |
| \keys{J}          | Add Junction             |                                |
| \keys{K}          | End Line Wire Bus        | Track Display Mode             |
| \keys{L}          | Add Label                | Lock/Unlock Footprint          |
| \keys{M}          | **Move Item**            | **Move Item**                  |
| \keys{N}          | Orient Normal Component  |                                |
| \keys{O}          |                          | Add Module                     |
| \keys{P}          | **Add Power**            | **Place Item**                 |
| \keys{PgDn}       |                          | Switch to Cooper Layer         |
| \keys{PgUp}       |                          | Switch to Component Layer      |
| \keys{Q}          | Add No Connect Flag      |                                |
| \keys{R}          | **Rotate Item**          | **Rotate Item**                |
| \keys{S}          | Add Sheet                |                                |
| \keys{\Space}     |                          | Reset Local Coordinates        |
| \keys{T}          |                          | Get and Move Footprint         |
| \keys{\tab}       | Move Block -> Drag Block |                                |
| \keys{U}          | Edit Reference           |                                |
| \keys{V}          | Edit Value               | **Add Via**                    |
| \keys{W}          | **Begin Wire**           | Switch Track Width to Next     |
| \keys{X}          | **Mirror X Component**   | **Add New Track**              |
| \keys{Y}          | **Mirror Y Component**   |                                |
| \keys{Z}          | Add Wire Entry           |                                |
| \keys{\Alt+3}     |                          | **3D Viewer**                  |

# Links

## KiCad
- [KiCad forums](https://forum.kicad.info)
- [KiCad getting started](http://docs.kicad-pcb.org/5.1.2/en/getting_started_in_kicad/getting_started_in_kicad.html)
- [KiCad shortcuts](https://shortcutworld.com/KiCAD/win/KiCAD_Shortcuts)
- [KiCad cheatsheet](https://silica.io/wp-content/uploads/2018/06/kicad-cheatsheet.pdf)
- [List of KiCad 3rd party tools](https://github.com/xesscorp/kicad-3rd-party-tools)
- [KiCad footprint collection](https://github.com/kitspace/kicad_footprints) looks insanly huge.
- [badgelive parts KiCAD libs](https://hackaday.io/project/52950/files)
  
## PCB art
- [shitty add on](https://hackaday.com/2019/03/20/introducing-the-shitty-add-on-v1-69bis-standard/)
- [svg2shenzhen](https://github.com/badgeek/svg2shenzhen)

## Electronics 
- [awesome electronics](https://github.com/kitspace/awesome-electronics) curated list of electronics resources.

## PCB Manufacturer
  
### Great for small PCBs
- [Oshpark](https://oshark.com/) Purple PCBs, cheap for small PCBs. Made in the US.
- [Aisler](https://aisler.net/) Basically Oshpark made in Europe, and you can Order the parts of your BOM as well.

### Cheap and Chinese
- [PCBWay](https://www.pcbway.com/) One of those Chinese PCB houses, who use all the same webdesigner.
- [JLCPCB](https://jlcpcb.com) Another one, slightly cheaper than others, sponsor of Naomi Wu.
- [Allpcb](https://www.allpcb.com/) Just another one, allows all kind of weird color combinations between silkscreen and solder mask.
---
header-includes: 
   \usepackage{menukeys}
---


# Shitty add-on

![Some shitty add-ons](images/shittyadd-ons.png)

# Prerequisites

    We gonna use KiCAD 5, since there are tons of improvements. 

## Building the docs

Use [dotgo](https://github.com/morgulbrut/dotgo), read the markdown directly or use a better markdown to whatever transpiler.
I'm gonna release builds from time to time

## KiCad and Inkscape

    Disclaimer: I use Arch btw. Well and I know how to install it on windows.

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

## svg2shenzen

An Inkscape plugin we use for PCB art, get it from [https://github.com/badgeek/svg2shenzhen](https://github.com/badgeek/svg2shenzhen) and install it as described there.

**Linux:** be sure to have lxml for python2 installed.

## Shitty Add-On library

Get it from [https://hackaday.io/project/52950/files](https://hackaday.io/project/52950/files)

## Simple SVG

Since the time is limited, you profit more, if you already bring a simple SVG. See  for some

### Installation

Since Kicads Library management is a bit quirky I usually just put the used external libraries into a folder inside my project folder. Works always.

\pagebreak

# Workflow

![General workflow](images/workflow.png)

That's roughly the workflow I use. You maybe found one which suits you better.

## svg2shenzen & Inkscape

1. Initalize a new drawing using *Extensions* $\rightarrow$ *Svg2Shenzhen* $\rightarrow$ *Prepare Document...*
2. Draw your thing. 
   1. Keep in mind, there are some layer combinations that make no sense.
   2. If the layers has the suffix *disabled* it is disabled. Rename it from *<X>-disabled* to *<X>*.
   3. Check if the layers are dark enough.
3. Convert objects to paths.
4. Export to KiCad.
   1. Check *Open Kicad after export?*.
   2. Uncheck *Open PCBWay after export?*.
   
## KiCad

### Draw schematics
- Place components using 

### Make components
- Symbol
- Footprint
- Add 3d model(s) to a footprint (if wanted)

### Annotate schematics
- Automatically number the components.
- Manually assign footprints to symbols.

### Schematic to layout
- Before KiCAD 5 it was needed to generate a netlist and load it into the layout.
- KiCAS 5 can do it in one step, by pressing **F8**

### Layerstack
- 2 layer: parts & routing & GND, routing & GND or VCC
- 4 layer: parts & routing(& GND), GND, VCC, GND & routing

### Layout
- **Tip:** Always start with diff pairs.
- **Tip:** Route mainly horizontal on one layer and mainly vertical on another.
- Tented vias: Some say do it, some say don't. I don't really know.

### Route
- 45° angles, 90° only if really needed (T-joints and the like)
- make polygons if possible
- .5 mm - .3 mm are etchable in your homelab
- vias are a pain if you etch the prints yourself

### Generate gerber
- Check if every layer you need is in the output.
- Check the gerbers after generating them.


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

# Shortcuts 

Some handy shortcuts I found out there on the Web.

| Key       | Schematic editor         | PCB Editor                     |
|:----------|:-------------------------|:-------------------------------|
| \keys{+}         |                          | **Switch to Next Layer**       |
| -         |                          | **Switch to Previous Layer**   |
| /         | Add Bus Entry            | Switch Track Posture           |
| ?         | Help                     |                                |
| A         | **Add Component**        |                                |
| B         | Begin Bus                |                                |
| Backspace |                          | Delete Track Segment           |
| C         | Copy Component or Label  | Copy Item                      |
| Ctrl+F    |                          | Find Item                      |
| Ctrl+L    |                          | Load Board                     |
| Ctrl+S    |                          | Save Board                     |
| Ctrl+V    |                          | Add Microvia                   |
| Ctrl+W    |                          | Switch Track Width to Previous |
| Ctrl+Y    |                          | Redo                           |
| Ctrl+Z    |                          | Undo                           |
| D         |                          | Drag Track, Keep Slope         |
| Del       | **Delete Item**          | Delete Item                    |
| E         | **Edit Item**            | Edit Item                      |
| End       |                          | End Track                      |
| F         | Edit Footprint           | Flip Item                      |
| F1        | Zoom In                  |                                |
| F2        | Zoom Out                 |                                |
| F3        | Zoom Redraw              |                                |
| F4        | Zoom Center              |                                |
| F5        |                          | Switch to Inner Layer 1        |
| F6        |                          | Switch to Inner Layer 2        |
| F8        | **Schematic to Layout**  |                                |
| G         | **Drag Item**            | **Drag Item**                  |
| H         | Add Hierarchical Label   | Switch Highcontrast Mode       |
| Home      | Fit on Screen            |                                |
| Insert    | Repeat Lest Item         |                                |
| J         | Add Junction             |                                |
| K         | End Line Wire Bus        | Track Display Mode             |
| L         | Add Label                | Lock/Unlock Footprint          |
| M         | **Move Item**            | **Move Item**                  |
| N         | Orient Normal Component  |                                |
| O         |                          | Add Module                     |
| P         | **Add Power**            | **Place Item**                 |
| PgDn      |                          | Switch to Cooper Layer         |
| PgUp      |                          | Switch to Component Layer      |
| Q         | Add No Connect Flag      |                                |
| R         | **Rotate Item**          | **Rotate Item**                |
| S         | Add Sheet                |                                |
| Spacebar  |                          | Reset Local Coordinates        |
| T         |                          | Get and Move Footprint         |
| Tab       | Move Block -> Drag Block |                                |
| U         | Edit Reference           |                                |
| V         | Edit Value               | **Add Via**                    |
| W         | **Begin Wire**           | Switch Track Width to Next     |
| X         | **Mirror X Component**   | **Add New Track**              |
| Y         | **Mirror Y Component**   |                                |
| Z         | Add Wire Entry           |                                |
| Alt+3     |                          | **3D Viewer**                  |

# Links
- [KiCAD getting started](http://docs.kicad-pcb.org/5.1.2/en/getting_started_in_kicad/getting_started_in_kicad.html)
- [shitty add on](https://hackaday.com/2019/03/20/introducing-the-shitty-add-on-v1-69bis-standard/)
- [svg2shenzhen](https://github.com/badgeek/svg2shenzhen)
- [badgelive parts KiCAD libs](https://hackaday.io/project/52950/files)
- [KiCad shortcuts](https://shortcutworld.com/KiCAD/win/KiCAD_Shortcuts)
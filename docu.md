---
header-includes: 
    \usepackage{tikz}
    \usetikzlibrary{shapes,arrows,chains}
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
| +         |                          | **Switch to Next Layer**       |
| -         |                          | **Switch to Previous Layer**   |
| /         | Add Bus Entry            | Switch Track Posture           |
| ?         | Help                     |                                |
| A         | Add Component            |                                |
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
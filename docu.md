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

# Workflow

$$
\colorlet{inkscape}{Green}
\colorlet{lcnorm}{Blue}
\colorlet{lccong}{Red}

\providecommand{\cmark}[2][]{\relax} 
\begin{tikzpicture}[%
    >=triangle 60,              % Nice arrows; your taste may be different
    start chain=going below,    % General flow is top-to-bottom
    node distance=6mm and 60mm, % Global setup of box spacing
    every join/.style={norm},   % Default linetype for connecting boxes
    ]
\tikzset{
  base/.style={draw, on chain, on grid, align=center, minimum height=4ex},
  proc/.style={base, rectangle, text width=8em},
  test/.style={base, diamond, aspect=2, text width=5em},
  term/.style={proc, rounded corners},
  % coord node style is used for placing corners of connecting lines
  coord/.style={coordinate, on chain, on grid, node distance=6mm and 25mm},
  % nmark node style is used for coordinate debugging marks
  nmark/.style={draw, cyan, circle, font={\sffamily\bfseries}},
  % -------------------------------------------------
  % Connector line styles for different parts of the diagram
  norm/.style={->, draw, lcnorm},
  free/.style={->, draw, inkscape},
  cong/.style={->, draw, lccong},
  it/.style={font={\small\itshape}}
}
% -------------------------------------------------
% Start by placing the nodes
\node [proc]                            (p0)    {Initialize the svg2shenzen plugin};                              
\node [proc, fill=inkscape!25, join]            {Draw in Inkscape};
\node [term, fill=inkscape!25, join]            {Convert objects to paths};
\node [proc, join]                              {Export to Kicad};
\node [proc, join]                              {Draw Schematic};
\node [test, join]                      (t0)    {Symbol esxists};
\node [coord, left=of t0]  (c5)  {}; \cmark{5}   
\node [coord, right=of t0] (c7)  {}; \cmark{7}   
%\path (t6.south) to node [near start, xshift=1em] {$y$} (t7); 
%  \draw [*->,inkscape] (t6.south) -- (t7); 
%\path (t7.east) to node [yshift=-1em] {$k \leq 0$} (c7); 
%  \draw [o->,inkscape] (t7.east) -- (c7)  |- (p9);
%\path (t7.west) to node [yshift=-1em] {$k>0$} (c5); 
%  \draw [*->,inkscape] (t7.west) -- (c5) |- (p5);

% Use join to connect a node to the previous one 
%\node [term, join]      {Trigger scheduler};
%\node [proc, join] (p1) {Get quota $k > 1$};
%\node [proc, join]      {Open queue};
%\node [proc, join]      {Dispatch message};
%\node [test, join] (t1) {Got msg?};
%% No join for exits from test nodes - connections have more complex
%% requirements
%% We continue until all the blocks are positioned
%\node [proc] (p2) {$k \mathbin{{-}{=}} 1$};
%\node [proc, join] (p3) {Dispatch message};
%\node [test, join] (t2) {Got msg?};
%\node [test] (t3) {Capacity?};
%\node [test] (t4) {$k \mathbin{{-}{=}} 1$};
%% We position the next block explicitly as the first block in the
%% second column.  The chain 'comes along with us'. The distance
%% between columns has already been defined, so we don't need to
%% specify it.
%\node [proc, join=by free] {Set \textsc{mq} wait flag};
%\node [proc, join=by free] (p5) {Dispatch message};
%\node [test, join=by free] (t5) {Got msg?};
%\node [test] (t6) {Capacity?};
%% Some more nodes specifically positioned (we could have avoided this,
%% but try it and you'll see the result is ugly).
%\node [test] (t7) [right=of t2] {$k \mathbin{{-}{=}} 1$};
%\node [proc, fill=lccong!25, right=of t3] (p8) {Set congestion};
%\node [proc, join=by cong, right=of t4] (p9) {Close queue};
%\node [term, join] (p10) {Exit trigger message thread};
%% -------------------------------------------------
%% Now we place the coordinate nodes for the connectors with angles, or
%% with annotations. We also mark them for debugging.
%\node [coord, right=of t1] (c1)  {}; \cmark{1}   
%\node [coord, right=of t3] (c3)  {}; \cmark{3}   
%\node [coord, right=of t6] (c6)  {}; \cmark{6}   
%\node [coord, right=of t7] (c7)  {}; \cmark{7}   
%\node [coord, left=of t4]  (c4)  {}; \cmark{4}   
%\node [coord, right=of t4] (c4r) {}; \cmark[r]{4}
%\node [coord, left=of t7]  (c5)  {}; \cmark{5}   
%% -------------------------------------------------
%% A couple of boxes have annotations
%\node [above=0mm of p4, it] {(Queue was empty)};
%\node [above=0mm of p8, it] {(Queue was not empty)};
%% -------------------------------------------------
%% All the other connections come out of tests and need annotating
%% First, the straight north-south connections. In each case, we first
%% draw a path with a (consistently positioned) annotation node, then
%% we draw the arrow itself.
%\path (t1.south) to node [near start, xshift=1em] {$y$} (p2);
%  \draw [*->,lcnorm] (t1.south) -- (p2);
%\path (t2.south) to node [near start, xshift=1em] {$y$} (t3); 
%  \draw [*->,lcnorm] (t2.south) -- (t3);
%\path (t3.south) to node [near start, xshift=1em] {$y$} (t4); 
%  \draw [*->,lcnorm] (t3.south) -- (t4);
%\path (t5.south) to node [near start, xshift=1em] {$y$} (t6); 
%  \draw [*->,inkscape] (t5.south) -- (t6);
%\path (t6.south) to node [near start, xshift=1em] {$y$} (t7); 
%  \draw [*->,inkscape] (t6.south) -- (t7); 
%% ------------------------------------------------- 
%% Now the straight east-west connections. To provide consistent
%% positioning of the test exit annotations, we have positioned
%% coordinates for the vertical part of the connectors. The annotation
%% text is positioned on a path to the coordinate, and then the whole
%% connector is drawn to its destination box.
%\path (t3.east) to node [near start, yshift=1em] {$n$} (c3); 
%  \draw [o->,lccong] (t3.east) -- (p8);
%\path (t4.east) to node [yshift=-1em] {$k \leq 0$} (c4r); 
%  \draw [o->,lcnorm] (t4.east) -- (p9);
%% -------------------------------------------------
%% Finally, the twisty connectors. Again, we place the annotation
%% first, then draw the connector
%\path (t1.east) to node [near start, yshift=1em] {$n$} (c1); 
%  \draw [o->,inkscape] (t1.east) -- (c1) |- (p4);
%\path (t2.east) -| node [very near start, yshift=1em] {$n$} (c1); 
%  \draw [o->,inkscape] (t2.east) -| (c1);
%\path (t4.west) to node [yshift=-1em] {$k>0$} (c4); 
%  \draw [*->,lcnorm] (t4.west) -- (c4) |- (p3);
%\path (t5.east) -| node [very near start, yshift=1em] {$n$} (c6); 
%  \draw [o->,inkscape] (t5.east) -| (c6); 
%\path (t6.east) to node [near start, yshift=1em] {$n$} (c6); 
%  \draw [o->,inkscape] (t6.east) -| (c7); 
%\path (t7.east) to node [yshift=-1em] {$k \leq 0$} (c7); 
%  \draw [o->,inkscape] (t7.east) -- (c7)  |- (p9);
%\path (t7.west) to node [yshift=-1em] {$k>0$} (c5); 
%  \draw [*->,inkscape] (t7.west) -- (c5) |- (p5);
\end{tikzpicture}
$$

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

Some handy shortcuts I found out there on the Web, bold the most usefull for this workshop.

## Schematic editor

| Key     | Action                   |
|:--------|:-------------------------|
| **A**   | Add Component            |
| **C**   | Copy Component or Label  |
| **Del** | Delete Item              |
| **E**   | Edit Item                |
| **G**   | Drag Item                |
| **M**   | Move Item                |
| **P**   | Add Power                |
| **R**   | Rotate Item              |
| **Tab** | Move Block -> Drag Block |
| **W**   | Begin Wire               |
| **X**   | Mirror X Component       |
| **Y**   | Mirror Y Component       |
| /       | Add Bus Entry            |
| ?       | Help                     |
| B       | Begin Bus                |
| F       | Edit Footprint           |
| F1      | Zoom In                  |
| F2      | Zoom Out                 |
| F3      | Zoom Redraw              |
| F4      | Zoom Center              |
| H       | Add Hierarchical Label   |
| Home    | Fit on Screen            |
| Insert  | Repeat Lest Item         |
| J       | Add Junction             |
| K       | End Line Wire Bus        |
| L       | Add Label                |
| N       | Orient Normal Component  |
| Q       | Add No Connect Flag      |
| S       | Add Sheet                |
| U       | Edit Reference           |
| V       | Edit Value               |
| Z       | Add Wire Entry           |

## PCB Editor

| Key       | Action                         |
|:----------|:-------------------------------|
| **+**     | Switch to Next Layer           |
| **-**     | Switch to Previous Layer       |
| **F**     | Flip Item                      |
| **G**     | Drag Item                      |
| **L**     | Lock/Unlock Footprint          |
| **M**     | Move Item                      |
| **R**     | Rotate Item                    |
| **V**     | Add Via                        |
| **X**     | Add New Track                  |
| /         | Switch Track Posture           |
| Backspace | Delete Track Segment           |
| C         | Copy Item                      |
| Ctrl+F    | Find Item                      |
| Ctrl+L    | Load Board                     |
| Ctrl+S    | Save Board                     |
| Ctrl+V    | Add Microvia                   |
| Ctrl+W    | Switch Track Width to Previous |
| Ctrl+Y    | Redo                           |
| Ctrl+Z    | Undo                           |
| D         | Drag Track, Keep Slope         |
| Delete    | Delete                         |
| End       | End Track                      |
| End       | Edit Item                      |
| F5        | Switch to Inner Layer 1        |
| F6        | Switch to Inner Layer 2        |
| H         | Switch Highcontrast Mode       |
| K         | Track Display Mode             |
| O         | Add Module                     |
| P         | Place Item                     |
| PgDn      | Switch to Cooper Layer         |
| PgUp      | Switch to Component Layer      |
| Spacebar  | Reset Local Coordinates        |
| T         | Get and Move Footprint         |
| W         | Switch Track Width to Next     |

# Links
- [KiCAD getting started](http://docs.kicad-pcb.org/5.1.2/en/getting_started_in_kicad/getting_started_in_kicad.html)
- [shitty add on](https://hackaday.com/2019/03/20/introducing-the-shitty-add-on-v1-69bis-standard/)
- [svg2shenzhen](https://github.com/badgeek/svg2shenzhen)
- [badgelive parts KiCAD libs](https://hackaday.io/project/52950/files)
- [KiCad shortcuts](https://shortcutworld.com/KiCAD/win/KiCAD_Shortcuts)
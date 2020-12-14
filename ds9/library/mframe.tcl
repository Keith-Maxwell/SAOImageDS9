#  Copyright (C) 1999-2018
#  Smithsonian Astrophysical Observatory, Cambridge, MA, USA
#  For conditions of distribution and use, see copyright notice in "copyright"

package provide DS9 1.0

# Menus

proc FrameMainMenu {} {
    global ds9
    global current

    ThemeMenu $ds9(mb).frame
    $ds9(mb).frame add command -label [msgcat::mc {New Frame}] \
	-command CreateFrame
    $ds9(mb).frame add command -label [msgcat::mc {New Frame RGB}] \
	-command CreateRGBFrame
    $ds9(mb).frame add command -label [msgcat::mc {New Frame 3D}] \
	-command Create3DFrame
    $ds9(mb).frame add separator
    $ds9(mb).frame add command -label [msgcat::mc {Delete Frame}] \
	-command DeleteCurrentFrame
    $ds9(mb).frame add command -label [msgcat::mc {Delete All Frames}] \
	-command DeleteAllFramesMenu
    $ds9(mb).frame add separator
    $ds9(mb).frame add command -label [msgcat::mc {Clear Frame}] \
	-command ClearCurrentFrame
    $ds9(mb).frame add command -label [msgcat::mc {Reset Frame}] \
	-command ResetCurrentFrame
    $ds9(mb).frame add command -label [msgcat::mc {Refresh Frame}] \
	-command UpdateCurrentFrame
    $ds9(mb).frame add separator
    $ds9(mb).frame add radiobutton -label [msgcat::mc {Single Frame}] \
	-variable current(display) -value single -command DisplayMode
    $ds9(mb).frame add radiobutton -label [msgcat::mc {Tile Frames}] \
	-variable current(display) -value tile -command DisplayMode
    $ds9(mb).frame add radiobutton -label [msgcat::mc {Blink Frames}] \
	-variable current(display) -value blink -command DisplayMode
    $ds9(mb).frame add separator
    $ds9(mb).frame add separator
    $ds9(mb).frame add cascade -label [msgcat::mc {Goto Frame}] \
	-menu $ds9(mb).frame.goto
    $ds9(mb).frame add cascade -label [msgcat::mc {Show/Hide Frames}] \
	-menu $ds9(mb).frame.active
    $ds9(mb).frame add cascade -label [msgcat::mc {Move Frame}] \
	-menu $ds9(mb).frame.move
    $ds9(mb).frame add separator
    $ds9(mb).frame add command -label [msgcat::mc {First Frame}] \
	-command FirstFrame
    $ds9(mb).frame add command -label [msgcat::mc {Previous Frame}] \
	-command PrevFrame
    $ds9(mb).frame add command -label [msgcat::mc {Next Frame}] \
	-command NextFrame
    $ds9(mb).frame add command -label [msgcat::mc {Last Frame}] \
	-command LastFrame
    $ds9(mb).frame add separator
    $ds9(mb).frame add command -label "[msgcat::mc {Cube}]..." \
	-command CubeDialog
    $ds9(mb).frame add command -label "[msgcat::mc {RGB}]..." \
	-command RGBDialog
    $ds9(mb).frame add command -label "[msgcat::mc {3D}]..." \
	-command 3DDialog
    $ds9(mb).frame add separator
    $ds9(mb).frame add cascade -label [msgcat::mc {Frame Parameters}] \
	-menu $ds9(mb).frame.params

    # active
    ThemeMenu $ds9(mb).frame.active
    $ds9(mb).frame.active add command -label [msgcat::mc {Show All}] \
	-command ActiveFrameAll
    $ds9(mb).frame.active add command -label [msgcat::mc {Hide All}] \
	-command ActiveFrameNone
    $ds9(mb).frame.active add separator

    # move
    ThemeMenu $ds9(mb).frame.move
    $ds9(mb).frame.move add command -label [msgcat::mc {First}] \
	-command MoveFirstFrame
    $ds9(mb).frame.move add command -label [msgcat::mc {Back}] \
	-command MovePrevFrame
    $ds9(mb).frame.move add command -label [msgcat::mc {Forward}] \
	-command MoveNextFrame
    $ds9(mb).frame.move add command -label [msgcat::mc {Last}] \
	-command MoveLastFrame

    ThemeMenu $ds9(mb).frame.goto

    # params
    ThemeMenu $ds9(mb).frame.params
    $ds9(mb).frame.params add cascade -label [msgcat::mc {Tile}] \
	-menu $ds9(mb).frame.params.tile
    $ds9(mb).frame.params add cascade -label [msgcat::mc {Blink Interval}] \
	-menu $ds9(mb).frame.params.blink
    $ds9(mb).frame.params add command -label [msgcat::mc {Display Size}] \
	-command DisplayDefaultDialog

    ThemeMenu $ds9(mb).frame.params.tile
    $ds9(mb).frame.params.tile add radiobutton -label [msgcat::mc {Grid}] \
	-variable tile(mode) -value grid -command DisplayMode
    $ds9(mb).frame.params.tile add radiobutton -label [msgcat::mc {Columns}] \
	-variable tile(mode) -value column -command DisplayMode
    $ds9(mb).frame.params.tile add radiobutton -label [msgcat::mc {Rows}] \
	-variable tile(mode) -value row -command DisplayMode
    $ds9(mb).frame.params.tile add separator
    $ds9(mb).frame.params.tile add command \
	-label "[msgcat::mc {Tile Parameters}]..." -command TileDialog

    ThemeMenu $ds9(mb).frame.params.blink
    $ds9(mb).frame.params.blink add radiobutton \
	-label "1/16 [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 6
    $ds9(mb).frame.params.blink add radiobutton \
	-label "1/8 [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 125
    $ds9(mb).frame.params.blink add radiobutton \
	-label "1/4 [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 250
    $ds9(mb).frame.params.blink add radiobutton \
	-label "1/2 [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 500
    $ds9(mb).frame.params.blink add radiobutton \
	-label "1 [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 1000
    $ds9(mb).frame.params.blink add radiobutton \
	-label "2  [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 2000
    $ds9(mb).frame.params.blink add radiobutton \
	-label "4 [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 4000
    $ds9(mb).frame.params.blink add radiobutton \
	-label "8 [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 8000
    $ds9(mb).frame.params.blink add radiobutton \
	-label "16 [msgcat::mc {Seconds}]" \
	-variable blink(interval) -value 16000
}

proc PrefsDialogFrameMenu {w} {
    set f [ttk::labelframe $w.mframe -text [msgcat::mc {Frame}]]

    ttk::menubutton $f.menu -text [msgcat::mc {Menu}] -menu $f.menu.menu
    PrefsDialogButtonbarFrame $f.buttonbar

    grid $f.menu $f.buttonbar -padx 2 -pady 2

    set m $f.menu.menu
    ThemeMenu $m
    $m add radiobutton -label [msgcat::mc {Single Frame}] \
	-variable pcurrent(display) -value single
    $m add radiobutton -label [msgcat::mc {Tile Frames}] \
	-variable pcurrent(display) -value tile
    $m add radiobutton -label [msgcat::mc {Blink Frames}] \
	-variable pcurrent(display) -value blink
    $m add separator
    $m add cascade -label [msgcat::mc {Frame Parameters}] \
	-menu $m.params

    ThemeMenu $m.params
    $m.params add cascade -label [msgcat::mc {Tile}] \
	-menu $m.params.tile
    $m.params add cascade -label [msgcat::mc {Blink Interval}] \
	-menu $m.params.blink

    ThemeMenu $m.params.tile
    $m.params.tile add radiobutton -label [msgcat::mc {Grid}] \
	-variable ptile(mode) -value grid
    $m.params.tile add radiobutton -label [msgcat::mc {Columns}] \
	-variable ptile(mode) -value column
    $m.params.tile add radiobutton -label [msgcat::mc {Rows}] \
	-variable ptile(mode) -value row

    ThemeMenu $m.params.blink
    $m.params.blink add radiobutton -label ".125 [msgcat::mc {Seconds}]" \
	-variable pblink(interval) -value 125
    $m.params.blink add radiobutton -label ".25 [msgcat::mc {Seconds}]" \
	-variable pblink(interval) -value 250
    $m.params.blink add radiobutton -label ".5 [msgcat::mc {Seconds}]" \
	-variable pblink(interval) -value 500
    $m.params.blink add radiobutton -label "1 [msgcat::mc {Seconds}]" \
	-variable pblink(interval) -value 1000
    $m.params.blink add radiobutton -label "2  [msgcat::mc {Seconds}]" \
	-variable pblink(interval) -value 2000
    $m.params.blink add radiobutton -label "4 [msgcat::mc {Seconds}]" \
	-variable pblink(interval) -value 4000
    $m.params.blink add radiobutton -label "8 [msgcat::mc {Seconds}]" \
	-variable pblink(interval) -value 8000

    pack $f -side top -fill both -expand true
}

# Buttons

proc ButtonsFrameDef {} {
    global pbuttons

    array set pbuttons {
	frame,new 1
	frame,newrgb 1
	frame,new3d 1
	frame,delete 1
	frame,deleteall 0
	frame,clear 1
	frame,reset 0
	frame,refresh 0
	frame,single 1
	frame,tile 1
	frame,blink 1

	frame,match,bin 0
	frame,match,axes 0
	frame,match,scale 0
	frame,match,scalelimits 0
	frame,match,color 0
	frame,match,smooth 0

	frame,match,frame,wcs 0
	frame,match,frame,image 0
	frame,match,frame,physical 0
	frame,match,frame,detector 0
	frame,match,frame,amplifier 0

	frame,match,crosshair,wcs 0
	frame,match,crosshair,image 0
	frame,match,crosshair,physical 0
	frame,match,crosshair,detector 0
	frame,match,crosshair,amplifier 0

	frame,match,crop,wcs 0
	frame,match,crop,image 0
	frame,match,crop,physical 0
	frame,match,crop,detector 0
	frame,match,crop,amplifier 0

	frame,match,cube,wcs 0
	frame,match,cube,image 0

	frame,lock,bin 0
	frame,lock,axes 0
	frame,lock,scale 0
	frame,lock,scalelimits 0
	frame,lock,color 0
	frame,lock,smooth 0

	frame,lock,frame,none 0
	frame,lock,frame,wcs 0
	frame,lock,frame,image 0
	frame,lock,frame,physical 0
	frame,lock,frame,detector 0
	frame,lock,frame,amplifier 0

	frame,lock,crosshair,none 0
	frame,lock,crosshair,wcs 0
	frame,lock,crosshair,image 0
	frame,lock,crosshair,physical 0
	frame,lock,crosshair,detector 0
	frame,lock,crosshair,amplifier 0

	frame,lock,crop,none 0
	frame,lock,crop,wcs 0
	frame,lock,crop,image 0
	frame,lock,crop,physical 0
	frame,lock,crop,detector 0
	frame,lock,crop,amplifier 0

	frame,lock,cube,none 0
	frame,lock,cube,wcs 0
	frame,lock,cube,image 0

	frame,movefirst 0
	frame,moveprev 0
	frame,movenext 0
	frame,movelast 0
	frame,first 1
	frame,prev 1
	frame,next 1
	frame,last 1
	frame,cube 0
	frame,rgb 0
	frame,3d 0
	frame,size 0
    }
}

proc CreateButtonsFrame {} {
    global buttons
    global ds9
    global current

    ttk::frame $ds9(buttons).frame

    ButtonButton $ds9(buttons).frame.new \
	[string tolower [msgcat::mc {New}]] CreateFrame
    ButtonButton $ds9(buttons).frame.newrgb \
	[string tolower [msgcat::mc {RGB}]] CreateRGBFrame
    ButtonButton $ds9(buttons).frame.new3d \
	[string tolower [msgcat::mc {3D}]] Create3DFrame

    ButtonButton $ds9(buttons).frame.delete \
	[string tolower [msgcat::mc {Delete}]] DeleteCurrentFrame
    ButtonButton $ds9(buttons).frame.deleteall \
	[string tolower [msgcat::mc {Delete All}]] DeleteAllFramesMenu

    ButtonButton $ds9(buttons).frame.clear \
	[string tolower [msgcat::mc {Clear}]] ClearCurrentFrame
    ButtonButton $ds9(buttons).frame.reset \
	[string tolower [msgcat::mc {Reset}]] ResetCurrentFrame
    ButtonButton $ds9(buttons).frame.refresh \
	[string tolower [msgcat::mc {Refresh}]] UpdateCurrentFrame

    RadioButton $ds9(buttons).frame.single \
	[string tolower [msgcat::mc {Single}]] \
	current(display) single DisplayMode
    RadioButton $ds9(buttons).frame.tile \
	[string tolower [msgcat::mc {Tile}]] \
	current(display) tile DisplayMode
    RadioButton $ds9(buttons).frame.blink \
	[string tolower [msgcat::mc {Blink}]] \
	current(display) blink DisplayMode

    ButtonButton $ds9(buttons).frame.movefirst \
	[string tolower [msgcat::mc {Move First}]] MoveFirstFrame
    ButtonButton $ds9(buttons).frame.moveprev \
	[string tolower [msgcat::mc {Move Back}]] MovePrevFrame
    ButtonButton $ds9(buttons).frame.movenext \
	[string tolower [msgcat::mc {Move Forward}]] MoveNextFrame
    ButtonButton $ds9(buttons).frame.movelast \
	[string tolower [msgcat::mc {Move Last}]] MoveLastFrame

    ButtonButton $ds9(buttons).frame.first \
	[string tolower [msgcat::mc {First}]] FirstFrame
    ButtonButton $ds9(buttons).frame.prev \
	[string tolower [msgcat::mc {Prev}]] PrevFrame
    ButtonButton $ds9(buttons).frame.next \
	[string tolower [msgcat::mc {Next}]] NextFrame
    ButtonButton $ds9(buttons).frame.last \
	[string tolower [msgcat::mc {Last}]] LastFrame

    ButtonButton $ds9(buttons).frame.cube \
	[string tolower "[msgcat::mc {Cube}]..."] CubeDialog
    ButtonButton $ds9(buttons).frame.rgb \
	[string tolower "[msgcat::mc {RGB}]..."] RGBDialog
    ButtonButton $ds9(buttons).frame.3d \
	[string tolower "[msgcat::mc {3D}]..."] 3DDialog

    ButtonButton $ds9(buttons).frame.size \
	[string tolower [msgcat::mc {Size}]] DisplayDefaultDialog

    set buttons(frame) "
        $ds9(buttons).frame.new pbuttons(frame,new)
        $ds9(buttons).frame.newrgb pbuttons(frame,newrgb)
        $ds9(buttons).frame.new3d pbuttons(frame,new3d)
        $ds9(buttons).frame.delete pbuttons(frame,delete)
        $ds9(buttons).frame.deleteall pbuttons(frame,deleteall)
        $ds9(buttons).frame.clear pbuttons(frame,clear)
        $ds9(buttons).frame.reset pbuttons(frame,reset)
        $ds9(buttons).frame.refresh pbuttons(frame,refresh)
        $ds9(buttons).frame.single pbuttons(frame,single)
        $ds9(buttons).frame.tile pbuttons(frame,tile)
        $ds9(buttons).frame.blink pbuttons(frame,blink)

        $ds9(buttons).frame.movefirst pbuttons(frame,movefirst)
        $ds9(buttons).frame.moveprev pbuttons(frame,moveprev)
        $ds9(buttons).frame.movenext pbuttons(frame,movenext)
        $ds9(buttons).frame.movelast pbuttons(frame,movelast)
        $ds9(buttons).frame.first pbuttons(frame,first)
        $ds9(buttons).frame.prev pbuttons(frame,prev)
        $ds9(buttons).frame.next pbuttons(frame,next)
        $ds9(buttons).frame.last pbuttons(frame,last)
        $ds9(buttons).frame.cube pbuttons(frame,cube)
        $ds9(buttons).frame.rgb pbuttons(frame,rgb)
        $ds9(buttons).frame.3d pbuttons(frame,3d)
        $ds9(buttons).frame.size pbuttons(frame,size)
    "
}

proc PrefsDialogButtonbarFrame {f} {
    global buttons
    global pbuttons
    global ds9

    ttk::menubutton $f -text [msgcat::mc {Buttonbar}] -menu $f.menu
    
    set m $f.menu
    ThemeMenu $m
    $m add checkbutton -label [msgcat::mc {New Frame}] \
	-variable pbuttons(frame,new) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {New Frame RGB}] \
	-variable pbuttons(frame,newrgb) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {New Frame 3D}] \
	-variable pbuttons(frame,new3d) -command {UpdateButtons buttons(frame)}
    $m add separator
    $m add checkbutton -label [msgcat::mc {Delete Frame}] \
	-variable pbuttons(frame,delete) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {Delete All Frames}] \
	-variable pbuttons(frame,deleteall) -command {UpdateButtons buttons(frame)}
    $m add separator
    $m add checkbutton -label [msgcat::mc {Clear Frame}] \
	-variable pbuttons(frame,clear) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {Reset Frame}] \
	-variable pbuttons(frame,reset) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {Refresh Frame}] \
	-variable pbuttons(frame,refresh) -command {UpdateButtons buttons(frame)}
    $m add separator
    $m add checkbutton -label [msgcat::mc {Single Frame}] \
	-variable pbuttons(frame,single) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {Tile Frames}] \
	-variable pbuttons(frame,tile) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {Blink Frames}] \
	-variable pbuttons(frame,blink) -command {UpdateButtons buttons(frame)}
    $m add separator
    $m add separator
    $m add cascade -label [msgcat::mc {Move Frame}] -menu $m.move
    $m add separator
    $m add checkbutton -label [msgcat::mc {First Frame}] \
	-variable pbuttons(frame,first) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {Previous Frame}] \
	-variable pbuttons(frame,prev) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {Next Frame}] \
	-variable pbuttons(frame,next) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label [msgcat::mc {Last Frame}] \
	-variable pbuttons(frame,last) -command {UpdateButtons buttons(frame)}
    $m add separator
    $m add checkbutton -label "[msgcat::mc {Cube}]..." \
	-variable pbuttons(frame,cube) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label "[msgcat::mc {RGB}]..." \
	-variable pbuttons(frame,rgb) -command {UpdateButtons buttons(frame)}
    $m add checkbutton -label "[msgcat::mc {3D}]..." \
	-variable pbuttons(frame,3d) -command {UpdateButtons buttons(frame)}
    $m add separator
    $m add cascade -label [msgcat::mc {Frame Parameters}] -menu $m.params


    # move
    ThemeMenu $m.move
    $m.move add checkbutton -label [msgcat::mc {First}] \
	-variable pbuttons(frame,movefirst) \
	-command {UpdateButtons buttons(frame)}
    $m.move add checkbutton -label [msgcat::mc {Back}] \
	-variable pbuttons(frame,moveprev) \
	-command {UpdateButtons buttons(frame)}
    $m.move add checkbutton -label [msgcat::mc {Forward}] \
	-variable pbuttons(frame,movenext) \
	-command {UpdateButtons buttons(frame)}
    $m.move add checkbutton -label [msgcat::mc {Last}] \
	-variable pbuttons(frame,movelast) \
	-command {UpdateButtons buttons(frame)}

    # params
    ThemeMenu $m.params
    $m.params add checkbutton -label [msgcat::mc {Display Size}] \
	-variable pbuttons(frame,size) -command {UpdateButtons buttons(frame)}
}

# Support

proc UpdateFrameMenu {} {
    global ds9
    global current

    global debug
    if {$debug(tcl,update)} {
	puts stderr "UpdateFrameMenu"
    }

    $ds9(mb).frame entryconfig [msgcat::mc {New Frame RGB}] -state normal
    $ds9(buttons).frame.newrgb configure -state normal

    if {$ds9(active,num) > 0} {
	$ds9(mb).frame entryconfig [msgcat::mc {Delete Frame}] -state normal
	$ds9(mb).frame entryconfig [msgcat::mc {Delete All Frames}] -state normal

	$ds9(mb).frame entryconfig [msgcat::mc {Clear Frame}] -state normal
	$ds9(mb).frame entryconfig [msgcat::mc {Reset Frame}] -state normal
	$ds9(mb).frame entryconfig [msgcat::mc {Refresh Frame}] -state normal

	$ds9(mb).frame entryconfig [msgcat::mc {Single Frame}] -state normal
	$ds9(mb).frame entryconfig [msgcat::mc {Tile Frames}] -state normal
	$ds9(mb).frame entryconfig [msgcat::mc {Blink Frames}] -state normal

	$ds9(mb).frame entryconfig [msgcat::mc {Move Frame}] -state normal

	$ds9(mb).frame entryconfig [msgcat::mc {First Frame}] -state normal
	$ds9(mb).frame entryconfig [msgcat::mc {Previous Frame}] -state normal
	$ds9(mb).frame entryconfig [msgcat::mc {Next Frame}] -state normal
	$ds9(mb).frame entryconfig [msgcat::mc {Last Frame}] -state normal

	$ds9(buttons).frame.delete configure -state normal
	$ds9(buttons).frame.deleteall configure -state normal

	$ds9(buttons).frame.clear configure -state normal
	$ds9(buttons).frame.reset configure -state normal
	$ds9(buttons).frame.refresh configure -state normal

	$ds9(buttons).frame.single configure -state normal
	$ds9(buttons).frame.tile configure -state normal
	$ds9(buttons).frame.blink configure -state normal

	$ds9(buttons).frame.movefirst configure -state normal
	$ds9(buttons).frame.moveprev configure -state normal
	$ds9(buttons).frame.movenext configure -state normal
	$ds9(buttons).frame.movelast configure -state normal

	$ds9(buttons).frame.first configure -state normal
	$ds9(buttons).frame.prev configure -state normal
	$ds9(buttons).frame.next configure -state normal
	$ds9(buttons).frame.last configure -state normal
    } else {
	$ds9(mb).frame entryconfig [msgcat::mc {Delete Frame}] -state disabled
	$ds9(mb).frame entryconfig [msgcat::mc {Delete All Frames}] -state disabled

	$ds9(mb).frame entryconfig [msgcat::mc {Clear Frame}] -state disabled
	$ds9(mb).frame entryconfig [msgcat::mc {Reset Frame}] -state disabled
	$ds9(mb).frame entryconfig [msgcat::mc {Refresh Frame}] -state disabled

	$ds9(mb).frame entryconfig [msgcat::mc {Single Frame}] -state disabled
	$ds9(mb).frame entryconfig [msgcat::mc {Tile Frames}] -state disabled
	$ds9(mb).frame entryconfig [msgcat::mc {Blink Frames}] -state disabled

	$ds9(mb).frame entryconfig [msgcat::mc {Move Frame}] -state disabled

	$ds9(mb).frame entryconfig [msgcat::mc {First Frame}] -state disabled
	$ds9(mb).frame entryconfig [msgcat::mc {Previous Frame}] -state disabled
	$ds9(mb).frame entryconfig [msgcat::mc {Next Frame}] -state disabled
	$ds9(mb).frame entryconfig [msgcat::mc {Last Frame}] -state disabled

	$ds9(buttons).frame.delete configure -state disabled
	$ds9(buttons).frame.deleteall configure -state disabled

	$ds9(buttons).frame.clear configure -state disabled
	$ds9(buttons).frame.reset configure -state disabled
	$ds9(buttons).frame.refresh configure -state disabled

	$ds9(buttons).frame.single configure -state disabled
	$ds9(buttons).frame.tile configure -state disabled
	$ds9(buttons).frame.blink configure -state disabled

	$ds9(buttons).frame.movefirst configure -state disabled
	$ds9(buttons).frame.moveprev configure -state disabled
	$ds9(buttons).frame.movenext configure -state disabled
	$ds9(buttons).frame.movelast configure -state disabled

	$ds9(buttons).frame.first configure -state disabled
	$ds9(buttons).frame.prev configure -state disabled
	$ds9(buttons).frame.next configure -state disabled
	$ds9(buttons).frame.last configure -state disabled
    }

    if {$current(frame) != {}} {
	$ds9(mb).frame entryconfig "[msgcat::mc {Cube}]..." \
	    -state normal
	$ds9(buttons).frame.cube configure -state normal

	switch -- [$current(frame) get type] {
	    base {
		$ds9(mb).frame entryconfig "[msgcat::mc {RGB}]..." \
		    -state disabled
		$ds9(mb).frame entryconfig "[msgcat::mc {3D}]..." \
		    -state normal
		$ds9(buttons).frame.rgb configure -state disabled
		$ds9(buttons).frame.3d configure -state normal
	    }
	    rgb {
		$ds9(mb).frame entryconfig "[msgcat::mc {RGB}]..." \
		    -state normal
		$ds9(mb).frame entryconfig "[msgcat::mc {3D}]..." \
		    -state disabled
		$ds9(buttons).frame.rgb configure -state normal
		$ds9(buttons).frame.3d configure -state disabled
	    }
	    3d {
		$ds9(mb).frame entryconfig "[msgcat::mc {RGB}]..." \
		    -state disabled
		$ds9(mb).frame entryconfig "[msgcat::mc {3D}]..."  \
		    -state normal
		$ds9(buttons).frame.rgb configure -state disabled
		$ds9(buttons).frame.3d configure -state normal
	    }
	}
    } else {
	$ds9(mb).frame entryconfig "[msgcat::mc {Cube}]..." \
	    -state disabled
	$ds9(mb).frame entryconfig "[msgcat::mc {RGB}]..." \
	    -state disabled
	$ds9(mb).frame entryconfig "[msgcat::mc {3D}]..." \
	    -state disabled
	$ds9(buttons).frame.cube configure -state disabled
	$ds9(buttons).frame.rgb configure -state disabled
	$ds9(buttons).frame.3d configure -state disabled
    }
}

proc UpdateFrameMenuItems {} {
    global ds9

    global debug
    if {$debug(tcl,update)} {
	puts stderr "UpdateFrameMenuItems"
    }

    # Goto Frame Menu
    if {[$ds9(mb).frame.goto index end] >= $ds9(menu,size,frame,goto)} {
	$ds9(mb).frame.goto delete $ds9(menu,size,frame,goto) end
    }

    set cnt $ds9(menu,size,frame,goto)
    foreach f $ds9(frames) {
	set which "[msgcat::mc {Frame}] [string range $f 5 end]"
	$ds9(mb).frame.goto add radiobutton -label $which \
	    -variable ds9(next) -value $f -command GotoFrame

	# wrap if needed
	incr cnt
	if {$cnt>=$ds9(menu,size,wrap)} {
	    set cnt 1
	    $ds9(mb).frame.goto entryconfig $which -columnbreak 1
	}
    }

    # Active Frame Menu
    if {[$ds9(mb).frame.active index end] >= $ds9(menu,size,frame,active)} {
	$ds9(mb).frame.active delete $ds9(menu,size,frame,active) end
    }

    set cnt $ds9(menu,size,frame,active)
    foreach f $ds9(frames) {
	set which "[msgcat::mc {Frame}] [string range $f 5 end]"
	$ds9(mb).frame.active add checkbutton -label $which \
	    -variable active($f) -command UpdateActiveFrames

	# wrap if needed
	incr cnt
	if {$cnt>=$ds9(menu,size,wrap)} {
	    set cnt 1
	    $ds9(mb).frame.active entryconfig $which -columnbreak 1
	}
    }
}


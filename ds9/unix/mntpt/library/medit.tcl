#  Copyright (C) 1999-2018
#  Smithsonian Astrophysical Observatory, Cambridge, MA, USA
#  For conditions of distribution and use, see copyright notice in "copyright"

package provide DS9 1.0

# Menus

proc EditMainMenu {} {
    global ds9
    global current

    ThemeMenu $ds9(mb).edit
    $ds9(mb).edit add command -label [msgcat::mc {Undo}] -command UndoFrame \
	-accelerator "${ds9(ctrl)}Z"
    $ds9(mb).edit add separator
    $ds9(mb).edit add command -label [msgcat::mc {Cut}] -command CutFrame \
	-accelerator "${ds9(ctrl)}X"
    $ds9(mb).edit add command -label [msgcat::mc {Copy}] -command CopyFrame \
	-accelerator "${ds9(ctrl)}C"
    $ds9(mb).edit add command -label [msgcat::mc {Paste}] -command PasteFrame \
	-accelerator "${ds9(ctrl)}V"
    $ds9(mb).edit add separator
    $ds9(mb).edit add radiobutton -label [msgcat::mc {None}] \
	-variable current(mode) -value none -command ChangeMode \
	-accelerator "${ds9(ctrl)}N"
    $ds9(mb).edit add radiobutton -label [msgcat::mc {Region}] \
	-variable current(mode) -value region -command ChangeMode \
	-accelerator "${ds9(ctrl)}R"
    $ds9(mb).edit add radiobutton -label [msgcat::mc {Crosshair}] \
	-variable current(mode) -value crosshair -command ChangeMode
    $ds9(mb).edit add radiobutton -label [msgcat::mc {Colorbar}] \
	-variable current(mode) -value colorbar -command ChangeMode

    $ds9(mb).edit add radiobutton -label [msgcat::mc {Footprint}] \
	-variable current(mode) -value footprint -command ChangeMode



    switch $ds9(wm) {
	x11 -
	win32 {
	    $ds9(mb).edit add separator
	    $ds9(mb).edit add command -label "[msgcat::mc {Preferences}]..." \
		-command PrefsDialog -accelerator "${ds9(ctrl)},"

	}
	aqua {}
    }

    # Bindings
    bind $ds9(top) <<Undo>> UndoFrame
    bind $ds9(top) <<Cut>> CutFrame
    bind $ds9(top) <<Copy>> CopyFrame
    bind $ds9(top) <<Paste>> PasteFrame

    bind $ds9(top) <<None>>  [list ChangeModeItem none]
    bind $ds9(top) <<Region>> [list ChangeModeItem region]

    switch $ds9(wm) {
	x11 -
	win32 {bind $ds9(top) <<Pref>> PrefsDialog}
	aqua {}
    }
}

proc PrefsDialogEditMenu {w} {
    global ds9

    set f [ttk::labelframe $w.medit -text [msgcat::mc {Edit}]]

    ttk::menubutton $f.menu -text [msgcat::mc {Menu}] -menu $f.menu.menu
    PrefsDialogButtonbarEdit $f.buttonbar

    grid $f.menu $f.buttonbar -padx 2 -pady 2

    set m $f.menu.menu
    ThemeMenu $m
    $m add radiobutton -label [msgcat::mc {None}] \
	-variable pcurrent(mode) -value none
    $m add radiobutton -label [msgcat::mc {Region}] \
	-variable pcurrent(mode) -value region
    $m add radiobutton -label [msgcat::mc {Crosshair}] \
	-variable pcurrent(mode) -value crosshair
    $m add radiobutton -label [msgcat::mc {Colorbar}] \
	-variable pcurrent(mode) -value colorbar

    $m add radiobutton -label [msgcat::mc {Footprint}] \
	-variable pcurrent(mode) -value footprint


    pack $f -side top -fill both -expand true
}

# Buttons

proc ButtonsEditDef {} {
    global pbuttons

    array set pbuttons {
	edit,undo 0 
	edit,cut 0
	edit,copy 0
	edit,paste 0
	edit,none 1
	edit,region 1
	edit,crosshair 1
	edit,colorbar 1
	edit,pan 1
	edit,zoom 1
	edit,rotate 1
	edit,crop 1
	edit,catalog 1
	edit,footprint 1
	edit,examine 1
	edit,3d 1
	edit,prefs 0
    }
}

proc CreateButtonsEdit {} {
    global buttons
    global ds9
    global current

    ttk::frame $ds9(buttons).edit

    ButtonButton $ds9(buttons).edit.undo \
	[string tolower [msgcat::mc {Undo}]] UndoFrame
    ButtonButton $ds9(buttons).edit.cut \
	[string tolower [msgcat::mc {Cut}]] CutFrame
    ButtonButton $ds9(buttons).edit.copy \
	[string tolower [msgcat::mc {Copy}]] CopyFrame
    ButtonButton $ds9(buttons).edit.paste \
	[string tolower [msgcat::mc {Paste}]] PasteFrame

    RadioButton $ds9(buttons).edit.none \
	[string tolower [msgcat::mc {None}]] \
	current(mode) none ChangeMode
    RadioButton $ds9(buttons).edit.region \
	[string tolower [msgcat::mc {Region}]] \
	current(mode) region ChangeMode
    RadioButton $ds9(buttons).edit.crosshair \
	[string tolower [msgcat::mc {Cross}]] \
	current(mode) crosshair ChangeMode
    RadioButton $ds9(buttons).edit.colorbar \
	[string tolower [msgcat::mc {Colorbar}]] \
	current(mode) colorbar ChangeMode

    RadioButton $ds9(buttons).edit.footprint \
        [string tolower [msgcat::mc {FP}]] \
        current(mode) footprint ChangeMode

    ButtonButton $ds9(buttons).edit.prefs \
	[string tolower [msgcat::mc {Preferences}]] PrefsDialog

    set buttons(edit) "
        $ds9(buttons).edit.undo pbuttons(edit,undo)
        $ds9(buttons).edit.cut pbuttons(edit,cut)
        $ds9(buttons).edit.copy pbuttons(edit,copy)
        $ds9(buttons).edit.paste pbuttons(edit,paste)
        $ds9(buttons).edit.none pbuttons(edit,none)
        $ds9(buttons).edit.region pbuttons(edit,region)
        $ds9(buttons).edit.crosshair pbuttons(edit,crosshair)
        $ds9(buttons).edit.colorbar pbuttons(edit,colorbar)
        $ds9(buttons).edit.footprint pbuttons(edit,footprint)                   
        $ds9(buttons).edit.prefs pbuttons(edit,prefs)
    "
}

proc PrefsDialogButtonbarEdit {f} {
    global ds9
    global buttons
    global pbuttons

    ttk::menubutton $f -text [msgcat::mc {Buttonbar}] -menu $f.menu
    
    set m $f.menu
    ThemeMenu $m
    $m add checkbutton -label [msgcat::mc {Undo}] \
	-variable pbuttons(edit,undo) -command {UpdateButtons buttons(edit)}
    $m add separator
    $m add checkbutton -label [msgcat::mc {Cut}] \
	-variable pbuttons(edit,cut) -command {UpdateButtons buttons(edit)}
    $m add checkbutton -label [msgcat::mc {Copy}] \
	-variable pbuttons(edit,copy) -command {UpdateButtons buttons(edit)}
    $m add checkbutton -label [msgcat::mc {Paste}] \
	-variable pbuttons(edit,paste) -command {UpdateButtons buttons(edit)}
    $m add separator
    $m add checkbutton -label [msgcat::mc {None}] \
	-variable pbuttons(edit,none) -command {UpdateButtons buttons(edit)}
    $m add checkbutton -label [msgcat::mc {Region}] \
	-variable pbuttons(edit,region) -command {UpdateButtons buttons(edit)}
    $m add checkbutton -label [msgcat::mc {Crosshair}] \
	-variable pbuttons(edit,crosshair) -command {UpdateButtons buttons(edit)}
    $m add checkbutton -label [msgcat::mc {Colorbar}] \
	-variable pbuttons(edit,colorbar) -command {UpdateButtons buttons(edit)}

    $m add checkbutton -label [msgcat::mc {Footprint}] \
	-variable pbuttons(edit,footprint) -command {UpdateButtons buttons(edit)}

    $m add checkbutton -label [msgcat::mc {Preferences}] \
	-variable pbuttons(edit,prefs) -command {UpdateButtons buttons(edit)}
}

# Support

proc UpdateEditMenu {} {
    global ds9
    global current
    global marker

    global debug
    if {$debug(tcl,update)} {
	puts stderr "UpdateEditMenu"
    }

    switch -- $current(mode) {
	pointer -
	region {
	    if {$current(frame) != {}} {
		set l [$current(frame) has marker undo]
		if {$l != {}} {
		    $ds9(mb).edit entryconfig [msgcat::mc {Undo}] \
			-state normal
		} else {
		    $ds9(mb).edit entryconfig [msgcat::mc {Undo}] \
			-state disabled
		}

		if {[$current(frame) has marker select]} {
		    $ds9(mb).edit entryconfig [msgcat::mc {Cut}] \
			-state normal
		    $ds9(mb).edit entryconfig [msgcat::mc {Copy}] \
			-state normal
		} else {
		    $ds9(mb).edit entryconfig [msgcat::mc {Cut}] \
			-state disabled
		    $ds9(mb).edit entryconfig [msgcat::mc {Copy}] \
			-state disabled
		}

		if {$marker(copy) != {} } {
		    if {[$marker(copy) has marker paste]} {
			$ds9(mb).edit entryconfig [msgcat::mc {Paste}] \
			    -state normal
		    } else {
			$ds9(mb).edit entryconfig [msgcat::mc {Paste}] \
			    -state disabled
		    }
		} else {
		    $ds9(mb).edit entryconfig [msgcat::mc {Paste}] \
			-state disabled
		}
	    } else {
		$ds9(mb).edit entryconfig [msgcat::mc {Undo}] -state disabled
		$ds9(mb).edit entryconfig [msgcat::mc {Cut}] -state disabled
		$ds9(mb).edit entryconfig [msgcat::mc {Copy}] -state disabled
		$ds9(mb).edit entryconfig [msgcat::mc {Paste}] -state disabled
	    }
	}
	none -
	crosshair -
	colorbar -
	pan -
	zoom -
	rotate -
	crop -
	catalog -
	footprint -
	examine -
	iexam -
	3d {$ds9(mb).edit entryconfig [msgcat::mc {Undo}] -state disabled}
    }
}

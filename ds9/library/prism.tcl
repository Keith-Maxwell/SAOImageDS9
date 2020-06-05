#  Copyright (C) 1999-2020
#  Smithsonian Astrophysical Observatory, Cambridge, MA, USA
#  For conditions of distribution and use, see copyright notice in "copyright"

package provide DS9 1.0

proc PrismDef {} {
    global prism
    global iprism
    global pprism

    set iprism(top) .prism
    set iprism(mb) .prismmb

    set iprism(minrows) 20
    set iprism(mincols) 10
}

proc PrismDialog {} {
    global prism
    global iprism
    global dprism
    global ds9

    # see if we already have a window visible
    if {[winfo exists $iprism(top)]} {
	raise $iprism(top)
	return
    }

    # create the window
    set w $iprism(top)
    set mb $iprism(mb)

    set dprism(tbldb) prismtbldb

    Toplevel $w $mb 6 [msgcat::mc {Prism}] PrismDestroyDialog
    $mb add cascade -label [msgcat::mc {File}] -menu $mb.file
    $mb add cascade -label [msgcat::mc {Edit}] -menu $mb.edit

    ThemeMenu $mb.file
    $mb.file add command -label [msgcat::mc {Load}] -command PrismLoad 
    $mb.file add separator
    $mb.file add command -label [msgcat::mc {Clear}] -command PrismClear
    $mb.file add separator
    $mb.file add command -label [msgcat::mc {Plot}] -command PrismPlot
    $mb.file add command -label [msgcat::mc {Histogram}] -command PrismHistogram
    $mb.file add command -label [msgcat::mc {Image}] -command PrismImage
    $mb.file add separator
    $mb.file add command -label [msgcat::mc {Close}] \
	-command PrismDestroyDialog -accelerator "${ds9(ctrl)}W"

    EditMenu $mb iprism

    # Param
    set p [ttk::frame $w.param]

    # Exts
    set f [ttk::labelframe $p.ext -text [msgcat::mc {Extensions}]]

    ttk::scrollbar $f.scroll -command [list $f.box yview]
    set dprism(ext) [ttk::treeview $f.box \
			     -yscroll [list $f.scroll set] \
			     -selectmode browse \
			     -height 10 \
			     -show headings \
			     -columns {ext type dim} \
			 ]
    $dprism(ext) column ext -minwidth 100 -width 100 -anchor w
    $dprism(ext) column type -minwidth 50 -width 50 -anchor w
    $dprism(ext) column dim -minwidth 220 -width 220 -anchor w

    $dprism(ext) heading ext -text [msgcat::mc {Extension}] -anchor w
    $dprism(ext) heading type -text [msgcat::mc {Type}] -anchor w
    $dprism(ext) heading dim -text [msgcat::mc {Dimensions}] -anchor w

    grid $f.box $f.scroll -sticky news
    grid rowconfigure $f 0 -weight 1
    grid columnconfigure $f 2 -weight 1

    bind $dprism(ext) <<TreeviewSelect>> PrismExtCmd

    grid $f -row 0 -column 0

    # Header
    set f [ttk::labelframe $p.header -text [msgcat::mc {Header}]]

    ttk::scrollbar $f.scroll -command [list $f.box yview]
    set dprism(header) [ttk::treeview $f.box \
			     -yscroll [list $f.scroll set] \
			     -selectmode browse \
			     -height 10 \
			     -show headings \
			     -columns {name value type comment unit} \
			 ]
    $dprism(header) column name -minwidth 100 -width 100 -anchor w
    $dprism(header) column value -minwidth 300 -width 300 -anchor w
    $dprism(header) column type -minwidth 50 -width 50 -anchor w
    $dprism(header) column comment -minwidth 300 -width 300 -anchor w
    $dprism(header) column unit -minwidth 40 -width 40 -anchor w

    $dprism(header) heading name -text [msgcat::mc {Name}] -anchor w
    $dprism(header) heading value -text [msgcat::mc {Value}] -anchor w
    $dprism(header) heading type -text [msgcat::mc {Type}] -anchor w
    $dprism(header) heading comment -text [msgcat::mc {Comment}] -anchor w
    $dprism(header) heading unit -text [msgcat::mc {Units}] -anchor w

    grid $f.box $f.scroll -sticky news
    grid rowconfigure $f 0 -weight 1
    grid columnconfigure $f 2 -weight 1

    bind $dprism(header) <<TreeviewSelect>> PrismHeaderCmd

#    pack $f -fill both -expand true
    grid $f -row 0 -column 1

    # Table
    set f [ttk::labelframe $w.tbl -text [msgcat::mc {Extension Data}]]

    set dprism(tbl) [table $f.t \
		      -state disabled \
		      -usecommand 0 \
		      -variable $dprism(tbldb) \
		      -colorigin 1 \
		      -roworigin 0 \
		      -cols $iprism(mincols) \
		      -rows $iprism(minrows) \
		      -width -1 \
		      -height -1 \
		      -colwidth 14 \
		      -maxwidth 300 \
		      -maxheight 300 \
		      -titlerows 1 \
		      -xscrollcommand [list $f.xscroll set]\
		      -yscrollcommand [list $f.yscroll set]\
		      -selecttype row \
		      -selectmode extended \
		      -anchor w \
		      -font [font actual TkDefaultFont] \
		      -browsecommand [list PrismSelectCmd %s %S] \
		      -fg [ThemeForeground] \
		      -bg [ThemeBackground] \
		     ]

    $dprism(tbl) tag configure sel \
	-fg [ThemeSelectforeground] -bg [ThemeSelectbackground]
    $dprism(tbl) tag configure title \
	-fg [ThemeSelectforeground] -bg [ThemeForegroundDisabled]

    ttk::scrollbar $f.yscroll -command [list $dprism(tbl) yview] \
	-orient vertical
    ttk::scrollbar $f.xscroll -command [list $dprism(tbl) xview] \
	-orient horizontal
    grid $dprism(tbl) $f.yscroll -sticky news
    grid $f.xscroll -stick news
    grid rowconfigure $f 0 -weight 1
    grid columnconfigure $f 0 -weight 1

    # Buttons
    set f [ttk::frame $w.buttons]
    ttk::button $f.load -text [msgcat::mc {Load}] -command PrismLoad
    ttk::button $f.clear -text [msgcat::mc {Clear}] -command PrismClear
    ttk::button $f.plot -text [msgcat::mc {Plot}] -command PrismPlot
    ttk::button $f.histogram -text [msgcat::mc {Histogram}] \
	-command PrismHistogram
    ttk::button $f.image -text [msgcat::mc {Image}] -command PrismImage
    ttk::button $f.close -text [msgcat::mc {Close}] -command PrismDestroyDialog
    pack $f.load $f.clear $f.plot $f.histogram $f.image $f.close \
	-side left -expand true -padx 2 -pady 4

    # Fini
    ttk::separator $w.stbl -orient horizontal
    pack $w.buttons $w.stbl -side bottom -fill x
    pack $w.param -side top -fill x
    pack $w.tbl -side top -fill both -expand true

    bind $w <<Close>> PrismDestroyDialog

    UpdatePrismDialog
}

proc PrismDestroyDialog {} {
    global iprism
    global dprism

    if {[winfo exists $iprism(top)]} {
	destroy $iprism(top)
	destroy $iprism(mb)
	unset dprism
    }
}

proc UpdatePrismDialog {} {
    global debug
    if {$debug(tcl,update)} {
	puts stderr "UpdatePrismDialog"
    }

}

proc PrismLoad {} {
    global dprism
    
    $dprism(ext) insert {} end -values {PRIMARY image NULL}
    $dprism(ext) insert {} end -values {STDGTI table "3 cols, 35 rows"}
    $dprism(ext) insert {} end -values {STDEVT table "7 cols, 18758 rows"}

 #   $dprism(ext) selection set I001

    $dprism(header) insert {} end -values \
	{CONTENT BASIC string "data content" ""}
    $dprism(header) insert {} end -values \
	{ORIGIN "MPE Garching, FRG" string "origin of processed data" ""}
    $dprism(header) insert {} end -values \
	{DATE 28/06/95 string "FITS creation date" ""}
}

proc PrismClear {} {
    global dprism
    
    $dprism(ext) delete I001
    $dprism(ext) delete I002
    $dprism(ext) delete I003

    $dprism(header) delete I001
    $dprism(header) delete I002
    $dprism(header) delete I003
}

proc PrismPlot {} {
    global dprism
}

proc PrismHistogram {} {
    global dprism
}

proc PrismImage {} {
    global dprism
}

proc PrismExtCmd {} {
    global dprism

    puts [$dprism(ext) selection]
}

proc PrismHeaderCmd {} {
    global dprism

    puts [$dprism(header) selection]
}

proc PrismSelectCmd {ss rc} {
}

# Process Cmds

proc ProcessPrismCmd {varname iname} {
    upvar $varname var
    upvar $iname i

    prism::YY_FLUSH_BUFFER
    prism::yy_scan_string [lrange $var $i end]
    prism::yyparse
    incr i [expr $prism::yycnt-1]
}

proc ProcessSendPrismCmd {proc id param {sock {}} {fn {}}} {
    global parse
    set parse(proc) $proc
    set parse(id) $id

    prismsend::YY_FLUSH_BUFFER
    prismsend::yy_scan_string $param
    prismsend::yyparse
}


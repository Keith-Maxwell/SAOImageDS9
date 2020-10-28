#  Copyright (C) 1999-2020
#  Smithsonian Astrophysical Observatory, Cambridge, MA, USA
#  For conditions of distribution and use, see copyright notice in "copyright"

package provide DS9 1.0

proc PrismDef {} {
    global prism
    global iprism

    set iprism(prisms) {}
    set iprism(seq) 0

    set iprism(mincols) 10
    set iprism(minrows) 20
    set iprism(block) 10000
}

proc PrismDialog {varname} {
    global prism
    global iprism
    global ds9

    # first determine if aready in use, then increment
    if {[lsearch $iprism(prisms) $varname] >= 0} {
	incr iprism(seq)
	append varname $iprism(seq)
    }

    upvar #0 $varname var
    global $varname

    # main dialog
    set var(top) ".${varname}"
    set var(mb) ".${varname}mb"

    # see if we already have a window visible
    if {[winfo exists $var(top)]} {
	raise $var(top)
	return
    }

    # PRISM vars
    lappend iprism(prisms) $varname

    set var(tbldb) ${varname}tbldb
    set var(fn) {}
    set var(type) fits
    set var(load) mmapincr
    set var(ext) 0
    set var(extname) {}
    set var(extnames) {}
    set var(extnum) 0
    set var(start) 0
    set var(goto) 1

    set var(search) {}

    set var(bar,col) {}
    set var(bar,num) 10
    set var(bar,min) 0
    set var(bar,max) 0
    set var(bar,minmax) 1
    set var(bar,width) 1

    set var(xx) {}
    set var(yy) {}
    set var(xerr) {}
    set var(yerr) {}

    set var(plot,seq) 0
    set var(plot,data,seq) 0
    set var(plot,mode) newplot
    set var(plot,type) scatter

    # create the window
    set w $var(top)
    set mb $var(mb)

    Toplevel $w $mb 6 [msgcat::mc {Prism}] "PrismDestroy $varname"
    $mb add cascade -label [msgcat::mc {File}] -menu $mb.file
    $mb add cascade -label [msgcat::mc {Edit}] -menu $mb.edit
    $mb add cascade -label [msgcat::mc {Table}] -menu $mb.table

    ThemeMenu $mb.file
    $mb.file add command -label [msgcat::mc {Open}] \
	-command [list PrismLoadFile $varname] -accelerator "${ds9(ctrl)}O"
    $mb.file add separator
    $mb.file add cascade -label [msgcat::mc {Import}] -menu $mb.file.import
    $mb.file add separator
    $mb.file add command -label [msgcat::mc {Image}] \
	-command [list PrismImage $varname]
    $mb.file add command -label [msgcat::mc {Clear}] \
	-command [list PrismClear $varname]
    $mb.file add separator
    $mb.file add command -label [msgcat::mc {Close}] \
	-command [list PrismDestroy $varname] -accelerator "${ds9(ctrl)}W"

    # Import
    ThemeMenu $mb.file.import
    $mb.file.import add command -label "[msgcat::mc {VOTable}]..." \
	-command [list PrismImportVOTFile $varname]
    $mb.file.import add command -label "[msgcat::mc {Starbase}]..." \
	-command [list PrismImportRDBFile $varname]
    $mb.file.import add command -label "[msgcat::mc {Tab-Separated-Value}]..." \
	-command [list PrismImportTSVFile $varname]

    ThemeMenu $mb.edit
    $mb.edit add command -label [msgcat::mc {Cut}] \
	-state disabled -accelerator "${ds9(ctrl)}X"
    $mb.edit add command -label [msgcat::mc {Copy}] \
	-command [list PrismCopy $varname] -accelerator "${ds9(ctrl)}C"
    $mb.edit add command -label [msgcat::mc {Paste}] \
	-state disabled -accelerator "${ds9(ctrl)}V"
    $mb.edit add separator
    $mb.edit add command -label [msgcat::mc {Select All}] \
	-command [list SimpleTextSelectAll $varname]
    $mb.edit add command -label [msgcat::mc {Select None}] \
	-command [list SimpleTextSelectNone $varname]
    $mb.edit add separator
    $mb.edit add command -label "[msgcat::mc {Find}]..." \
	-command "SimpleTextFind $varname" -accelerator "${ds9(ctrl)}F"
    $mb.edit add command -label [msgcat::mc {Find Next}] \
	-command "SimpleTextFindNext $varname" -accelerator "${ds9(ctrl)}G"

    ThemeMenu $mb.table
    $mb.table add command -label [msgcat::mc {Plot}] \
	-command [list PrismPlot $varname]
    $mb.table add command -label [msgcat::mc {Histogram}] \
	-command [list PrismHistogram $varname]
    $mb.table add separator
    $mb.table add command -label [msgcat::mc {First}] \
	-command [list PrismTableFirst $varname]
    $mb.table add command -label [msgcat::mc {Next}] \
	-command [list PrismTableNext $varname]
    $mb.table add command -label [msgcat::mc {Previous}] \
	-command [list PrismTablePrev $varname]
    $mb.table add command -label [msgcat::mc {Last}] \
	-command [list PrismTableLast $varname]
    $mb.table add separator
    $mb.table add command -label "[msgcat::mc {Goto}]..." \
	-command [list PrismTableGotoQuery $varname]

    # Param
    set p [ttk::frame $w.param]

    # Exts
    set f [ttk::labelframe $p.ext -padding {0 2} \
	       -text [msgcat::mc {Extensions}]]

    ttk::scrollbar $f.yscroll -command [list $f.box yview] -orient vertical
    ttk::scrollbar $f.xscroll -command [list $f.box xview] -orient horizontal
    set var(dir) [ttk::treeview $f.box \
		      -xscroll [list $f.xscroll set]\
		      -yscroll [list $f.yscroll set] \
		      -selectmode browse \
		      -height 10 \
		      -show headings \
		      -columns {ext type dim} \
		     ]
    $var(dir) column ext -width 100 -anchor w
    $var(dir) column type -width 50 -anchor w
    $var(dir) column dim -width 220 -anchor w

    $var(dir) heading ext -text [msgcat::mc {Extension}] -anchor w
    $var(dir) heading type -text [msgcat::mc {Type}] -anchor w
    $var(dir) heading dim -text [msgcat::mc {Dimensions}] -anchor w

    grid $f.box $f.yscroll -sticky news
    grid $f.xscroll -stick news
    grid rowconfigure $f 0 -weight 1
    grid columnconfigure $f 2 -weight 1

    bind $var(dir) <<TreeviewSelect>> [list PrismExtCmd $varname]

    # Header
    set f [ttk::labelframe $p.header -padding {0 2} \
	       -text [msgcat::mc {Header Keywords}]]

    set var(text) $f.text
    roText::roText $var(text)

    $var(text) configure \
	-wrap none \
	-height 10 \
	-yscrollcommand [list $f.yscroll set] \
	-xscrollcommand [list $f.xscroll set] \
	-fg [ThemeTreeForeground] \
	-bg [ThemeTreeBackground] \
	-state normal
    
    ttk::scrollbar $f.yscroll \
	-command [list roText::$var(text) yview] -orient vertical
    ttk::scrollbar $f.xscroll \
	-command [list roText::$var(text) xview] -orient horizontal
    
    $var(text) tag configure keyword -foreground [ThemeBold]

    grid $var(text) $f.yscroll -sticky news
    grid $f.xscroll -stick news
    grid rowconfigure $f 0 -weight 1
    grid columnconfigure $f 0 -weight 1

    grid $p.ext -row 0 -column 0 -sticky ns
    grid $p.header -row 0 -column 1 -sticky news
    grid columnconfigure $p 1 -weight 1

    bind $var(top) <<Find>> [list SimpleTextFind $varname]
    bind $var(top) <<FindNext>> [list SimpleTextFindNext $varname]

    # Table
    set f [ttk::labelframe $w.tbl -padding {0 2} \
	       -text [msgcat::mc {Extension Data}]]

    set var(tbl) [table $f.t \
		      -state disabled \
		      -usecommand 0 \
		      -variable $var(tbldb) \
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
		      -browsecommand [list PrismTableCmd $varname %s %S] \
		      -fg [ThemeTreeForeground] \
		      -bg [ThemeTreeBackground] \
		     ]

    $var(tbl) tag configure sel \
	-fg [ThemeSelectedForeground] -bg [ThemeSelectedBackground]
    $var(tbl) tag configure title \
	-fg [ThemeHeadingForeground] -bg [ThemeHeadingBackground]

    ttk::scrollbar $f.xscroll -command [list $var(tbl) xview] -orient horizontal
    ttk::scrollbar $f.yscroll -command [list $var(tbl) yview] -orient vertical

    grid $var(tbl) $f.yscroll -sticky news
    grid $f.xscroll -stick news
    grid rowconfigure $f 0 -weight 1
    grid columnconfigure $f 0 -weight 1

    TBLBindMouseWheel $varname

    # Buttons
    set f [ttk::frame $w.buttons]
    ttk::button $f.load -text [msgcat::mc {Open}] \
	-command [list PrismLoadFile $varname]
    ttk::button $f.clear -text [msgcat::mc {Clear}] \
	-command [list PrismClear $varname]
    ttk::button $f.image -text [msgcat::mc {Image}] \
	-command [list PrismImage $varname]
    ttk::button $f.plot -text [msgcat::mc {Plot}] \
	-command [list PrismPlot $varname]
    ttk::button $f.histogram -text [msgcat::mc {Histogram}] \
	-command [list PrismHistogram $varname]
    ttk::button $f.first -text [msgcat::mc {First}] \
	-command [list PrismTableFirst $varname]
    ttk::button $f.next -text [msgcat::mc {Next}] \
	-command [list PrismTableNext $varname]
    ttk::button $f.prev -text [msgcat::mc {Previous}] \
	-command [list PrismTablePrev $varname]
    ttk::button $f.last -text [msgcat::mc {Last}] \
	-command [list PrismTableLast $varname]
    ttk::button $f.close -text [msgcat::mc {Close}] \
	-command [list PrismDestroy $varname]

    pack $f.load $f.clear $f.image $f.plot $f.histogram \
	$f.first $f.next $f.prev $f.last $f.close \
	-side left -expand true -padx 2 -pady 4

    # Fini
    ttk::separator $w.sext -orient horizontal
    pack $w.buttons $w.sext -side bottom -fill x
    pack $w.param -side top -fill x
    pack $w.tbl -side top -fill both -expand true

    bind $w <<Close>> [list PrismDestroy $varname]

    PrismDialogUpdate $varname

    $var(tbl) see 1,1

    return $varname
}

proc PrismDestroy {varname} {
    upvar #0 $varname var
    global $varname
    global iprism

    global $var(tbldb)
    if {[info exists $var(tbldb)]} {
	unset $var(tbldb)
    }

    set ii [lsearch $iprism(prisms) $varname]
    if {$ii>=0} {
	set iprism(prisms) [lreplace $iprism(prisms) $ii $ii]
    }

    if {[winfo exists $var(top)]} {
	destroy $var(top)
	destroy $var(mb)
    }
    unset $varname
}

proc PrismCopy {varname} {
    upvar #0 $varname var
    global $varname

    set w [focus -displayof $var(top)]
    if {$w == $var(dir)} {
    } elseif {$w == $var(text)} {
	tk_textCopy $w
    } elseif {$w == $var(tbl)} {
	TBLCopyTable $varname
    }
}

proc UpdatePrismDialog {} {
    global iprism

    foreach varname $iprism(prisms) {
	PrismDialogUpdate $varname
    }
}

proc PrismDialogUpdate {varname} {
    upvar #0 $varname var
    global $varname

    set bb $var(top).buttons

    $var(mb).file entryconfig [msgcat::mc {Clear}] -state disabled
    $var(mb).file entryconfig [msgcat::mc {Image}] -state disabled

    $var(mb).table entryconfig [msgcat::mc {Plot}] -state disabled
    $var(mb).table entryconfig [msgcat::mc {Histogram}] -state disabled

    $var(mb).table entryconfig [msgcat::mc {First}] -state disabled
    $var(mb).table entryconfig [msgcat::mc {Next}] -state disabled
    $var(mb).table entryconfig [msgcat::mc {Previous}] -state disabled
    $var(mb).table entryconfig [msgcat::mc {Last}] -state disabled
    $var(mb).table entryconfig "[msgcat::mc {Goto}]..." -state disabled

    $bb.clear configure -state disabled
    $bb.image configure -state disabled

    $bb.plot configure -state disabled
    $bb.histogram configure -state disabled

    $bb.first configure -state disabled
    $bb.next configure -state disabled
    $bb.prev configure -state disabled
    $bb.last configure -state disabled

    if {$var(fn) == {}} {
	return
    }

    $var(mb).file entryconfig [msgcat::mc {Clear}] -state normal
    $bb.clear configure -state normal

    switch $var(type) {
	fits  {
	    $var(mb).file entryconfig [msgcat::mc {Image}] -state normal
	    $bb.image configure -state normal

	    if {[fitsy istable $var(fn) $var(load) $var(ext)]} {
		$var(mb).table entryconfig [msgcat::mc {Plot}] -state normal
		$var(mb).table entryconfig [msgcat::mc {Histogram}] \
		    -state normal

		$var(mb).table entryconfig [msgcat::mc {First}] -state normal
		$var(mb).table entryconfig [msgcat::mc {Next}] -state normal
		$var(mb).table entryconfig [msgcat::mc {Previous}] -state normal
		$var(mb).table entryconfig [msgcat::mc {Last}] -state normal
		$var(mb).table entryconfig "[msgcat::mc {Goto}]..." \
		    -state normal

		$bb.plot configure -state normal
		$bb.histogram configure -state normal

		$bb.first configure -state normal
		$bb.next configure -state normal
		$bb.prev configure -state normal
		$bb.last configure -state normal
	    }
	}
	ascii {
	    $var(mb).file entryconfig [msgcat::mc {Image}] -state disabled
	    $bb.image configure -state disabled

	    $var(mb).table entryconfig [msgcat::mc {Plot}] -state normal
	    $var(mb).table entryconfig [msgcat::mc {Histogram}] -state normal
	    $bb.plot configure -state normal
	    $bb.histogram configure -state normal
	}
    }
}

# Load

proc PrismDialogLoad {varname} {
    upvar #0 $varname var
    global $varname

    global current

    if {$current(frame) == {}} {
	PrismDialog $varname
	return
    }
    if {![$current(frame) has fits]} {
	PrismDialog $varname
	return
    }

    set fn [$current(frame) get fits file name full]
    set id [string first "\[" $fn]
    if {$id > 0} {
	set fn [string range $fn 0 [expr $id-1]]
    }

    if {![file exists $fn]} {
	PrismDialog $varname
	return
    }

    set varname [PrismDialog prism]
    PrismLoad $varname $fn
}

proc PrismLoadFile {varname} {
    upvar #0 $varname var
    global $varname
    
    set fn [OpenFileDialog fitsfbox $var(top)]
    if {$fn != {}} {
	PrismLoad $varname $fn
    }
}

proc PrismLoad {varname fn} {
    upvar #0 $varname var
    global $varname
    global ds9
    
    PrismClear $varname

    if {![file exists $fn]} {
	Error "[msgcat::mc {File not found}]: $fn"
	return
    }

    set var(fn) $fn
    set var(type fits
    switch $ds9(wm) {
	x11 -
	aqua {
	    set var(load) mmapincr

	    # compressed?
	    catch {
		set ch [open $fn r]
		fconfigure $ch -encoding binary -translation binary
		set bb [read $ch 2]
		close $ch
		binary scan $bb H4 cc
		if {$cc == {1f8b}} {
		    set var(load) allocgz
		}
	    }
	}
	win32 {
	    set var(load) allocgz
	}
    }

    set rr [fitsy dir $var(fn) $var(load)]
    foreach {ext name type info} $rr {
	$var(dir) insert {} end -id $ext -values [list "$name" "$type" "$info"]
	lappend ${varname}(extnames) $name
	incr ${varname}(extnum)
    }

    # is primary NULL?
    set var(ext) 0
    if {$var(extnum)>1} {
	foreach {ext name type info} $rr {
	    if {$info != "NULL"} {
		break
	    }
	    incr var(ext)
	}
	# sanity check
	if {$var(ext) >= $var(extnum)} {
	    set var(ext) 0
	}
    }
    set var(extname) [lindex $var(extnames) $var(ext)]
    $var(dir) selection set $var(ext)

    # need this so that PrismExtCmd is invoked before next command
    update
    
    PrismDialogUpdate $varname
}

# Import

proc PrismImportVOTFile {varname} {
    upvar #0 $varname var
    global $varname

    set fn [OpenFileDialog votfbox $var(top)]
    if {$fn != {}} {
	PrismImportFn $varname $fn VOTRead
    }
}

proc PrismImportRDBFile {varname} {
    upvar #0 $varname var
    global $varname

    set fn [OpenFileDialog rdbfbox $var(top)]
    if {$fn != {}} {
	PrismImportFn $varname $fn starbase_read
    }
}

proc PrismImportTSVFile {varname} {
    upvar #0 $varname var
    global $varname

    set fn [OpenFileDialog tsvfbox $var(top)]
    if {$fn != {}} {
	PrismImportFn $varname $fn TSVRead
    }
}

proc PrismImportFn {varname fn reader} {
    upvar #0 $varname var
    global $varname
    global $var(tbldb)
    global iprism
    
    PrismClear $varname

    if {![file exists $fn]} {
	Error "[msgcat::mc {File not found}]: $fn"
	return
    }

    set var(fn) $fn
    set var(type) ascii
    $reader $var(tbldb) $fn

    set nc [starbase_ncols $var(tbldb)]
    if {$nc > $iprism(mincols)} {
	$var(tbl) configure -cols $nc
    } else {
	$var(tbl) configure -cols $iprism(mincols)
    }

    set nr [starbase_nrows $var(tbldb)]
    if {$nr > $iprism(minrows)} {
	$var(tbl) configure -rows [expr $nr+1]
    } else {
	$var(tbl) configure -rows $iprism(minrows)
    }
    $var(tbl) see 1,1

    # set default cols
    set var(bar,col) [lindex [starbase_columns $var(tbldb)] 0]
    set var(xx) [lindex [starbase_columns $var(tbldb)] 0]
    set var(yy) [lindex [starbase_columns $var(tbldb)] 1]

    set info \
	"[starbase_ncols $var(tbldb)] cols, [starbase_nrows $var(tbldb)] rows"
    $var(dir) insert {} end -id 0 -values [list [file tail $fn] "Table" "$info"]
    lappend ${varname}(extnames) [file tail $fn]
    incr ${varname}(extnum)

    set var(ext) 0
    set var(extname) [lindex $var(extnames) $var(ext)]
    $var(dir) selection set $var(ext)
    
    # need this so that PrismExtCmd is invoked before next command
    update
    
    PrismDialogUpdate $varname
}

proc PrismClear {varname} {
    upvar #0 $varname var
    global $varname
    global iprism

    # extension
    foreach id [$var(dir) children {}] {
	$var(dir) delete $id
    }

    set var(fn) {}
    set var(type) fits
    set var(load) {}
    set var(ext) 0
    set var(extname) {}
    set var(extnames) {}
    set var(extnum) 0
    set var(start) 0
    set var(goto) 1

    # reset plots
    set var(plot,seq) 0
    set var(plot,data,seq) 0
    set var(plot,mode) newplot
    set var(plot,type) scatter

    # header
    $var(text) delete 1.0 end

    # clear previous db
    global $var(tbldb)
    if {[info exists $var(tbldb)]} {
	unset $var(tbldb)
    }
    $var(tbl) configure -rows $iprism(minrows)
    $var(tbl) see 1,1

    PrismDialogUpdate $varname
}

proc PrismPlot {varname} {
    upvar #0 $varname var
    global $varname

    global ed

    # sanity check
    if {$var(fn) == {}} {
	Error "No FITS file loaded"
	return
    }

    switch $var(type) {
	fits {
	    if {![fitsy istable $var(fn) $var(load) $var(ext)]} {
		Error "Current extension is not a table"
		return
	    }
	}
	ascii {}
    }

    set w ".${varname}plot"
    set mb ".${varname}plotmb"

    set ed(top) $w
    set ed(ok) 0

    set ed(xx) $var(xx)
    set ed(yy) $var(yy)
    set ed(xerr) $var(xerr)
    set ed(yerr) $var(yerr)

    set ed(plot,type) $var(plot,type)
    set ed(plot,mode) $var(plot,mode)

    DialogCreate $w [msgcat::mc {Plot}] ed(ok)

    $w configure -menu $mb
    ThemeMenu $mb

    # file
    $mb add cascade -label [msgcat::mc {File}] -menu $mb.file
    ThemeMenu $mb.file
    $mb.file add command -label [msgcat::mc {Apply}] -command {set ed(ok) 1}
    $mb.file add command -label [msgcat::mc {Cancel}] -command {set ed(ok) 0}

    # edit
    $mb add cascade -label [msgcat::mc {Edit}] -menu $mb.edit
    EditMenu $mb ed

    # param
    set f [ttk::frame $w.param]

    ttk::label $f.ttype -text [msgcat::mc {Plot Type}]
    ttk::menubutton $f.type -textvariable ed(plot,type) -menu $f.type.menu

    set m $f.type.menu
    ThemeMenu $m
    $m configure -tearoff 0
    $m add command -label [msgcat::mc {Line}] \
	-command "set ed(plot,type) line"
    $m add command -label [msgcat::mc {Bar}] \
	-command "set ed(plot,type) bar"
    $m add command -label [msgcat::mc {Scatter}] \
	-command "set ed(plot,type) scatter"

    ttk::label $f.txx -text [msgcat::mc {X Column}]
    ttk::menubutton $f.xx -textvariable ed(xx) -menu $f.xx.menu

    ttk::label $f.tyy -text [msgcat::mc {Y Column}]
    ttk::menubutton $f.yy -textvariable ed(yy) -menu $f.yy.menu

    ttk::label $f.txerr -text [msgcat::mc {X Error Column}]
    ttk::menubutton $f.xerr -textvariable ed(xerr) -menu $f.xerr.menu

    ttk::label $f.tyerr -text [msgcat::mc {Y Error Column}]
    ttk::menubutton $f.yerr -textvariable ed(yerr) -menu $f.yerr.menu

    PrismColsMenu $varname $f.xx xx {}
    PrismColsMenu $varname $f.yy yy {}
    PrismColsMenu $varname $f.xerr xerr {}
    PrismColsMenu $varname $f.yerr yerr {}

    ttk::radiobutton $f.newplot -text [msgcat::mc {New Plot}] \
	-variable ed(plot,mode) -value newplot
    ttk::radiobutton $f.newgraph -text [msgcat::mc {New Graph}] \
	-variable ed(plot,mode) -value newgraph
    ttk::radiobutton $f.newdataset -text [msgcat::mc {Overplot}] \
	-variable ed(plot,mode) -value newdataset

    grid $f.ttype $f.type -padx 2 -pady 2 -sticky ew
    grid $f.txx $f.xx $f.txerr $f.xerr -padx 2 -pady 2 -sticky ew
    grid $f.tyy $f.yy $f.tyerr $f.yerr -padx 2 -pady 2 -sticky ew
    grid x $f.newplot $f.newgraph $f.newdataset -padx 2 -pady 2 -sticky ew

    # Buttons
    set f [ttk::frame $w.buttons]
    ttk::button $f.ok -text [msgcat::mc {OK}] -command {set ed(ok) 1} \
        -default active
    ttk::button $f.cancel -text [msgcat::mc {Cancel}] -command {set ed(ok) 0}
    pack $f.ok $f.cancel -side left -expand true -padx 2 -pady 4

    bind $w <Return> {set ed(ok) 1}

    # Fini
    ttk::separator $w.sep -orient horizontal
    pack $w.param -side top -fill both -expand true
    pack $w.buttons $w.sep -side bottom -fill x

    DialogWait $w ed(ok) $w.buttons.ok
    destroy $w
    destroy $mb

    if {$ed(ok)} {
	set var(xx) $ed(xx)
	set var(yy) $ed(yy)
	set var(xerr) $ed(xerr)
	set var(yerr) $ed(yerr)

	set var(plot,type) $ed(plot,type)
	set var(plot,mode) $ed(plot,mode)

	if {$ed(xx) != {} && $ed(yy) != {}} {
	    PrismPlotGenerate $varname
	} else {
	    Error "[msgcat::mc {Unable to generate plot}]"
	}
    }
}

proc PrismPlotGenerate {varname} {
    upvar #0 $varname var
    global $varname

    if {$var(xerr) == {} && $var(yerr) == {}} {
	set dim xy
    } elseif {$var(xerr) != {} && $var(yerr) == {}} {
	set dim xyex
    } elseif {$var(xerr) == {} && $var(yerr) != {}} {
	set dim xyey
    } else {
	set dim xyexey
    }

    global iap
    switch $var(plot,mode) {
	newplot {
	    incr ${varname}(plot,seq)
	    set vvarname plot$var(plot,seq)${varname}
	}
	newgraph -
	newdataset {
	    set vvarname [lindex $iap(plots) end]
	    if {$vvarname == {}} {
		incr ${varname}(plot,seq)
		set vvarname plot$var(plot,seq)${varname}
	    }
	}
    }
    upvar #0 $vvarname vvar
    global $vvarname

    set xdata ${vvarname}xx$var(plot,data,seq)
    set ydata ${vvarname}yy$var(plot,data,seq)
    set xedata ${vvarname}xe$var(plot,data,seq)
    set yedata ${vvarname}ye$var(plot,data,seq)
    incr ${varname}(plot,data,seq)

    global $xdata $ydata
    if {[info command $xdata] == {}} {
	blt::vector create $xdata
    }
    if {[info command $ydata] == {}} {
	blt::vector create $ydata
    }

    set txx {}
    set tyy {}
    if {[catch {
    switch $var(type) {
	fits {PrismPlotGenerateFits $varname $vvarname $dim $xdata $ydata $xedata $yedata txx tyy}
	ascii {PrismPlotGenerateAscii $varname $vvarname $dim $xdata $ydata $xedata $yedata txx tyy}
    }
    }]} {
	Error "[msgcat::mc {Unable to generate plot}]"
	return
    }

    upvar #0 $vvarname vvar
    global $vvarname

    switch $var(plot,mode) {
	newplot {
	    PlotDialog $vvarname "[string totitle $varname] Plot"
	    PlotAddGraph $vvarname $var(plot,type)
	    PlotTitle $vvarname $var(extname) $txx $tyy
	}
	newgraph {
	    if {![PlotPing $vvarname]} {
		PlotDialog $vvarname "[string totitle $varname] Plot"
	    }
	    PlotAddGraph $vvarname $var(plot,type)
	    PlotTitle $vvarname $var(extname) $txx $tyy
	}
	newdataset {
	    if {![PlotPing $vvarname]} {
		PlotDialog $vvarname "[string totitle $varname] Plot"
		PlotAddGraph $vvarname $var(plot,type)
		PlotTitle $vvarname $var(extname) $txx $tyy
	    }
	}
    }

    set vvar(graph,ds,xdata) $xdata
    set vvar(graph,ds,ydata) $ydata
    switch $dim {
	xy {}
	xyex {set vvar(graph,ds,xedata) $xedata}
	xyey {set vvar(graph,ds,yedata) $yedata}
	xyexey {
	    set vvar(graph,ds,xedata) $xedata
	    set vvar(graph,ds,yedata) $yedata
	}
    }

    PlotExternal $vvarname $dim
    PlotDataSetName $vvarname "$var(extname) $var(xx) $var(yy)"

    set vvar(canvas,theme) 1
    PlotUpdateAllElement $vvarname

    PlotStats $vvarname
    PlotList $vvarname
}

proc PrismPlotGenerateFits {varname vvarname dim xdata ydata xedata yedata txxname tyyname} {
    upvar #0 $varname var
    global $varname

    global $xdata $ydata $xedata $yedata

    upvar $txxname txx
    upvar $tyyname tyy

    if {[catch {
    switch $dim {
	xy {
	    fitsy plot $var(fn) $var(load) $var(ext) xy \
		$var(xx) $xdata \
		$var(yy) $ydata
	}
	xyex {
	    if {[info command $xedata] == {}} {
		blt::vector create $xedata
	    }
	    fitsy plot $var(fn) $var(load) $var(ext) xyex \
		$var(xx) $xdata \
		$var(yy) $ydata \
		$var(xerr) $xedata
	}
	xyey {
	    if {[info command $yedata] == {}} {
		blt::vector create $yedata
	    }
	    fitsy plot $var(fn) $var(load) $var(ext) xyey \
		$var(xx) $xdata \
		$var(yy) $ydata \
		$var(yerr) $yedata
	}
	xyexey {
	    if {[info command $xedata] == {}} {
		blt::vector create $xedata
	    }
	    if {[info command $yedata] == {}} {
		blt::vector create $yedata
	    }
	    fitsy plot $var(fn) $var(load) $var(ext) xyexey \
		$var(xx) $xdata \
		$var(yy) $ydata \
		$var(xerr) $xedata \
		$var(yerr) $yedata
	}
    }
    }]} {
	return -code error
    }

    set txx [string toupper $var(xx)]
    set xnum [fitsy colnum $var(fn) $var(load) $var(ext) $var(xx)]
    if {$xnum != {}} {
	set unit [string trim [fitsy keyword $var(fn) $var(load) $var(ext) "TUNIT$xnum"]]
	if {$unit != {}} {
	    append txx " ($unit)"
	}
    }
    set tyy [string toupper $var(yy)]
    set ynum [fitsy colnum $var(fn) $var(load) $var(ext) $var(yy)]
    if {$ynum != {}} {
	set unit [string trim [fitsy keyword $var(fn) $var(load) $var(ext) "TUNIT$ynum"]]
	if {$unit != {}} {
	    append tyy " ($unit)"
	}
    }
}

proc PrismPlotGenerateAscii {varname vvarname dim xdata ydata xedata yedata txxname tyyname} {
    upvar #0 $varname var
    global $varname

    global $xdata $ydata $xedata $yedata
    global $var(tbldb)

    set rows [starbase_nrows $var(tbldb)]
    set colx [starbase_colnum $var(tbldb) $var(xx)]
    set coly [starbase_colnum $var(tbldb) $var(yy)]

    if {[catch {
    switch $dim {
	xy {
	    for {set ii 1} {$ii<=$rows} {incr ii} {
		$xdata append [starbase_get $var(tbldb) $ii $colx]
		$ydata append [starbase_get $var(tbldb) $ii $coly]
	    }
	}
	xyex {
	    if {[info command $xedata] == {}} {
		blt::vector create $xedata
	    }
	    set colxe [starbase_colnum $var(tbldb) $var(xerr)]
	    for {set ii 1} {$ii<=$rows} {incr ii} {
		$xdata append [starbase_get $var(tbldb) $ii $colx]
		$ydata append [starbase_get $var(tbldb) $ii $coly]
		$xedata append [starbase_get $var(tbldb) $ii $colxe]
	    }
	}
	xyey {
	    if {[info command $yedata] == {}} {
		blt::vector create $yedata
	    }
	    set colye [starbase_colnum $var(tbldb) $var(yerr)]
	    for {set ii 1} {$ii<=$rows} {incr ii} {
		$xdata append [starbase_get $var(tbldb) $ii $colx]
		$ydata append [starbase_get $var(tbldb) $ii $coly]
		$yedata append [starbase_get $var(tbldb) $ii $colye]
	    }
	}
	xyexey {
	    if {[info command $xedata] == {}} {
		blt::vector create $xedata
	    }
	    if {[info command $yedata] == {}} {
		blt::vector create $yedata
	    }
	    set colxe [starbase_colnum $var(tbldb) $var(xerr)]
	    set colye [starbase_colnum $var(tbldb) $var(yerr)]
	    for {set ii 1} {$ii<=$rows} {incr ii} {
		$xdata append [starbase_get $var(tbldb) $ii $colx]
		$ydata append [starbase_get $var(tbldb) $ii $coly]
		$xedata append [starbase_get $var(tbldb) $ii $colxe]
		$yedata append [starbase_get $var(tbldb) $ii $colye]
	    }
	}
    }
    }]} {
	return -code error
    }

    upvar $txxname txx
    upvar $tyyname tyy

    set txx [string toupper $var(xx)]
    set tyy [string toupper $var(yy)]
}

proc PrismHistogram {varname} {
    upvar #0 $varname var
    global $varname

    # sanity check
    if {$var(fn) == {}} {
	Error "No FITS file loaded"
	return
    }

    switch $var(type) {
	fits {
	    if {![fitsy istable $var(fn) $var(load) $var(ext)]} {
		Error "Current extension is not a table"
		return
	    }
	}
	ascii {}
    }

    global ed

    set w ".${varname}hist"
    set mb ".${varname}histmb"

    set ed(top) $w
    set ed(ok) 0

    set ed(col) $var(bar,col)
    set ed(num) $var(bar,num)
    set ed(min) $var(bar,min)
    set ed(max) $var(bar,max)

    set ed(plot,mode) $var(plot,mode)

    DialogCreate $w [msgcat::mc {Histogram}] ed(ok)

    $w configure -menu $mb
    ThemeMenu $mb

    # file
    $mb add cascade -label [msgcat::mc {File}] -menu $mb.file
    ThemeMenu $mb.file
    $mb.file add command -label [msgcat::mc {Apply}] -command {set ed(ok) 1}
    $mb.file add command -label [msgcat::mc {Cancel}] -command {set ed(ok) 0}

    # edit
    $mb add cascade -label [msgcat::mc {Edit}] -menu $mb.edit
    EditMenu $mb ed

    # param
    set f [ttk::frame $w.param]

    ttk::label $f.tcol -text [msgcat::mc {Column}]
    ttk::menubutton $f.col -textvariable ed(col) -menu $f.col.menu

    PrismColsMenu $varname $f.col col [list PrismHistogramMinMax $varname]

    ttk::label $f.tnum -text [msgcat::mc {Bins}]
    ttk::entry $f.num -textvariable ed(num) -width 7

    ttk::label $f.tmin -text [msgcat::mc {Min}]
    ttk::entry $f.min -textvariable ed(min) -width 13

    ttk::label $f.tmax -text [msgcat::mc {Max}]
    ttk::entry $f.max -textvariable ed(max) -width 13

    ttk::radiobutton $f.newplot -text [msgcat::mc {New Plot}] \
	-variable ed(plot,mode) -value newplot
    ttk::radiobutton $f.newgraph -text [msgcat::mc {New Graph}] \
	-variable ed(plot,mode) -value newgraph
    ttk::radiobutton $f.newdataset -text [msgcat::mc {Overplot}] \
	-variable ed(plot,mode) -value newdataset

    grid $f.tcol $f.col -padx 2 -pady 2 -sticky ew
    grid $f.tnum $f.num -padx 2 -pady 2 -sticky ew
    grid $f.tmin $f.min -padx 2 -pady 2 -sticky ew
    grid $f.tmax $f.max -padx 2 -pady 2 -sticky ew
    grid x $f.newplot $f.newgraph $f.newdataset -padx 2 -pady 2 -sticky ew

    # Buttons
    set f [ttk::frame $w.buttons]
    ttk::button $f.ok -text [msgcat::mc {OK}] -command {set ed(ok) 1} \
        -default active
    ttk::button $f.cancel -text [msgcat::mc {Cancel}] -command {set ed(ok) 0}
    pack $f.ok $f.cancel -side left -expand true -padx 2 -pady 4

    bind $w <Return> {set ed(ok) 1}

    # Fini
    ttk::separator $w.sep -orient horizontal
    pack $w.param -side top -fill both -expand true
    pack $w.buttons $w.sep -side bottom -fill x

    PrismHistogramMinMax $varname
    
    DialogWait $w ed(ok) $w.buttons.ok
    destroy $w
    destroy $mb

    if {$ed(ok)} {
	set var(bar,col) $ed(col)
	set var(bar,num) $ed(num)
	set var(bar,min) $ed(min)
	set var(bar,max) $ed(max)
	set var(bar,minmax) 1

	set var(plot,mode) $ed(plot,mode)

	if {$ed(col) != {}} {
	    PrismHistogramGenerate $varname
	} else {
	    Error "[msgcat::mc {Unable to generate plot}]"
	}
    }
}

proc PrismHistogramMinMax {varname} {
    upvar #0 $varname var
    global $varname

    global ed

    switch $var(type) {
	fits {
	    if {[catch {fitsy minmax $var(fn) $var(load) $var(ext) $ed(col) ed} ]} {
		set ed(min) 0
		set ed(max) 0
	    }
	}
	ascii {PrismHistogramMinMaxAscii $varname $ed(col) ed(min) ed(max)}
    }
}

proc PrismHistogramMinMaxAscii {varname col minname maxname} {
    upvar #0 $varname var
    global $varname

    upvar $minname min
    upvar $maxname max
    
    global $var(tbldb)

    if {$col=={}} {
	set min 0
	set max 0
	return
    }

    set rows [starbase_nrows $var(tbldb)]
    set colnum [starbase_colnum $var(tbldb) $col]
    set ll {}

    for {set ii 1} {$ii<=$rows} {incr ii} {
	lappend ll "[starbase_get $var(tbldb) $ii $colnum]"
    }
    set ll [join $ll ","]

    set min [expr min($ll)]
    set max [expr max($ll)]
}

proc PrismHistogramGenerate {varname} {
    upvar #0 $varname var
    global $varname

    global iap
    switch $var(plot,mode) {
	newplot {
	    incr ${varname}(plot,seq)
	    set vvarname plot$var(plot,seq)${varname}
	}
	newgraph -
	newdataset {
	    set vvarname [lindex $iap(plots) end]
	    if {$vvarname == {}} {
		incr ${varname}(plot,seq)
		set vvarname plot$var(plot,seq)${varname}
	    }
	}
    }

    upvar #0 $vvarname vvar
    global $vvarname

    set xdata ${vvarname}xx$var(plot,data,seq)
    set ydata ${vvarname}yy$var(plot,data,seq)
    incr ${varname}(plot,data,seq)

    global $xdata $ydata
    if {[info command $xdata] == {}} {
	blt::vector create $xdata
    }
    if {[info command $ydata] == {}} {
	blt::vector create $ydata
    }

    if {[catch {
    switch $var(type) {
	fits {PrismHistogramGenerateFits $varname $xdata $ydata} 
	ascii {PrismHistogramGenerateAscii $varname $xdata $ydata}
    }
    }]} {
	Error "[msgcat::mc {Unable to generate plot}]"
	return
    }

    switch $var(plot,mode) {
	newplot {
	    PlotDialog $vvarname "[string totitle $varname] Histogram"
	    PlotAddGraph $vvarname bar
	    PlotTitle $vvarname $var(bar,col) {Values} {Counts}
	}
	newgraph {
	    if {![PlotPing $vvarname]} {
		PlotDialog $vvarname "[string totitle $varname] Histogram"
	    }
	    PlotAddGraph $vvarname bar
	    PlotTitle $vvarname $var(bar,col) {Values} {Counts}
	}
	newdataset {
	    if {![PlotPing $vvarname]} {
		PlotDialog $vvarname "[string totitle $varname] Histogram"
		PlotAddGraph $vvarname bar
		PlotTitle $vvarname $var(bar,col) {Values} {Counts}
	    }
	}
    }

    set vvar(graph,ds,xdata) $xdata
    set vvar(graph,ds,ydata) $ydata
    set vvar(graph,ds,bar,width) $var(bar,width)
    PlotExternal $vvarname xy
    PlotDataSetName $vvarname "$var(extname) $var(bar,col)"

    set vvar(canvas,theme) 1
    PlotUpdateAllElement $vvarname

    PlotStats $vvarname
    PlotList $vvarname
}

proc PrismHistogramGenerateFits {varname xdata ydata} {
    upvar #0 $varname var
    global $varname
    global $xdata $ydata

    if {[catch {fitsy histogram $var(fn) $var(load) $var(ext) $var(bar,col) $xdata $ydata $var(bar,num) $var(bar,min) $var(bar,max) $var(bar,minmax) $varname} ]} {
	return -code error
    }
}

proc PrismHistogramGenerateAscii {varname xdata ydata} {
    upvar #0 $varname var
    global $varname

    global $var(tbldb)
    global $xdata $ydata

    if {$var(bar,minmax)} {
	set min $var(bar,min)
	set max $var(bar,max)
    } else {
	set min 0
	set max 0
	PrismHistogramMinMaxAscii $varname $var(bar,col) min max
    }

    set num $var(bar,num)
    set rows [starbase_nrows $var(tbldb)]
    set colnum [starbase_colnum $var(tbldb) $var(bar,col)]

    set diff [expr double($max-$min)]
    set barwidth [expr $diff/double($num)]

    for {set ii 0} {$ii<$num} {incr ii} {
	$xdata append [expr double($ii)*$barwidth + $barwidth/2. + $min]
	$ydata append 0
    }

    for {set ii 1} {$ii<=$rows} {incr ii} {
	set vv [starbase_get $var(tbldb) $ii $colnum]
	set jj [expr ($vv-$min)/$barwidth]

	set kk [expr int($jj)]
	if {$kk>=0 && $kk<$num} {
	    set ww [$ydata index $kk]
	    $ydata index $kk [expr $ww+1]
	}
    }
}

proc PrismImage {varname} {
    upvar #0 $varname var
    global $varname

    # sanity check
    if {$var(fn) == {}} {
	Error "No FITS file loaded"
	return
    }

    # sanity check
    if {$var(type) != {fits}} {
	Error "No FITS table file loaded"
	return
    }

    CreateFrame
    LoadFitsFile "$var(fn)\[$var(ext)\]" {} {}
    FinishLoad
}

# used by backup	
proc PrismSetExt {varname ext} {
    upvar #0 $varname var
    global $varname

    $var(dir) selection set $ext
    # let dialog catchup
    update
}

proc PrismColsMenu {varname f ww cmd} {
    upvar #0 $varname var
    global $varname
    global $var(tbldb)
    global ed
    global ds9

    set m $f.menu

    ThemeMenu $m
    $m configure -tearoff 0
    if {[TBLValidDB $var(tbldb)]} {
	set cnt -1
	$m add command -label {} \
	    -command [list PrismColsMenuCmd $ww {} $cmd]
	incr cnt
	foreach col [starbase_columns $var(tbldb)] {
	    $m add command -label $col \
		-command [list PrismColsMenuCmd $ww $col $cmd]

	    # wrap if needed
	    incr cnt
	    if {$cnt>=$ds9(menu,size,wrap)} {
		set cnt 0
		$m entryconfig $col -columnbreak 1
	    }
	}
    }
}

proc PrismColsMenuCmd {ww col cmd} {
    global ed

    set ed($ww) "$col"
    if {$cmd != {}} {
	eval $cmd
    }
}

proc PrismExtCmd {varname} {
    upvar #0 $varname var
    global $varname

    switch $var(type) {
	fits {PrismExtFitsCmd $varname}
	ascii {}
    }
}

proc PrismExtFitsCmd {varname} {
    upvar #0 $varname var
    global $varname
    global iprism

    # this proc can be called in any time
    # prepare for the worst
    if {$var(fn) == {}} {
	return
    }

    set var(ext) [$var(dir) selection]
    if {$var(ext) == {}} {
	set var(ext) 0
    }
    
    set var(extname) [lindex $var(extnames) $var(ext)]

    # clear
    set var(start) 0
    set var(goto) 1

    set var(bar,col) {}
    set var(bar,num) 10
    set var(bar,width) 1

    set var(xx) {}
    set var(yy) {}
    set var(xerr) {}
    set var(yerr) {}

    # header
    $var(text) delete 1.0 end
    $var(text) insert end [fitsy header $var(fn) $var(load) $var(ext)]

    # color tag keywords
    set stop [$var(text) index end]
    for {set ii 1.0} {$ii<$stop} {set ii [expr $ii+1]} {
	$var(text) tag add keyword $ii "$ii +8 chars"
    }
    # see top
    $var(text) see 1.0

    # table
    if {[fitsy istable $var(fn) $var(load) $var(ext)]} {
	set var(rows) [fitsy rows $var(fn) $var(load) $var(ext)]
    } else {
	set var(rows) 0
    }

    PrismTable $varname
}

proc PrismTableCmd {varname ss rc} {
    upvar #0 $varname var
    global $varname
}

proc PrismTableFirst {varname} {
    upvar #0 $varname var
    global $varname

    set var(start) 0
    PrismTable $varname
}

proc PrismTableNext {varname} {
    upvar #0 $varname var
    global $varname
    global iprism

    # sanity check
    if {$var(fn) == {}} {
	Error "No FITS file loaded"
	return
    }

    # sanity check
    if {$var(type) != {fits}} {
	Error "No FITS table file loaded"
	return
    }
    
    if {![fitsy istable $var(fn) $var(load) $var(ext)]} {
	Error "Current extension is not a table"
	return
    }
    
    set var(start) [expr $var(start)+$iprism(block)]
    if {$var(start) > $var(rows)} {
	PrismTableLast $varname
    } else {
	PrismTable $varname
    }
}

proc PrismTablePrev {varname} {
    upvar #0 $varname var
    global $varname
    global iprism

    # sanity check
    if {$var(fn) == {}} {
	Error "No FITS file loaded"
	return
    }

    # sanity check
    if {$var(type) != {fits}} {
	Error "No FITS table file loaded"
	return
    }

    if {![fitsy istable $var(fn) $var(load) $var(ext)]} {
	Error "Current extension is not a table"
	return
    }
    
    set var(start) [expr $var(start)-$iprism(block)]
    if {$var(start) < 0} {
	PrismTableFirst $varname
    } else {
	PrismTable $varname
    }
}

proc PrismTableLast {varname} {
    upvar #0 $varname var
    global $varname
    global iprism

    # sanity check
    if {$var(fn) == {}} {
	Error "No FITS file loaded"
	return
    }

    # sanity check
    if {$var(type) != {fits}} {
	Error "No FITS table file loaded"
	return
    }

    if {![fitsy istable $var(fn) $var(load) $var(ext)]} {
	Error "Current extension is not a table"
	return
    }
    
    set aa [expr int($var(rows)/$iprism(block))]
    set var(start) [expr $aa*$iprism(block)]
    PrismTable $varname
}

proc PrismTableGotoQuery {varname} {
    upvar #0 $varname var
    global $varname

    # sanity check
    if {$var(fn) == {}} {
	Error "No FITS file loaded"
	return
    }

    # sanity check
    if {$var(type) != {fits}} {
	Error "No FITS table file loaded"
	return
    }

    if {![fitsy istable $var(fn) $var(load) $var(ext)]} {
	Error "Current extension is not a table"
	return
    }
    
    if {[PrismTableGotoDialog $varname]} {
	PrismTableGoto $varname
    }
}

proc PrismTableGoto {varname} {
    upvar #0 $varname var
    global $varname
    global iprism

    # sanity check
    if {$var(fn) == {}} {
	Error "No FITS file loaded"
	return
    }

    # sanity check
    if {$var(type) != {fits}} {
	Error "No FITS table file loaded"
	return
    }

    if {![fitsy istable $var(fn) $var(load) $var(ext)]} {
	Error "Current extension is not a table"
	return
    }
    
    # santity check
    if {$var(goto) < 1} {
	set var(goto) 1
    }
    if {$var(goto)>$var(rows)} {
	set var(goto) $var(rows)
    }

    set aa [expr int($var(goto)/$iprism(block))]
    set rr [expr int(fmod($var(goto),$iprism(block)))]
    set var(start) [expr $aa*$iprism(block)]

    if {$var(start) > $var(rows)} {
	PrismTableLast $varname
    } else {
	PrismTable $varname
    }

    $var(tbl) see $rr,1
    $var(tbl) selection set $rr,1
}

proc PrismTableGotoDialog {varname} {
    upvar #0 $varname var
    global $varname

    global ed

    set w ".${varname}goto"
    set mb ".${varname}gotomb"

    # needed for edit menu
    set ed(top) $w
    set ed(ok) 0

    set ed(goto) $var(goto)

    DialogCreate $w [msgcat::mc {Prism Goto}] ed(ok)

    $w configure -menu $mb
    ThemeMenu $mb

    # file
    $mb add cascade -label [msgcat::mc {File}] -menu $mb.file
    ThemeMenu $mb.file
    $mb.file add command -label [msgcat::mc {Apply}] -command {set ed(ok) 1}

    $mb.file add separator
    $mb.file add command -label [msgcat::mc {Cancel}] -command {set ed(ok) 0}

    # edit
    $mb add cascade -label [msgcat::mc {Edit}] -menu $mb.edit
    EditMenu $mb ed

    # Param
    set f [ttk::frame $w.param]
    ttk::label $f.tgoto -text [msgcat::mc {Goto}]
    ttk::entry $f.goto -textvariable ed(goto) -width 12

    grid $f.tgoto $f.goto -padx 2 -pady 2 -sticky w

    # Buttons
    set f [ttk::frame $w.buttons]
    ttk::button $f.ok -text [msgcat::mc {OK}] -command {set ed(ok) 1} \
	-default active 
    ttk::button $f.cancel -text [msgcat::mc {Cancel}] -command {set ed(ok) 0}
    pack $f.ok $f.cancel -side left -expand true -padx 2 -pady 4

    bind $w <Return> {set ed(ok) 1}

    # Fini
    ttk::separator $w.sep -orient horizontal
    pack $w.buttons $w.sep -side bottom -fill x
    pack $w.param -side top -fill both -expand true

    DialogWait $w ed(ok) $w.param.goto
    destroy $w
    destroy $mb

    if {$ed(ok)} {
	set var(goto) $ed(goto)
    }
    
    set rr $ed(ok)
    unset ed
    return $rr
}

proc PrismTable {varname} {
    upvar #0 $varname var
    global $varname
    global iprism

    # clear previous db
    global $var(tbldb)
    if {[info exists $var(tbldb)]} {
	unset $var(tbldb)
    }

    if {![fitsy istable $var(fn) $var(load) $var(ext)]} {
	$var(tbl) configure -rows $iprism(minrows)
	$var(tbl) see 1,1

	PrismDialogUpdate $varname
	return
    }

    # init db
    fitsy table $var(fn) $var(load) $var(ext) $var(tbldb) $var(start) $iprism(block)
    set t $var(tbldb)
    starbase_colmap $t

    set nc [starbase_ncols $t]
    if {$nc > $iprism(mincols)} {
	$var(tbl) configure -cols $nc
    } else {
	$var(tbl) configure -cols $iprism(mincols)
    }

    set nr [starbase_nrows $t]
    if {$nr > $iprism(minrows)} {
	$var(tbl) configure -rows [expr $nr+1]
    } else {
	$var(tbl) configure -rows $iprism(minrows)
    }
    $var(tbl) see 1,1

    # set default cols
    set var(bar,col) [lindex [starbase_columns $var(tbldb)] 1]
    set var(xx) [lindex [starbase_columns $var(tbldb)] 1]
    set var(yy) [lindex [starbase_columns $var(tbldb)] 2]

    PrismDialogUpdate $varname
}

# Process Cmds

proc ProcessPrismCmd {varname iname} {
    upvar $varname var
    upvar $iname i
    global iprism

    set ref [lindex $iprism(prisms) end]
    global cvarname
    set cvarname $ref

    prism::YY_FLUSH_BUFFER
    prism::yy_scan_string [lrange $var $i end]
    prism::yyparse
    incr i [expr $prism::yycnt-1]
}

proc ProcessSendPrismCmd {proc id param {sock {}} {fn {}}} {
    global iprism
    $proc $id "$iprism(prisms)\n"
}

proc PrismCmdRef {ref} {
    global iprism
    global cvarname

    set id [lsearch $iprism(prisms) $ref]

    # look for reference in current list
    if { $id < 0} {
	Error "[msgcat::mc {Unable to find PRISM window}] $ref"
	return
    }

    set iprism(prisms) [lreplace $iprism(prisms) $id $id]
    lappend iprism(prisms) $ref
}

proc PrismCmdImport {fn reader} {
    if {![file exists $fn]} {
	Error "[msgcat::mc {File not found}]: $fn"
	return
    }

    set varname [PrismDialog prism]
    upvar #0 $varname var
    global $varname

    PrismImportFn $varname $fn $reader
}

proc PrismCmdLoad {fn} {
    if {![file exists $fn]} {
	Error "[msgcat::mc {File not found}]: $fn"
	return
    }

    set varname [PrismDialog prism]
    upvar #0 $varname var
    global $varname

    PrismLoad $varname $fn
}

proc PrismCmdExt {ext} {
    global iprism
    global cvarname
    upvar #0 $cvarname cvar
    
    if {$ext >= 0 && $ext <= $cvar(extnum)} {
	$cvar(dir) selection set $ext
	# let dialog catchup
	update
    } else {
	Error "[msgcat::mc {Extension not found}]: $ext"
    }
}

proc PrismCmdExtName {extname} {
    global iprism
    global cvarname
    upvar #0 $cvarname cvar
    
    set ext [lsearch $cvar(extnames) $extname]
    if {$ext >= 0} {
	$cvar(dir) selection set $ext
	# let dialog catchup
	update
    } else {
	Error "[msgcat::mc {Extension not found}]: $extname"
    }
}

# Backup

proc PrismBackup {ch dir} {
    global iprism
    global pds9

    foreach ww $iprism(prisms) {
	set varname $ww
	upvar #0 $varname var
	global $varname

	set fdir [file join $dir $ww]
	set rdir "./[lindex [file split $dir] end]/$ww"
	
	# create dir if needed
	if {![file isdirectory $fdir]} {
	    if {[catch {file mkdir $fdir}]} {
		Error [msgcat::mc {An error has occurred during backup}]
		return
	    }
	}

	puts $ch "PrismDialog $varname"
	if {$var(fn) != {}} {
	    set fn $var(fn)

	    # check for extension
	    set id [string first "\[" $var(fn)]
	    if {$id > 0} {
		set fn [string range $var(fn) 0 [expr $id-1]]
		set ext [string range $var(fn) $id end]
	    } else {
		set fn $var(fn)
		set ext {}
	    }

	    if {![file exists $fn]} {
		return 0
	    }

	    if {$pds9(backup)} {
		# look for sym links
		switch [file type $fn] {
		    file {}
		    link {set fn [file join [file dirname $fn] [file readlink $fn]]}
		    default {
			return 0
		    }
		}

		set src [lindex [file split $fn] end]
		if {![file exists [file join $fdir $src]]} {
		    if {[catch {file copy $var(fn) $fdir}]} {
			return 0
		    }
		}
		puts $ch "PrismLoad $varname $rdir/[file tail $fn]"
	    } else {
		if {[file pathtype $fn] == {relative}} {
		    puts $ch "PrismLoad $varname [file join [pwd] $fn]"
		} else {
		    puts $ch "PrismLoad $varname $fn"
		}
	    }
	}

	if {$var(ext) > 0} {
	    puts $ch "PrismSetExt $varname $var(ext)"
	}
    }
}


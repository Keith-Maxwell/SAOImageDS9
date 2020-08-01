#  Copyright (C) 1999-2018
#  Smithsonian Astrophysical Observatory, Cambridge, MA, USA
#  For conditions of distribution and use, see copyright notice in "copyright"

package provide DS9 1.0

# used by backup
proc PlotScatterTool {} {
    global iap

    PlotScatter $iap(tt) [msgcat::mc {Scatter Plot Tool}] {} {} {} 2 {}
}

proc PlotScatter {tt wtt title xaxis yaxis dim data} {
    global iap

    # make the window name unique
    set ii [lsearch $iap(plots) $tt]
    if {$ii>=0} {
	incr iap(unique)
	append tt $iap(unique)
    }

    # set the window title if none
    if {$wtt == {}} {
	set wtt $tt
    }

    set varname $tt
    upvar #0 $varname var
    global $varname

    PlotDialog $varname $wtt
    PlotAddGraph $varname scatter
    PlotTitle $varname $title $xaxis $yaxis
    PlotAddDataSet $varname $dim $data
    PlotStats $varname
    PlotList $varname
}

proc PlotScatterMenus {varname} {
    upvar #0 $varname var
    global $varname

    # Data
    ThemeMenu $var(mb).ds
    $var(mb).ds add checkbutton -label [msgcat::mc {Show}] \
	-variable ${varname}(graph,ds,show) \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds add separator
    $var(mb).ds add cascade -label [msgcat::mc {Shape}] \
	-menu $var(mb).ds.shape
    $var(mb).ds add cascade -label [msgcat::mc {Error}] \
	-menu $var(mb).ds.error
    $var(mb).ds add separator
    $var(mb).ds add command -label "[msgcat::mc {Name}]..." \
	-command [list DatasetNameDialog $varname]

    # Shape
    ThemeMenu $var(mb).ds.shape
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Circle}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value circle \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Square}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value square \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Diamond}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value diamond \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Plus}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value plus \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Cross}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value cross \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Simple Plus}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value splus \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Simple Cross}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value scross \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Triangle}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value triangle \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add radiobutton \
	-label [msgcat::mc {Arrow}] \
	-variable ${varname}(graph,ds,scatter,shape,symbol) -value arrow \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.shape add separator
    $var(mb).ds.shape add cascade -label [msgcat::mc {Color}] \
	-menu $var(mb).ds.shape.color

    PlotColorMenu $var(mb).ds.shape.color $varname \
	graph,ds,scatter,shape,color [list PlotScatterUpdateElement $varname]

    # Error
    ThemeMenu $var(mb).ds.error
    $var(mb).ds.error add checkbutton -label [msgcat::mc {Show}] \
	-variable ${varname}(graph,ds,error) \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.error add checkbutton -label [msgcat::mc {Cap}] \
	-variable ${varname}(graph,ds,error,cap) \
	-command [list PlotScatterUpdateElement $varname]
    $var(mb).ds.error add separator
    $var(mb).ds.error add cascade -label [msgcat::mc {Color}] \
	-menu $var(mb).ds.error.color
    $var(mb).ds.error add cascade -label [msgcat::mc {Width}] \
	-menu $var(mb).ds.error.width

    PlotColorMenu $var(mb).ds.error.color $varname \
	graph,ds,error,color [list PlotScatterUpdateElement $varname]
    WidthDashMenu $var(mb).ds.error.width $varname \
	graph,ds,error,width {} [list PlotScatterUpdateElement $varname] {}
}


proc PlotScatterAddGraph {varname} {
    upvar #0 $varname var
    global $varname

    set var(graph,type) scatter
    blt::graph $var(graph) \
	-width 600 \
	-height 500 \
	-highlightthickness 0
}

proc PlotScatterUpdateElement {varname} {
    upvar #0 $varname var
    global $varname

    PlotSaveState $varname

    set cc $var(graph,current)
    if {[llength $var($cc,dss)] == 0} {
 	return
    }
    
    if {$var(theme)} {
	set shapecolor [ThemeBold]
	set shapefillcolor [ThemeBold]
	set errorcolor [ThemeBold]
    } else {
	set shapecolor $var(graph,ds,scatter,shape,color)
	set shapefillcolor $var(graph,ds,scatter,shape,color)
	set errorcolor $var(graph,ds,error,color)
    }

    if {$var(graph,ds,bar,shape,fill)} {
	if {$var(theme)} {
	    set shapefillcolor [ThemeBold]
	} else {
	    set shapefillcolor $var(graph,ds,bar,shape,color)
	}
    } else {
	set shapefillcolor {}
    }

    if {$var(graph,ds,error)} {
	set show both
    } else {
	set show none
    }

    if {$var(graph,ds,error,cap)} {
	set cap [expr $var(graph,ds,error,width)+3]
    } else {
	set cap 0
    }

    set nn $var(graph,ds,current)
    $var(graph) element configure ${nn} \
	-label $var(graph,ds,name) \
	-hide [expr !$var(graph,ds,show)] \
	-outline $shapecolor \
	-fill $shapefillcolor \
	-symbol $var(graph,ds,scatter,shape,symbol) \
	-scalesymbols no \
	-linewidth 0 \
	-pixels 5 \
	-showerrorbars $show \
	-errorbarcolor $errorcolor \
	-errorbarwidth $var(graph,ds,error,width) \
	-errorbarcap $cap

    $var(graph) pen configure active \
	-color blue \
	-symbol $var(graph,ds,scatter,shape,symbol) \
	-linewidth 0 \
	-pixels 5 \
	-showerrorbars $show \
	-errorbarcolor $errorcolor \
	-errorbarwidth $var(graph,ds,error,width) \
	-errorbarcap $cap
}

proc PlotScatterButton {varname cc nn xx yy} {
    upvar #0 $varname var
    global $varname

    if {[llength $var($cc,dss)] == 0} {
	return
    }

    if {$var(callback) == {}} {
	return
    }

    set rr [$var($cc,graph) element closest $xx $yy]
    set elem [lindex $rr 1]
    set row [lindex $rr 3]

    if {$elem != {}} {
	if {$row != {}} {
	    $var($cc,graph) element deactivate $elem
	    $var($cc,graph) element activate $elem $row
	    # rows start at 1
	    eval "$var(callback) [expr $row+1] $cc"
	} else {
	    $var($cc,graph) element deactivate $elem
	    eval "$var(callback) {} $cc"
	}
    }
}

proc PlotScatterHighliteElement {varname cc nn rowlist} {
    upvar #0 $varname var
    global $varname

    if {[llength $var($cc,dss)] == 0} {
	return
    }

    if {$var($cc,$nn,show)} {
	$var($cc,graph) element deactivate $nn
	if {$rowlist != {}} {
	    # can have multiple rows
	    eval "$var($cc,graph) element activate $nn $rowlist"
	}
    }
}

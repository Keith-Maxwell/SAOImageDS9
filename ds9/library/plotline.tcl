#  Copyright (C) 1999-2018
#  Smithsonian Astrophysical Observatory, Cambridge, MA, USA
#  For conditions of distribution and use, see copyright notice in "copyright"

package provide DS9 1.0

# used by backup
proc PlotLineTool {} {
    global iap

    PlotLine $iap(tt) [msgcat::mc {Line Plot Tool}] {} {} {} 2 {}
}

proc PlotLine {tt wtt title xaxis yaxis dim data} {
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
    PlotAddGraph $varname line
    PlotTitle $varname $title $xaxis $yaxis
    PlotAddDataSet $varname $dim $data
    PlotStats $varname
    PlotList $varname
}

proc PlotLineMenus {varname} {
    upvar #0 $varname var
    global $varname

    ThemeMenu $var(mb).dataline
    $var(mb).dataline add checkbutton -label [msgcat::mc {Show}] \
	-variable ${varname}(graph,ds,show) \
	-command [list PlotLineUpdateElement $varname]
    $var(mb).dataline add separator
    $var(mb).dataline add cascade -label [msgcat::mc {Color}] \
	-menu $var(mb).dataline.color
    $var(mb).dataline add cascade -label [msgcat::mc {Width}] \
	-menu $var(mb).dataline.width
    $var(mb).dataline add cascade -label [msgcat::mc {Shadow}] \
	-menu $var(mb).dataline.fill
    $var(mb).dataline add cascade -label [msgcat::mc {Shape}] \
	-menu $var(mb).dataline.shape
    $var(mb).dataline add cascade -label [msgcat::mc {Smooth}] \
	-menu $var(mb).dataline.smooth
    $var(mb).dataline add cascade -label [msgcat::mc {Error}] \
	-menu $var(mb).dataline.error
    $var(mb).dataline add separator
    $var(mb).dataline add command -label "[msgcat::mc {Name}]..." \
	-command [list DatasetNameDialog $varname]

    ColorMenu $var(mb).dataline.color $varname graph,ds,line,color \
	[list PlotLineUpdateElement $varname]

    ThemeMenu $var(mb).dataline.width
    $var(mb).dataline.width add radiobutton \
	-label {0} -variable ${varname}(graph,ds,line,width) \
	-value 0 -command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.width add radiobutton \
	-label {1} -variable ${varname}(graph,ds,line,width) \
	-value 1 -command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.width add radiobutton \
	-label {2} -variable ${varname}(graph,ds,line,width) \
	-value 2 -command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.width add radiobutton \
	-label {3} -variable ${varname}(graph,ds,line,width) \
	-value 3 -command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.width add radiobutton \
	-label {4} -variable ${varname}(graph,ds,line,width) \
	-value 4 -command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.width add separator
    $var(mb).dataline.width add checkbutton \
	-label [msgcat::mc {Dash}] -variable ${varname}(graph,ds,line,dash) \
	-command [list PlotLineUpdateElement $varname]

    ThemeMenu $var(mb).dataline.fill
    $var(mb).dataline.fill add checkbutton \
	-label [msgcat::mc {Fill}] \
	-variable ${varname}(graph,ds,line,fill) \
	-command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.fill add separator
    $var(mb).dataline.fill add cascade -label [msgcat::mc {Color}] \
	-menu $var(mb).dataline.fill.color

    ColorMenu $var(mb).dataline.fill.color \
	$varname graph,ds,line,fill,color [list PlotLineUpdateElement $varname]

    ThemeMenu $var(mb).dataline.shape
    $var(mb).dataline.shape add checkbutton \
	-label [msgcat::mc {Fill}] \
	-variable ${varname}(graph,ds,line,shape,fill) \
	-command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.shape add separator
    $var(mb).dataline.shape add cascade -label [msgcat::mc {Symbol}] \
	-menu $var(mb).dataline.shape.symbol
    $var(mb).dataline.shape add cascade -label [msgcat::mc {Color}] \
	-menu $var(mb).dataline.shape.color

    PlotLineShapeMenu $var(mb).dataline.shape.symbol \
	${varname}(graph,ds,line,shape,symbol) \
	[list PlotLineUpdateElement $varname]
    ColorMenu $var(mb).dataline.shape.color \
	$varname graph,ds,line,shape,color \
	[list PlotLineUpdateElement $varname]
    
    PlotLineSmoothMenu $var(mb).dataline.smooth \
	${varname}(graph,ds,line,smooth) \
	[list PlotLineUpdateElement $varname]
    
    ThemeMenu $var(mb).dataline.error
    $var(mb).dataline.error add checkbutton -label [msgcat::mc {Show}] \
	-variable ${varname}(graph,ds,error) \
	-command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.error add checkbutton -label [msgcat::mc {Cap}] \
	-variable ${varname}(graph,ds,error,cap) \
	-command [list PlotLineUpdateElement $varname]
    $var(mb).dataline.error add separator
    $var(mb).dataline.error add cascade -label [msgcat::mc {Color}] \
	-menu $var(mb).dataline.error.color
    $var(mb).dataline.error add cascade -label [msgcat::mc {Width}] \
	-menu $var(mb).dataline.error.width

    ColorMenu $var(mb).dataline.error.color $varname graph,ds,error,color \
	[list PlotLineUpdateElement $varname]
    WidthDashMenu $var(mb).dataline.error.width $varname \
	graph,ds,error,width {} [list PlotLineUpdateElement $varname] {}
}

proc PlotLineShapeMenu {w var cmd} {
    ThemeMenu $w
    $w add radiobutton -label [msgcat::mc {None}] \
	-variable $var -value none -command $cmd
    $w add radiobutton -label [msgcat::mc {Circle}] \
	-variable $var -value circle -command $cmd
    $w add radiobutton -label [msgcat::mc {Square}] \
	-variable $var -value square -command $cmd
    $w add radiobutton -label [msgcat::mc {Diamond}] \
	-variable $var -value diamond -command $cmd
    $w add radiobutton -label [msgcat::mc {Plus}] \
	-variable $var -value plus -command $cmd
    $w add radiobutton -label [msgcat::mc {Cross}] \
	-variable $var -value cross -command $cmd
    $w add radiobutton -label [msgcat::mc {Simple Plus}] \
	-variable $var -value splus -command $cmd
    $w add radiobutton -label [msgcat::mc {Simple Cross}] \
	-variable $var -value scross -command $cmd
    $w add radiobutton -label [msgcat::mc {Triangle}] \
	-variable $var -value triangle -command $cmd
    $w add radiobutton -label [msgcat::mc {Arrow}] \
	-variable $var -value arrow -command $cmd
}

proc PlotLineSmoothMenu {w var cmd} {
    ThemeMenu $w
    $w add radiobutton -label [msgcat::mc {Step}] \
	-variable $var -value step -command $cmd
    $w add radiobutton -label [msgcat::mc {Linear}] \
	-variable $var -value linear -command $cmd
    $w add radiobutton -label [msgcat::mc {Cubic}] \
	-variable $var -value cubic -command $cmd
    $w add radiobutton -label [msgcat::mc {Quadratic}] \
	-variable $var -value quadratic -command $cmd
    $w add radiobutton -label [msgcat::mc {Catrom}] \
	-variable $var -value catrom -command $cmd
}

proc PlotLineAddGraph {varname} {
    upvar #0 $varname var
    global $varname

    set var(graph,type) line
    blt::graph $var(graph) \
	-width 600 \
	-height 500 \
	-highlightthickness 0
}

proc PlotLineUpdateElement {varname} {
    upvar #0 $varname var
    global $varname
    
    PlotSaveState $varname

    set cc $var(graph,current)
    if {[llength $var($cc,dss)] == 0} {
 	return
    }
    
    if {$var(theme)} {
	set color [ThemeBold]
	set shapecolor [ThemeBold]
	set errorcolor [ThemeBold]
    } else {
	set color $var(graph,ds,line,color)
	set shapecolor $var(graph,ds,line,shape,color)
	set errorcolor $var(graph,ds,error,color)
    }

    if {$var(graph,ds,line,fill)} {
	if {$var(theme)} {
	    set fillColor [ThemeBold]
	} else {
	    set fillColor $var(graph,ds,line,fill,color)
	}
    } else {
	set fillColor {}
    }

    if {$var(graph,ds,line,shape,fill)} {
	if {$var(theme)} {
	    set shapefillcolor [ThemeBold]
	} else {
	    set shapefillcolor $var(graph,ds,line,shape,color)
	}
    } else {
	set shapefillcolor $var(graph,background)
    }

    if {$var(graph,ds,line,dash)} {
	set dash {8 3}
    } else {
	set dash { }
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
	-color $color \
	-areabackground $fillColor \
	-outline $shapecolor \
	-fill $shapefillcolor \
	-symbol $var(graph,ds,line,shape,symbol) \
	-scalesymbols no \
	-pixels 5 \
	-smooth $var(graph,ds,line,smooth) \
	-linewidth $var(graph,ds,line,width) \
	-dashes $dash \
	-showerrorbars $show \
	-errorbarcolor $errorcolor \
	-errorbarwidth $var(graph,ds,error,width) \
	-errorbarcap $cap
}


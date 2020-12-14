package provide DS9 1.0

######
# Begin autogenerated taccle (version 1.3) routines.
# Although taccle itself is protected by the GNU Public License (GPL)
# all user-supplied functions are protected by their respective
# author's license.  See http://mini.net/tcl/taccle for other details.
######

namespace eval rgbcube {
    variable yylval {}
    variable table
    variable rules
    variable token {}
    variable yycnt 0
    variable yyerr 0
    variable save_state 0

    namespace export yylex
}

proc rgbcube::YYABORT {} {
    return -code return 1
}

proc rgbcube::YYACCEPT {} {
    return -code return 0
}

proc rgbcube::YYERROR {} {
    variable yyerr
    set yyerr 1
}

proc rgbcube::yyclearin {} {
    variable token
    variable yycnt
    set token {}
    incr yycnt -1
}

proc rgbcube::yyerror {s} {
    puts stderr $s
}

proc rgbcube::setupvalues {stack pointer numsyms} {
    upvar 1 1 y
    set y {}
    for {set i 1} {$i <= $numsyms} {incr i} {
        upvar 1 $i y
        set y [lindex $stack $pointer]
        incr pointer
    }
}

proc rgbcube::unsetupvalues {numsyms} {
    for {set i 1} {$i <= $numsyms} {incr i} {
        upvar 1 $i y
        unset y
    }
}

array set rgbcube::table {
  3:0,target 1
  0:257 reduce
  1:257 reduce
  0:258 shift
  5:0,target 3
  0:259 goto
  0:260 goto
  0:261 goto
  4:257 shift
  1:257,target 5
  0:258,target 1
  0:0,target 4
  0:261,target 4
  2:0,target 0
  4:0,target 2
  0:0 reduce
  1:0 reduce
  0:257,target 4
  2:0 accept
  3:0 reduce
  0:259,target 2
  0:260,target 3
  4:0 reduce
  1:0,target 5
  5:0 reduce
  4:257,target 5
}

array set rgbcube::rules {
  0,l 262
  1,l 259
  2,l 260
  3,l 260
  4,l 261
  5,l 261
}

array set rgbcube::rules {
  5,dc 1
  0,dc 1
  2,dc 1
  4,dc 0
  1,dc 1
  3,dc 2
}

array set rgbcube::rules {
  5,line 25
  2,line 20
  4,line 24
  1,line 17
  3,line 21
}

array set rgbcube::lr1_table {
  0 {{0 0 0} {1 0 0} {2 0 0} {3 0 0} {4 {0 257} 0} {5 {0 257} 0}}
  1 {{5 {0 257} 1}}
  2 {{0 0 1}}
  3 {{1 0 1}}
  4 {{2 0 1} {3 0 1}}
  0,trans {{258 1} {259 2} {260 3} {261 4}}
  1,trans {}
  5 {{3 0 2}}
  2,trans {}
  3,trans {}
  4,trans {{257 5}}
  5,trans {}
}

array set rgbcube::token_id_table {
  262,title {}
  0 {$}
  0,t 0
  error,t 0
  error error
  258,line 11
  261,line 23
  error,line 14
  257 STRING_
  257,t 0
  258 NEW_
  258,t 0
  260,t 1
  260 rgbcube
  259,t 1
  259 command
  error,title {}
  261,t 1
  261 opts
  262,t 1
  262 start'
  257,line 7
  260,line 19
  259,line 16
  257,title string
  258,title NEW
  262,line 26
  260,title {}
  259,title {}
  261,title {}
}

proc rgbcube::yyparse {} {
    variable yylval
    variable table
    variable rules
    variable token
    variable yycnt
    variable lr1_table
    variable token_id_table
    variable yyerr
    variable save_state

    set yycnt 0
    set state_stack {0}
    set value_stack {{}}
    set token ""
    set accepted 0
    set yyerr 0
    set save_state 0

    while {$accepted == 0} {
        set state [lindex $state_stack end]
        if {$token == ""} {
            set yylval ""
            set token [yylex]
            set buflval $yylval
	    if {$token>0} {
	        incr yycnt
            }
        }
        if {![info exists table($state:$token)] || $yyerr} {
	    if {!$yyerr} {
	        set save_state $state
	    }
            # pop off states until error token accepted
            while {[llength $state_stack] > 0 && \
                       ![info exists table($state:error)]} {
                set state_stack [lrange $state_stack 0 end-1]
                set value_stack [lrange $value_stack 0 \
                                       [expr {[llength $state_stack] - 1}]]
                set state [lindex $state_stack end]
            }
            if {[llength $state_stack] == 0} {
 
	        set rr { }
                if {[info exists lr1_table($save_state,trans)] && [llength $lr1_table($save_state,trans)] >= 1} {
                    foreach trans $lr1_table($save_state,trans) {
                        foreach {tok_id nextstate} $trans {
			    set ss $token_id_table($tok_id,title)
			    if {$ss != {}} {
			        append rr "$ss, "
                            }
                        }
                    }
                }
		set rr [string trimleft $rr { }]
		set rr [string trimright $rr {, }]
                yyerror "parse error, expecting: $rr"


                return 1
            }
            lappend state_stack [set state $table($state:error,target)]
            lappend value_stack {}
            # consume tokens until it finds an acceptable one
            while {![info exists table($state:$token)]} {
                if {$token == 0} {
                    yyerror "end of file while recovering from error"
                    return 1
                }
                set yylval {}
                set token [yylex]
                set buflval $yylval
            }
            continue
        }
        switch -- $table($state:$token) {
            shift {
                lappend state_stack $table($state:$token,target)
                lappend value_stack $buflval
                set token ""
            }
            reduce {
                set rule $table($state:$token,target)
                set ll $rules($rule,l)
                if {[info exists rules($rule,e)]} {
                    set dc $rules($rule,e)
                } else {
                    set dc $rules($rule,dc)
                }
                set stackpointer [expr {[llength $state_stack]-$dc}]
                setupvalues $value_stack $stackpointer $dc
                set _ $1
                set yylval [lindex $value_stack end]
                switch -- $rule {
                    2 { RGBCubeCmdLoad {} }
                    3 { RGBCubeCmdLoad $2 }
                    5 { CreateRGBFrame }
                }
                unsetupvalues $dc
                # pop off tokens from the stack if normal rule
                if {![info exists rules($rule,e)]} {
                    incr stackpointer -1
                    set state_stack [lrange $state_stack 0 $stackpointer]
                    set value_stack [lrange $value_stack 0 $stackpointer]
                }
                # now do the goto transition
                lappend state_stack $table([lindex $state_stack end]:$ll,target)
                lappend value_stack $_
            }
            accept {
                set accepted 1
            }
            goto -
            default {
                puts stderr "Internal parser error: illegal command $table($state:$token)"
                return 2
            }
        }
    }
    return 0
}

######
# end autogenerated taccle functions
######

proc rgbcube::yyerror {msg} {
     variable yycnt
     variable yy_current_buffer
     variable index_

     ParserError $msg $yycnt $yy_current_buffer $index_
}

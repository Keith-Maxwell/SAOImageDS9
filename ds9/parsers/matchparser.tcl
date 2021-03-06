package provide DS9 1.0

######
# Begin autogenerated taccle (version 1.3) routines.
# Although taccle itself is protected by the GNU Public License (GPL)
# all user-supplied functions are protected by their respective
# author's license.  See http://mini.net/tcl/taccle for other details.
######

namespace eval match {
    variable yylval {}
    variable table
    variable rules
    variable token {}
    variable yycnt 0
    variable yyerr 0
    variable save_state 0

    namespace export yylex
}

proc match::YYABORT {} {
    return -code return 1
}

proc match::YYACCEPT {} {
    return -code return 0
}

proc match::YYERROR {} {
    variable yyerr
    set yyerr 1
}

proc match::yyclearin {} {
    variable token
    variable yycnt
    set token {}
    incr yycnt -1
}

proc match::yyerror {s} {
    puts stderr $s
}

proc match::setupvalues {stack pointer numsyms} {
    upvar 1 1 y
    set y {}
    for {set i 1} {$i <= $numsyms} {incr i} {
        upvar 1 $i y
        set y [lindex $stack $pointer]
        incr pointer
    }
}

proc match::unsetupvalues {numsyms} {
    for {set i 1} {$i <= $numsyms} {incr i} {
        upvar 1 $i y
        unset y
    }
}

array set match::table {
  39:285,target 29
  38:272 shift
  38:273 shift
  37:297,target 40
  38:274 shift
  3:288,target 3
  38:281,target 25
  38:275 shift
  27:0 reduce
  38:276 shift
  39:264,target 8
  38:277 shift
  9:288 reduce
  48:0 reduce
  38:278 shift
  37:276,target 20
  0:296,target 39
  38:280 shift
  38:279 shift
  35:288,target 44
  30:288 reduce
  29:288 reduce
  42:302,target 52
  38:281 shift
  38:260,target 4
  38:259,target 3
  38:282 shift
  38:283 shift
  38:284 shift
  0:275,target 19
  6:0,target 6
  38:285 shift
  38:299,target 42
  2:0 reduce
  42:271,target 15
  38:286 shift
  24:288,target 24
  39:283,target 27
  38:287 shift
  37:295,target 38
  37:305,target 48
  38:289 shift
  38:300 shift
  38:290 shift
  24:0 reduce
  48:0,target 37
  38:278,target 22
  38:301 goto
  38:291 shift
  41:0,target 42
  38:302 goto
  38:292 shift
  45:0 reduce
  39:262,target 6
  38:293 shift
  33:0,target 40
  13:288,target 13
  38:294 shift
  37:274,target 18
  25:0,target 25
  0:294,target 37
  38:295 shift
  38:305 goto
  17:0,target 17
  38:257,target 1
  38:296 shift
  10:0,target 10
  47:288 reduce
  38:297 shift
  38:298 shift
  38:299 shift
  0:273,target 17
  47:288,target 33
  38:297,target 40
  42:268,target 12
  4:288,target 4
  47:304 goto
  39:281,target 25
  17:288 reduce
  37:293,target 36
  21:0 reduce
  38:276,target 20
  36:288,target 43
  39:260,target 4
  39:259,target 3
  37:272,target 16
  0:302,target 45
  0:292,target 35
  6:288 reduce
  42:287,target 31
  26:288 reduce
  39:299,target 42
  25:288,target 25
  0:271,target 15
  38:295,target 38
  38:305,target 49
  42:266,target 10
  39:278,target 22
  17:0 reduce
  37:301,target 44
  37:291,target 34
  35:288 reduce
  14:288,target 14
  38:274,target 18
  39:257,target 1
  37:270,target 14
  37:269,target 13
  0:289,target 32
  0:300,target 43
  0:290,target 33
  3:0,target 3
  42:285,target 29
  48:288,target 37
  39:297,target 40
  44:288 reduce
  5:288,target 5
  53:0,target 38
  0:268,target 12
  45:0,target 48
  38:293,target 36
  42:264,target 8
  14:0 reduce
  39:276,target 20
  30:0,target 30
  29:0,target 29
  14:288 reduce
  22:0,target 22
  35:0 reduce
  14:0,target 14
  38:272,target 16
  53:288 reduce
  37:267,target 11
  0:287,target 31
  26:288,target 26
  3:288 reduce
  42:283,target 27
  0:257 shift
  39:295,target 38
  39:305,target 50
  0:258 shift
  23:288 reduce
  0:260 shift
  0:259 shift
  0:261 shift
  0:266,target 10
  9:0 reduce
  38:301,target 44
  38:291,target 34
  0:262 shift
  11:0 reduce
  42:262,target 6
  0:263 shift
  15:288,target 15
  39:274,target 18
  0:264 shift
  37:286,target 30
  32:0 reduce
  0:265 shift
  0:266 shift
  38:270,target 14
  38:269,target 13
  32:288 reduce
  0:267 shift
  53:0 reduce
  0:268 shift
  0:269 shift
  0:270 shift
  50:288,target 35
  49:288,target 36
  37:265,target 9
  0:271 shift
  0:285,target 29
  0:272 shift
  6:288,target 6
  42:281,target 25
  0:273 shift
  39:293,target 36
  0:274 shift
  0:275 shift
  6:0 reduce
  41:288 reduce
  0:264,target 8
  0:276 shift
  37:257 shift
  0:277 shift
  37:258 shift
  0:278 shift
  39:272,target 16
  37:260 shift
  37:259 shift
  28:0 reduce
  0:279 shift
  0:280 shift
  7:0,target 7
  37:284,target 28
  37:261 shift
  0:281 shift
  37:262 shift
  0:282 shift
  11:288 reduce
  50:0 reduce
  49:0 reduce
  38:267,target 11
  37:263 shift
  0:283 shift
  37:264 shift
  27:288,target 27
  0:284 shift
  50:288 reduce
  49:288 reduce
  37:265 shift
  0:285 shift
  50:0,target 35
  49:0,target 36
  37:266 shift
  37:263,target 7
  0:283,target 27
  0:286 shift
  37:267 shift
  0:287 shift
  42:278,target 22
  37:268 shift
  34:0,target 39
  39:301,target 44
  39:291,target 34
  37:270 shift
  37:269 shift
  26:0,target 26
  0:289 shift
  0:300 shift
  0:290 shift
  3:0 reduce
  37:271 shift
  0:301 goto
  0:291 shift
  16:288,target 16
  18:0,target 18
  19:288 reduce
  20:288 reduce
  37:272 shift
  0:262,target 6
  0:302 goto
  0:292 shift
  11:0,target 11
  38:286,target 30
  37:273 shift
  0:293 shift
  0:303 goto
  42:257,target 51
  37:274 shift
  0:294 shift
  25:0 reduce
  39:270,target 14
  39:269,target 13
  37:275 shift
  0:305 goto
  0:295 shift
  37:282,target 26
  37:276 shift
  0:296 shift
  46:0 accept
  37:277 shift
  0:297 shift
  8:288 reduce
  51:288,target 49
  38:265,target 9
  37:278 shift
  0:298 shift
  37:280 shift
  37:279 shift
  28:288 reduce
  0:299 shift
  7:288,target 7
  37:281 shift
  37:282 shift
  37:261,target 5
  0:281,target 25
  37:283 shift
  42:276,target 20
  37:284 shift
  40:288,target 41
  37:285 shift
  37:286 shift
  37:287 shift
  0:260,target 4
  0:259,target 3
  38:284,target 28
  22:0 reduce
  37:289 shift
  37:300 shift
  37:290 shift
  39:267,target 11
  37:301 goto
  37:291 shift
  43:0 reduce
  37:280,target 24
  37:279,target 23
  37:302 goto
  37:292 shift
  28:288,target 28
  0:299,target 42
  37:293 shift
  38:263,target 7
  37:294 shift
  37:295 shift
  37:305 goto
  37:296 shift
  37:258,target 2
  37:297 shift
  0:278,target 22
  47:304,target 54
  37:298 shift
  17:288,target 17
  42:274,target 18
  37:299 shift
  39:286,target 30
  4:0,target 4
  37:298,target 41
  0:257,target 1
  16:288 reduce
  18:0 reduce
  38:282,target 26
  52:288,target 50
  40:0 reduce
  39:265,target 9
  46:0,target 0
  37:277,target 21
  0:297,target 40
  8:288,target 8
  38:261,target 5
  31:0,target 31
  5:288 reduce
  23:0,target 23
  25:288 reduce
  15:0,target 15
  41:288,target 42
  0:276,target 20
  42:272,target 16
  39:284,target 28
  37:296,target 39
  15:0 reduce
  38:280,target 24
  38:279,target 23
  30:288,target 30
  29:288,target 29
  36:0 reduce
  34:288 reduce
  39:263,target 7
  37:275,target 19
  0:305,target 47
  0:295,target 38
  38:258,target 2
  18:288,target 18
  0:274,target 18
  43:288 reduce
  38:298,target 41
  42:270,target 14
  42:269,target 13
  39:257 shift
  39:282,target 26
  39:258 shift
  12:0 reduce
  39:260 shift
  39:259 shift
  37:294,target 37
  53:288,target 38
  39:261 shift
  39:262 shift
  38:277,target 21
  33:0 reduce
  9:288,target 9
  13:288 reduce
  39:263 shift
  39:264 shift
  39:261,target 5
  52:288 reduce
  39:265 shift
  37:273,target 17
  0:293,target 36
  0:303,target 46
  39:266 shift
  39:267 shift
  8:0,target 8
  39:268 shift
  1:0,target 1
  2:288 reduce
  39:270 shift
  39:269 shift
  39:271 shift
  0:272,target 16
  22:288 reduce
  39:272 shift
  38:296,target 39
  7:0 reduce
  42:267,target 11
  39:273 shift
  51:0,target 49
  39:280,target 24
  39:279,target 23
  39:274 shift
  31:288,target 31
  43:0,target 45
  39:275 shift
  37:302,target 45
  37:292,target 35
  39:276 shift
  35:0,target 44
  30:0 reduce
  29:0 reduce
  39:277 shift
  38:275,target 19
  27:0,target 27
  39:278 shift
  19:0,target 19
  20:0,target 20
  51:0 reduce
  39:280 shift
  39:279 shift
  39:258,target 2
  31:288 reduce
  12:0,target 12
  39:281 shift
  37:271,target 15
  0:301,target 44
  0:291,target 34
  19:288,target 19
  20:288,target 20
  39:282 shift
  42:286,target 30
  39:283 shift
  39:284 shift
  39:298,target 41
  39:285 shift
  39:286 shift
  0:269,target 13
  0:270,target 14
  4:0 reduce
  39:287 shift
  38:294,target 37
  54:288,target 55
  42:265,target 9
  40:288 reduce
  39:277,target 21
  39:289 shift
  39:300 shift
  39:290 shift
  39:301 goto
  39:291 shift
  37:289,target 32
  37:300,target 43
  37:290,target 33
  26:0 reduce
  39:302 goto
  39:292 shift
  39:293 shift
  38:273,target 17
  47:0 reduce
  39:294 shift
  10:288 reduce
  43:288,target 45
  39:295 shift
  39:305 goto
  39:296 shift
  37:268,target 12
  48:288 reduce
  39:297 shift
  42:284,target 28
  39:298 shift
  39:299 shift
  39:296,target 39
  1:0 reduce
  32:288,target 46
  0:267,target 11
  38:302,target 45
  38:292,target 35
  18:288 reduce
  42:263,target 7
  39:275,target 19
  23:0 reduce
  37:287,target 31
  44:0 reduce
  38:271,target 15
  5:0,target 5
  21:288,target 21
  7:288 reduce
  37:266,target 10
  27:288 reduce
  0:286,target 30
  55:0,target 34
  42:282,target 26
  47:0,target 32
  39:294,target 37
  10:288,target 10
  40:0,target 41
  32:0,target 46
  0:265,target 9
  38:289,target 32
  38:300,target 43
  38:290,target 33
  24:0,target 24
  42:261,target 5
  16:0,target 16
  19:0 reduce
  20:0 reduce
  39:273,target 17
  36:288 reduce
  37:285,target 29
  44:288,target 47
  41:0 reduce
  38:268,target 12
  1:288,target 1
  37:264,target 8
  0:284,target 28
  45:288 reduce
  42:280,target 24
  42:279,target 23
  33:288,target 40
  42:257 shift
  39:302,target 45
  39:292,target 35
  0:263,target 7
  42:261 shift
  38:287,target 31
  16:0 reduce
  42:262 shift
  15:288 reduce
  42:263 shift
  39:271,target 15
  22:288,target 22
  42:264 shift
  37:283,target 27
  54:288 shift
  42:265 shift
  42:266 shift
  38:266,target 10
  42:267 shift
  42:268 shift
  4:288 reduce
  42:270 shift
  42:269 shift
  37:262,target 6
  0:282,target 26
  11:288,target 11
  42:271 shift
  24:288 reduce
  42:277,target 21
  42:272 shift
  42:273 shift
  39:289,target 32
  39:300,target 43
  39:290,target 33
  42:274 shift
  42:275 shift
  0:261,target 5
  9:0,target 9
  13:0 reduce
  42:276 shift
  38:285,target 29
  2:0,target 2
  45:288,target 48
  42:277 shift
  42:278 shift
  39:268,target 12
  34:0 reduce
  2:288,target 2
  42:280 shift
  42:279 shift
  37:281,target 25
  33:288 reduce
  42:281 shift
  55:0 reduce
  52:0,target 50
  42:282 shift
  42:306,target 53
  38:264,target 8
  44:0,target 47
  42:283 shift
  42:284 shift
  36:0,target 43
  34:288,target 39
  42:285 shift
  37:260,target 4
  37:259,target 3
  28:0,target 28
  0:279,target 23
  0:280,target 24
  42:286 shift
  21:0,target 21
  42:287 shift
  42:275,target 19
  13:0,target 13
  39:287,target 31
  8:0 reduce
  38:257 shift
  37:299,target 42
  10:0 reduce
  38:258 shift
  0:258,target 2
  23:288,target 23
  42:302 goto
  38:283,target 27
  38:260 shift
  38:259 shift
  38:261 shift
  31:0 reduce
  39:266,target 10
  38:262 shift
  12:288 reduce
  38:263 shift
  37:278,target 22
  0:298,target 41
  52:0 reduce
  42:306 goto
  38:264 shift
  51:288 reduce
  38:265 shift
  38:262,target 6
  12:288,target 12
  38:266 shift
  38:267 shift
  38:268 shift
  37:257,target 1
  0:277,target 21
  1:288 reduce
  38:270 shift
  38:269 shift
  42:273,target 17
  38:271 shift
  5:0 reduce
  21:288 reduce
}

array set match::rules {
  9,l 302
  11,l 302
  32,l 303
  6,l 302
  28,l 302
  50,l 306
  49,l 306
  3,l 301
  25,l 302
  46,l 305
  0,l 307
  22,l 302
  43,l 305
  18,l 302
  40,l 305
  39,l 305
  15,l 302
  36,l 305
  12,l 302
  33,l 304
  7,l 302
  29,l 302
  30,l 302
  4,l 301
  26,l 302
  47,l 305
  1,l 301
  23,l 302
  44,l 305
  19,l 302
  20,l 302
  41,l 305
  16,l 302
  37,l 305
  13,l 302
  34,l 303
  8,l 302
  10,l 302
  31,l 302
  5,l 302
  27,l 302
  48,l 305
  2,l 301
  24,l 302
  45,l 305
  21,l 302
  42,l 305
  17,l 302
  38,l 305
  14,l 302
  35,l 305
}

array set match::rules {
  12,dc 1
  26,dc 1
  3,dc 1
  41,dc 1
  18,dc 1
  33,dc 0
  9,dc 1
  47,dc 1
  11,dc 1
  25,dc 1
  2,dc 1
  40,dc 1
  39,dc 1
  17,dc 1
  32,dc 1
  8,dc 1
  46,dc 1
  10,dc 1
  24,dc 1
  1,dc 1
  38,dc 2
  16,dc 1
  31,dc 1
  7,dc 1
  45,dc 1
  23,dc 1
  0,dc 1
  37,dc 2
  15,dc 1
  29,dc 1
  30,dc 1
  6,dc 1
  44,dc 1
  22,dc 1
  36,dc 2
  14,dc 1
  28,dc 1
  5,dc 1
  43,dc 1
  21,dc 1
  35,dc 2
  50,dc 1
  49,dc 1
  13,dc 1
  27,dc 1
  4,dc 1
  42,dc 1
  19,dc 1
  20,dc 1
  34,dc 3
  48,dc 1
}

array set match::rules {
  41,line 137
  7,line 100
  37,line 133
  4,line 96
  34,line 128
  1,line 93
  31,line 124
  27,line 120
  24,line 117
  21,line 114
  17,line 110
  14,line 107
  11,line 104
  50,line 150
  49,line 149
  46,line 142
  33,e 1
  43,line 139
  9,line 102
  40,line 136
  39,line 135
  6,line 99
  36,line 132
  3,line 95
  33,line 127
  29,line 122
  30,line 123
  26,line 119
  23,line 116
  19,line 112
  20,line 113
  16,line 109
  13,line 106
  10,line 103
  48,line 146
  45,line 141
  42,line 138
  8,line 101
  38,line 134
  5,line 98
  35,line 131
  2,line 94
  32,line 127
  28,line 121
  25,line 118
  22,line 115
  18,line 111
  15,line 108
  12,line 105
  47,line 145
  44,line 140
}

array set match::lr1_table {
  35 {{44 {0 288} 1}}
  14,trans {}
  36 {{43 {0 288} 1}}
  33,trans {}
  37 {{37 {0 288} 1} {35 {0 288} 0} {36 {0 288} 0} {37 {0 288} 0} {38 {0 288} 0} {39 {0 288} 0} {40 {0 288} 0} {41 {0 288} 0} {42 {0 288} 0} {43 {0 288} 0} {44 {0 288} 0} {45 {0 288} 0} {46 {0 288} 0} {47 {0 288} 0} {48 {0 288} 0} {1 {0 288} 0} {2 {0 288} 0} {3 {0 288} 0} {4 {0 288} 0} {5 {0 288} 0} {6 {0 288} 0} {7 {0 288} 0} {8 {0 288} 0} {9 {0 288} 0} {10 {0 288} 0} {11 {0 288} 0} {12 {0 288} 0} {13 {0 288} 0} {14 {0 288} 0} {15 {0 288} 0} {16 {0 288} 0} {17 {0 288} 0} {18 {0 288} 0} {19 {0 288} 0} {20 {0 288} 0} {21 {0 288} 0} {22 {0 288} 0} {23 {0 288} 0} {24 {0 288} 0} {25 {0 288} 0} {26 {0 288} 0} {27 {0 288} 0} {28 {0 288} 0} {29 {0 288} 0} {30 {0 288} 0} {31 {0 288} 0}}
  52,trans {}
  38 {{36 {0 288} 1} {35 {0 288} 0} {36 {0 288} 0} {37 {0 288} 0} {38 {0 288} 0} {39 {0 288} 0} {40 {0 288} 0} {41 {0 288} 0} {42 {0 288} 0} {43 {0 288} 0} {44 {0 288} 0} {45 {0 288} 0} {46 {0 288} 0} {47 {0 288} 0} {48 {0 288} 0} {1 {0 288} 0} {2 {0 288} 0} {3 {0 288} 0} {4 {0 288} 0} {5 {0 288} 0} {6 {0 288} 0} {7 {0 288} 0} {8 {0 288} 0} {9 {0 288} 0} {10 {0 288} 0} {11 {0 288} 0} {12 {0 288} 0} {13 {0 288} 0} {14 {0 288} 0} {15 {0 288} 0} {16 {0 288} 0} {17 {0 288} 0} {18 {0 288} 0} {19 {0 288} 0} {20 {0 288} 0} {21 {0 288} 0} {22 {0 288} 0} {23 {0 288} 0} {24 {0 288} 0} {25 {0 288} 0} {26 {0 288} 0} {27 {0 288} 0} {28 {0 288} 0} {29 {0 288} 0} {30 {0 288} 0} {31 {0 288} 0}}
  39 {{35 {0 288} 1} {35 {0 288} 0} {36 {0 288} 0} {37 {0 288} 0} {38 {0 288} 0} {39 {0 288} 0} {40 {0 288} 0} {41 {0 288} 0} {42 {0 288} 0} {43 {0 288} 0} {44 {0 288} 0} {45 {0 288} 0} {46 {0 288} 0} {47 {0 288} 0} {48 {0 288} 0} {1 {0 288} 0} {2 {0 288} 0} {3 {0 288} 0} {4 {0 288} 0} {5 {0 288} 0} {6 {0 288} 0} {7 {0 288} 0} {8 {0 288} 0} {9 {0 288} 0} {10 {0 288} 0} {11 {0 288} 0} {12 {0 288} 0} {13 {0 288} 0} {14 {0 288} 0} {15 {0 288} 0} {16 {0 288} 0} {17 {0 288} 0} {18 {0 288} 0} {19 {0 288} 0} {20 {0 288} 0} {21 {0 288} 0} {22 {0 288} 0} {23 {0 288} 0} {24 {0 288} 0} {25 {0 288} 0} {26 {0 288} 0} {27 {0 288} 0} {28 {0 288} 0} {29 {0 288} 0} {30 {0 288} 0} {31 {0 288} 0}}
  40 {{41 {0 288} 1}}
  18,trans {}
  1,trans {}
  41 {{42 {0 288} 1}}
  37,trans {{257 1} {258 2} {259 3} {260 4} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {289 32} {290 33} {291 34} {292 35} {293 36} {294 37} {295 38} {296 39} {297 40} {298 41} {299 42} {300 43} {301 44} {302 45} {305 48}}
  42 {{38 {0 288} 1} {49 {0 288} 0} {50 {0 288} 0} {5 {0 288} 0} {6 {0 288} 0} {7 {0 288} 0} {8 {0 288} 0} {9 {0 288} 0} {10 {0 288} 0} {11 {0 288} 0} {12 {0 288} 0} {13 {0 288} 0} {14 {0 288} 0} {15 {0 288} 0} {16 {0 288} 0} {17 {0 288} 0} {18 {0 288} 0} {19 {0 288} 0} {20 {0 288} 0} {21 {0 288} 0} {22 {0 288} 0} {23 {0 288} 0} {24 {0 288} 0} {25 {0 288} 0} {26 {0 288} 0} {27 {0 288} 0} {28 {0 288} 0} {29 {0 288} 0} {30 {0 288} 0} {31 {0 288} 0}}
  43 {{45 {0 288} 1}}
  44 {{47 {0 288} 1}}
  23,trans {}
  5,trans {}
  45 {{48 {0 288} 1}}
  42,trans {{257 51} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {302 52} {306 53}}
  46 {{0 0 1}}
  47 {{32 0 1} {34 0 1} {33 288 0}}
  48 {{37 {0 288} 2}}
  50 {{35 {0 288} 2}}
  49 {{36 {0 288} 2}}
  27,trans {}
  9,trans {}
  46,trans {}
  51 {{49 {0 288} 1}}
  52 {{50 {0 288} 1}}
  53 {{38 {0 288} 2}}
  13,trans {}
  54 {{34 0 2}}
  32,trans {}
  55 {{34 0 3}}
  51,trans {}
  17,trans {}
  0,trans {{257 1} {258 2} {259 3} {260 4} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {289 32} {290 33} {291 34} {292 35} {293 36} {294 37} {295 38} {296 39} {297 40} {298 41} {299 42} {300 43} {301 44} {302 45} {303 46} {305 47}}
  36,trans {}
  55,trans {}
  22,trans {}
  4,trans {}
  41,trans {}
  26,trans {}
  8,trans {}
  45,trans {}
  12,trans {}
  31,trans {}
  50,trans {}
  49,trans {}
  16,trans {}
  35,trans {}
  54,trans {{288 55}}
  21,trans {}
  3,trans {}
  40,trans {}
  39,trans {{257 1} {258 2} {259 3} {260 4} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {289 32} {290 33} {291 34} {292 35} {293 36} {294 37} {295 38} {296 39} {297 40} {298 41} {299 42} {300 43} {301 44} {302 45} {305 50}}
  10 {{10 {0 288} 1}}
  11 {{11 {0 288} 1}}
  25,trans {}
  7,trans {}
  12 {{12 {0 288} 1}}
  44,trans {}
  13 {{13 {0 288} 1}}
  14 {{14 {0 288} 1}}
  11,trans {}
  15 {{15 {0 288} 1}}
  30,trans {}
  29,trans {}
  16 {{16 {0 288} 1}}
  48,trans {}
  0 {{0 0 0} {32 0 0} {34 0 0} {35 {0 288} 0} {36 {0 288} 0} {37 {0 288} 0} {38 {0 288} 0} {39 {0 288} 0} {40 {0 288} 0} {41 {0 288} 0} {42 {0 288} 0} {43 {0 288} 0} {44 {0 288} 0} {45 {0 288} 0} {46 {0 288} 0} {47 {0 288} 0} {48 {0 288} 0} {1 {0 288} 0} {2 {0 288} 0} {3 {0 288} 0} {4 {0 288} 0} {5 {0 288} 0} {6 {0 288} 0} {7 {0 288} 0} {8 {0 288} 0} {9 {0 288} 0} {10 {0 288} 0} {11 {0 288} 0} {12 {0 288} 0} {13 {0 288} 0} {14 {0 288} 0} {15 {0 288} 0} {16 {0 288} 0} {17 {0 288} 0} {18 {0 288} 0} {19 {0 288} 0} {20 {0 288} 0} {21 {0 288} 0} {22 {0 288} 0} {23 {0 288} 0} {24 {0 288} 0} {25 {0 288} 0} {26 {0 288} 0} {27 {0 288} 0} {28 {0 288} 0} {29 {0 288} 0} {30 {0 288} 0} {31 {0 288} 0}}
  17 {{17 {0 288} 1}}
  1 {{1 {0 288} 1}}
  18 {{18 {0 288} 1}}
  15,trans {}
  2 {{2 {0 288} 1}}
  19 {{19 {0 288} 1}}
  20 {{20 {0 288} 1}}
  34,trans {}
  3 {{3 {0 288} 1}}
  21 {{21 {0 288} 1}}
  53,trans {}
  4 {{4 {0 288} 1}}
  22 {{22 {0 288} 1}}
  5 {{5 {0 288} 1}}
  23 {{23 {0 288} 1}}
  20,trans {}
  19,trans {}
  2,trans {}
  6 {{6 {0 288} 1}}
  24 {{24 {0 288} 1}}
  38,trans {{257 1} {258 2} {259 3} {260 4} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {289 32} {290 33} {291 34} {292 35} {293 36} {294 37} {295 38} {296 39} {297 40} {298 41} {299 42} {300 43} {301 44} {302 45} {305 49}}
  7 {{7 {0 288} 1}}
  25 {{25 {0 288} 1}}
  8 {{8 {0 288} 1}}
  26 {{26 {0 288} 1}}
  9 {{9 {0 288} 1}}
  27 {{27 {0 288} 1}}
  24,trans {}
  6,trans {}
  28 {{28 {0 288} 1}}
  43,trans {}
  29 {{29 {0 288} 1}}
  30 {{30 {0 288} 1}}
  31 {{31 {0 288} 1}}
  10,trans {}
  32 {{46 {0 288} 1}}
  28,trans {}
  33 {{40 {0 288} 1}}
  47,trans {{304 54}}
  34 {{39 {0 288} 1}}
}

array set match::token_id_table {
  286 WCSY_
  286,t 0
  287 WCSZ_
  292,line 47
  302,line 97
  288 STRING_
  265,title WCSD
  289 3D_
  290 AXES_
  300 SMOOTH_
  284,title WCSW
  291 BIN_
  301 coordsys
  292 BLOCK_
  302 wcssys
  288,line 40
  293 COLORBAR_
  303 command
  304 @PSEUDO1
  294 CROP_
  305 match
  295 CROSSHAIR_
  306 matchslice
  296 FRAME_
  307 start'
  262,t 0
  297 SCALE_
  285,line 36
  298 SCALELIMITS_
  299 SLICE_
  283,t 0
  282,line 33
  264,title WCSC
  283,title WCSV
  278,line 29
  error,line 91
  258,t 0
  275,line 26
  279,t 0
  280,t 0
  272,line 23
  263,title WCSB
  282,title WCSU
  268,line 19
  276,t 0
  265,line 16
  307,t 1
  297,t 0
  262,line 13
  262,title WCSA
  0 {$}
  0,t 0
  281,title WCST
  299,title SLICE
  error,t 0
  258,line 8
  273,t 0
  304,t 1
  294,t 0
  261,title WCS
  279,title WCSR
  280,title WCSS
  269,t 0
  270,t 0
  298,title SCALELIMITS
  291,t 0
  301,t 1
  307,line 151
  266,t 0
  260,title DETECTOR
  259,title AMPLIFIER
  297,line 52
  278,title WCSQ
  307,title {}
  297,title SCALE
  287,t 0
  304,line 127
  294,line 49
  291,line 46
  error,title {}
  301,line 92
  263,t 0
  258,title PHYSICAL
  287,line 38
  277,title WCSP
  284,t 0
  306,title {}
  296,title FRAME
  284,line 35
  281,line 32
  260,t 0
  259,t 0
  281,t 0
  257,title IMAGE
  277,line 28
  276,title WCSO
  305,title {}
  295,title CROSSHAIR
  274,line 25
  271,line 22
  277,t 0
  267,line 18
  298,t 0
  275,title WCSN
  304,title {}
  294,title CROP
  264,line 15
  261,line 12
  274,t 0
  305,t 1
  295,t 0
  257,line 7
  274,title WCSM
  293,title COLORBAR
  303,title {}
  271,t 0
  error error
  292,t 0
  302,t 1
  273,title WCSL
  292,title BLOCK
  302,title {}
  267,t 0
  299,line 54
  288,t 0
  306,line 148
  296,line 51
  272,title WCSK
  303,line 126
  291,title BIN
  293,line 48
  301,title {}
  264,t 0
  285,t 0
  289,line 44
  290,line 45
  300,line 55
  286,line 37
  271,title WCSJ
  261,t 0
  283,line 34
  289,title 3D
  290,title AXES
  300,title SMOOTH
  282,t 0
  279,line 30
  280,line 31
  276,line 27
  257,t 0
  269,title WCSH
  270,title WCSI
  273,line 24
  288,title string
  278,t 0
  299,t 0
  269,line 20
  270,line 21
  266,line 17
  268,title WCSG
  275,t 0
  263,line 14
  287,title WCSZ
  306,t 1
  296,t 0
  260,line 10
  259,line 9
  272,t 0
  267,title WCSF
  303,t 1
  257 IMAGE_
  286,title WCSY
  293,t 0
  258 PHYSICAL_
  260 DETECTOR_
  259 AMPLIFIER_
  261 WCS_
  262 WCSA_
  263 WCSB_
  264 WCSC_
  265 WCSD_
  266 WCSE_
  267 WCSF_
  268,t 0
  268 WCSG_
  269 WCSH_
  270 WCSI_
  271 WCSJ_
  272 WCSK_
  289,t 0
  290,t 0
  300,t 0
  266,title WCSE
  273 WCSL_
  274 WCSM_
  285,title WCSX
  275 WCSN_
  276 WCSO_
  298,line 53
  277 WCSP_
  278 WCSQ_
  279 WCSR_
  280 WCSS_
  281 WCST_
  305,line 144
  282 WCSU_
  295,line 50
  265,t 0
  283 WCSV_
  284 WCSW_
  285 WCSX_
}

proc match::yyparse {} {
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
                    1 { set _ image }
                    2 { set _ physical }
                    3 { set _ amplifier }
                    4 { set _ detector }
                    5 { set _ wcs }
                    6 { set _ wcsa }
                    7 { set _ wcsb }
                    8 { set _ wcsc }
                    9 { set _ wcsd }
                    10 { set _ wcse }
                    11 { set _ wcsf }
                    12 { set _ wcsg }
                    13 { set _ wcsh }
                    14 { set _ wcsi }
                    15 { set _ wcsj }
                    16 { set _ wcsk }
                    17 { set _ wcsl }
                    18 { set _ wcsm }
                    19 { set _ wcsn }
                    20 { set _ wcso }
                    21 { set _ wcsp }
                    22 { set _ wcsq }
                    23 { set _ wcsr }
                    24 { set _ wcss }
                    25 { set _ wcst }
                    26 { set _ wcsu }
                    27 { set _ wcsv }
                    28 { set _ wcsw }
                    29 { set _ wcsx }
                    30 { set _ wcsy }
                    31 { set _ wcsz }
                    33 { global ds9; if {!$ds9(init)} {YYERROR} else {yyclearin; YYACCEPT} }
                    35 { MatchFrameCurrent $2 }
                    36 { MatchCrosshairCurrent $2 }
                    37 { MatchCropCurrent $2 }
                    38 { MatchCubeCurrent $2 }
                    39 { MatchBinCurrent }
                    40 { MatchAxesCurrent }
                    41 { MatchScaleCurrent }
                    42 { MatchScaleLimitsCurrent }
                    43 { MatchColorCurrent }
                    44 { MatchBlockCurrent }
                    45 { MatchSmoothCurrent }
                    46 { Match3DCurrent }
                    47 { set _ $1 }
                    48 { set _ $1 }
                    49 { set _ image }
                    50 { set _ $1 }
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

proc match::yyerror {msg} {
     variable yycnt
     variable yy_current_buffer
     variable index_

     ParserError $msg $yycnt $yy_current_buffer $index_
}

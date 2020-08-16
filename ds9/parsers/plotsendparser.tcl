package provide DS9 1.0

######
# Begin autogenerated taccle (version 1.3) routines.
# Although taccle itself is protected by the GNU Public License (GPL)
# all user-supplied functions are protected by their respective
# author's license.  See http://mini.net/tcl/taccle for other details.
######

namespace eval plotsend {
    variable yylval {}
    variable table
    variable rules
    variable token {}
    variable yycnt 0
    variable yyerr 0
    variable save_state 0

    namespace export yylex
}

proc plotsend::YYABORT {} {
    return -code return 1
}

proc plotsend::YYACCEPT {} {
    return -code return 0
}

proc plotsend::YYERROR {} {
    variable yyerr
    set yyerr 1
}

proc plotsend::yyclearin {} {
    variable token
    variable yycnt
    set token {}
    incr yycnt -1
}

proc plotsend::yyerror {s} {
    puts stderr $s
}

proc plotsend::setupvalues {stack pointer numsyms} {
    upvar 1 1 y
    set y {}
    for {set i 1} {$i <= $numsyms} {incr i} {
        upvar 1 $i y
        set y [lindex $stack $pointer]
        incr pointer
    }
}

proc plotsend::unsetupvalues {numsyms} {
    for {set i 1} {$i <= $numsyms} {incr i} {
        upvar 1 $i y
        unset y
    }
}

array set plotsend::table {
  70:301,target 63
  39:285,target 86
  1:304 shift
  27:0 reduce
  33:261,target 75
  48:0 reduce
  37:276,target 79
  0:306,target 25
  1:279,target 28
  24:319,target 67
  24:320,target 68
  69:0 reduce
  30:301 reduce
  29:301 reduce
  12:318 goto
  34:284,target 78
  13:269,target 6
  17:268 shift
  0:275,target 10
  6:0,target 28
  19:273,target 61
  87:0,target 68
  29:304 shift
  1:315 goto
  80:0,target 56
  79:0,target 58
  30:305 reduce
  29:305 reduce
  1:316 goto
  72:0,target 51
  30:296 reduce
  29:296 reduce
  17:273 shift
  64:0,target 76
  30:297 reduce
  29:297 reduce
  56:0,target 42
  24:0 reduce
  48:0,target 6
  41:0,target 39
  33:258,target 72
  45:0 reduce
  39:262,target 81
  37:274,target 79
  35:262 reduce
  25:0,target 27
  0:304,target 24
  0:294,target 19
  19:302,target 62
  35:286,target 80
  17:0,target 41
  66:0 reduce
  9:268,target 49
  10:0,target 12
  87:0 reduce
  0:273,target 9
  8:314,target 48
  21:0 reduce
  35:274 reduce
  17:302 shift
  42:0 reduce
  35:276 reduce
  0:292,target 17
  63:0 reduce
  35:284,target 80
  35:278 reduce
  33:296,target 77
  84:0 reduce
  28:260,target 60
  28:259,target 60
  0:271,target 8
  19:268,target 60
  35:284 reduce
  35:285 reduce
  17:313 goto
  39:278,target 84
  35:286 reduce
  17:0 reduce
  24:Y,target 35
  38:0 reduce
  1:304,target 31
  36:286,target 77
  60:0 reduce
  59:0 reduce
  0:289,target 16
  3:0,target 13
  84:0,target 64
  76:0,target 50
  81:0 reduce
  68:0,target 74
  61:0,target 35
  2:X shift
  53:0,target 3
  28:257,target 60
  0:268,target 5
  2:Y shift
  45:0,target 46
  37:0,target 79
  14:0 reduce
  39:276,target 83
  24:X shift
  28:297,target 60
  24:Y shift
  22:0,target 18
  35:0 reduce
  14:0,target 19
  36:284,target 77
  70:261,target 63
  56:0 reduce
  50:291,target 90
  0:287,target 15
  77:0 reduce
  30:260,target 61
  30:259,target 61
  29:260,target 62
  29:259,target 62
  0:257 shift
  9:0 reduce
  11:0 reduce
  0:263 shift
  39:274,target 82
  0:264 shift
  37:286,target 79
  32:0 reduce
  28:305,target 60
  0:265 shift
  2:Y,target 35
  53:0 reduce
  28:257 reduce
  0:268 shift
  70:258,target 63
  28:258 reduce
  0:270 shift
  0:269 shift
  28:260 reduce
  28:259 reduce
  24:y,target 37
  0:271 shift
  19:268 shift
  74:0 reduce
  28:261 reduce
  30:257,target 61
  29:257,target 62
  24:308,target 66
  0:273 shift
  0:275 shift
  6:0 reduce
  19:273 shift
  0:264,target 3
  8:267 shift
  30:297,target 61
  29:297,target 62
  8:268 shift
  0:280 shift
  2:x shift
  7:0,target 17
  13:298,target 21
  88:0,target 36
  37:284,target 79
  0:281 shift
  0:0,target 1
  2:y shift
  81:0,target 67
  37:262 reduce
  0:282 shift
  73:0,target 53
  49:0 reduce
  28:272 reduce
  0:283 shift
  11:300 shift
  65:0,target 81
  24:x shift
  57:0,target 5
  31:260,target 59
  31:259,target 59
  24:y shift
  71:0 reduce
  49:0,target 30
  28:272,target 60
  0:283,target 14
  11:300,target 50
  50:291 shift
  42:0,target 38
  0:287 shift
  34:0,target 78
  70:296,target 63
  26:0,target 0
  0:289 shift
  3:0 reduce
  18:0,target 16
  0:292 shift
  11:0,target 9
  30:305,target 61
  29:305,target 62
  0:303 shift
  0:293 shift
  1:316,target 33
  37:274 reduce
  25:0 reduce
  0:304 shift
  0:294 shift
  19:302 shift
  0:295 shift
  13:306,target 25
  37:276 reduce
  28:301,target 60
  0:306 shift
  46:0 reduce
  37:278 reduce
  0:298 shift
  0:299 shift
  0:309 goto
  0:310 goto
  67:0 reduce
  31:257,target 59
  28:301 reduce
  0:281,target 12
  2:y,target 37
  19:311 goto
  88:0 reduce
  37:284 reduce
  0:0 reduce
  4:306,target 43
  37:285 reduce
  31:297,target 59
  8:306 shift
  37:286 reduce
  28:305 reduce
  28:296 reduce
  28:297 reduce
  22:0 reduce
  13:294,target 19
  43:0 reduce
  0:299,target 22
  0:309,target 26
  0:310,target 27
  8:314 goto
  34:262 reduce
  30:272,target 61
  29:272,target 62
  12:290,target 51
  64:0 reduce
  13:273,target 9
  85:0 reduce
  39:286,target 87
  31:305,target 59
  85:0,target 65
  77:0,target 55
  0:257,target 1
  18:0 reduce
  69:0,target 75
  30:301,target 61
  29:301,target 62
  12:318,target 52
  62:0,target 33
  4:273,target 42
  54:0,target 43
  34:274 reduce
  46:0,target 47
  38:0,target 20
  34:276 reduce
  61:0 reduce
  1:281,target 29
  24:321,target 69
  34:278 reduce
  23:0,target 14
  34:285,target 78
  15:0,target 7
  82:0 reduce
  8:267,target 45
  13:268 shift
  39:284,target 85
  34:284 reduce
  13:269 shift
  18:270,target 58
  34:285 reduce
  15:0 reduce
  34:286 reduce
  13:273 shift
  36:0 reduce
  33:260,target 74
  33:259,target 73
  31:272,target 59
  31:257 reduce
  31:258 reduce
  0:295,target 20
  57:0 reduce
  31:260 reduce
  31:259 reduce
  70:257 reduce
  31:261 reduce
  70:258 reduce
  78:0 reduce
  70:260 reduce
  70:259 reduce
  13:268,target 5
  70:261 reduce
  31:301,target 59
  12:0 reduce
  34:262,target 78
  39:262 shift
  33:257,target 71
  31:272 reduce
  4:268,target 41
  54:0 reduce
  0:303,target 23
  0:293,target 18
  70:272 reduce
  35:285,target 80
  17:313,target 57
  33:297,target 78
  8:0,target 45
  13:294 shift
  90:0,target 10
  89:0,target 37
  75:0 reduce
  40:268 shift
  82:0,target 66
  13:306 shift
  74:0,target 54
  28:261,target 60
  66:0,target 82
  7:0 reduce
  13:298 shift
  58:0,target 15
  13:310 goto
  51:0,target 72
  39:274 shift
  43:0,target 40
  39:276 shift
  35:0,target 80
  27:0,target 2
  39:278 shift
  4:266,target 40
  19:0,target 32
  20:0,target 23
  51:0 reduce
  12:0,target 71
  31:301 reduce
  72:0 reduce
  33:305,target 80
  39:284 shift
  18:270 shift
  70:301 reduce
  39:285 shift
  34:278,target 78
  39:286 shift
  31:305 reduce
  28:258,target 60
  0:270,target 7
  0:269,target 6
  35:262,target 80
  31:296 reduce
  2:317 goto
  31:297 reduce
  70:305 reduce
  2:320 goto
  70:296 reduce
  26:0 accept
  70:297 reduce
  24:X,target 34
  18:277 shift
  47:0 reduce
  36:285,target 77
  36:262 reduce
  40:306 shift
  68:0 reduce
  30:261,target 61
  29:261,target 62
  40:306,target 89
  90:0 reduce
  89:0 reduce
  34:276,target 78
  33:272,target 76
  24:281,target 64
  23:0 reduce
  36:274 reduce
  28:296,target 60
  44:0 reduce
  36:276 reduce
  5:0,target 26
  86:0,target 69
  78:0,target 57
  70:260,target 63
  70:259,target 63
  36:278 reduce
  71:0,target 49
  65:0 reduce
  63:0,target 31
  35:278,target 80
  55:0,target 44
  33:301,target 79
  30:258,target 61
  29:258,target 62
  4:312,target 44
  86:0 reduce
  47:0,target 48
  36:262,target 77
  36:284 reduce
  34:274,target 78
  36:285 reduce
  32:0,target 11
  0:265,target 4
  36:286 reduce
  24:0,target 73
  4:266 shift
  16:0,target 24
  19:0 reduce
  20:0 reduce
  13:310,target 53
  37:285,target 79
  33:257 shift
  4:268 shift
  8:306,target 47
  41:0 reduce
  33:258 shift
  2:X,target 34
  33:260 shift
  33:259 shift
  1:288,target 30
  33:261 shift
  70:257,target 63
  62:0 reduce
  31:261,target 59
  4:273 shift
  24:x,target 36
  35:276,target 80
  83:0 reduce
  24:307,target 65
  70:297,target 63
  18:277,target 59
  0:263,target 2
  30:296,target 61
  29:296,target 62
  16:0 reduce
  17:273,target 55
  33:272 shift
  24:281 shift
  37:0 reduce
  19:311,target 63
  58:0 reduce
  36:278,target 77
  31:258,target 59
  37:262,target 79
  0:282,target 13
  80:0 reduce
  79:0 reduce
  35:274,target 80
  17:302,target 56
  70:305,target 63
  2:320,target 39
  9:0,target 29
  29:304,target 70
  1:315,target 32
  4:306 shift
  83:0,target 70
  75:0,target 52
  40:268,target 88
  34:0 reduce
  67:0,target 22
  24:307 shift
  60:0,target 34
  59:0,target 8
  30:257 reduce
  29:257 reduce
  24:308 shift
  55:0 reduce
  52:0,target 21
  33:301 shift
  30:258 reduce
  29:258 reduce
  4:312 goto
  44:0,target 4
  36:276,target 77
  30:260 reduce
  30:259 reduce
  29:260 reduce
  29:259 reduce
  36:0,target 77
  30:261 reduce
  29:261 reduce
  76:0 reduce
  0:280,target 11
  2:x,target 36
  33:305 shift
  21:0,target 25
  33:296 shift
  33:297 shift
  31:296,target 59
  2:317,target 38
  8:0 reduce
  9:268 shift
  10:0 reduce
  1:279 shift
  17:268,target 54
  24:319 goto
  24:320 goto
  1:281 shift
  24:321 goto
  70:272,target 63
  37:278,target 79
  30:272 reduce
  29:272 reduce
  0:298,target 21
  12:290 shift
  52:0 reduce
  36:274,target 77
  73:0 reduce
  34:286,target 78
  1:288 shift
  8:268,target 46
  5:0 reduce
}

array set plotsend::rules {
  9,l 309
  11,l 309
  32,l 311
  53,l 315
  74,l 319
  6,l 309
  28,l 310
  50,l 315
  49,l 315
  71,l 318
  3,l 309
  25,l 310
  46,l 314
  67,l 317
  0,l 322
  22,l 309
  43,l 313
  64,l 317
  18,l 309
  40,l 312
  39,l 312
  61,l 316
  82,l 321
  15,l 309
  36,l 312
  57,l 315
  78,l 320
  12,l 309
  33,l 311
  54,l 315
  75,l 319
  7,l 309
  29,l 310
  30,l 310
  51,l 315
  72,l 318
  4,l 309
  26,l 310
  47,l 314
  68,l 317
  1,l 309
  23,l 309
  44,l 313
  65,l 317
  19,l 309
  20,l 309
  41,l 313
  62,l 316
  16,l 309
  37,l 312
  58,l 315
  80,l 320
  79,l 320
  13,l 309
  34,l 311
  55,l 315
  76,l 319
  8,l 309
  10,l 309
  31,l 310
  52,l 315
  73,l 319
  5,l 309
  27,l 310
  48,l 314
  70,l 317
  69,l 317
  2,l 309
  24,l 309
  45,l 314
  66,l 317
  21,l 309
  42,l 313
  63,l 316
  17,l 309
  38,l 312
  60,l 316
  59,l 316
  81,l 321
  14,l 309
  35,l 311
  56,l 315
  77,l 320
}

array set plotsend::rules {
  63,dc 2
  12,dc 1
  77,dc 1
  26,dc 1
  3,dc 2
  41,dc 0
  55,dc 2
  70,dc 2
  69,dc 2
  18,dc 1
  33,dc 1
  9,dc 1
  47,dc 1
  62,dc 1
  11,dc 2
  76,dc 1
  25,dc 1
  2,dc 1
  40,dc 1
  39,dc 1
  54,dc 2
  68,dc 2
  17,dc 1
  32,dc 0
  8,dc 2
  46,dc 1
  61,dc 1
  10,dc 3
  75,dc 1
  24,dc 1
  1,dc 0
  38,dc 1
  53,dc 2
  67,dc 2
  16,dc 1
  82,dc 1
  31,dc 2
  7,dc 1
  45,dc 0
  60,dc 1
  59,dc 1
  74,dc 1
  23,dc 1
  0,dc 1
  37,dc 2
  52,dc 2
  66,dc 2
  15,dc 2
  81,dc 1
  29,dc 1
  30,dc 2
  6,dc 2
  44,dc 1
  58,dc 2
  73,dc 0
  22,dc 2
  36,dc 2
  51,dc 2
  65,dc 2
  14,dc 1
  80,dc 1
  79,dc 1
  28,dc 1
  5,dc 2
  43,dc 1
  57,dc 2
  72,dc 1
  21,dc 2
  35,dc 1
  50,dc 2
  49,dc 2
  64,dc 2
  13,dc 1
  78,dc 1
  27,dc 1
  4,dc 2
  42,dc 1
  56,dc 2
  71,dc 0
  19,dc 1
  20,dc 2
  34,dc 1
  48,dc 1
}

array set plotsend::rules {
  41,line 124
  7,line 76
  37,line 118
  4,line 69
  34,line 113
  1,line 66
  31,line 108
  27,line 104
  24,line 99
  80,line 180
  79,line 179
  21,line 94
  76,line 174
  17,line 90
  73,line 170
  14,line 85
  70,line 163
  69,line 162
  11,line 80
  66,line 159
  63,line 154
  60,line 151
  59,line 150
  56,line 145
  53,line 142
  50,line 138
  49,line 137
  46,line 131
  43,line 126
  9,line 78
  40,line 121
  39,line 120
  6,line 73
  36,line 117
  3,line 68
  33,line 112
  29,line 106
  30,line 107
  26,line 103
  82,line 184
  23,line 98
  78,line 178
  19,line 92
  20,line 93
  75,line 173
  16,line 89
  72,line 167
  13,line 82
  68,line 161
  10,line 79
  65,line 158
  62,line 153
  58,line 147
  55,line 144
  52,line 140
  48,line 133
  45,line 130
  42,line 125
  8,line 77
  38,line 119
  5,line 70
  35,line 114
  2,line 67
  32,line 111
  28,line 105
  25,line 102
  81,line 183
  22,line 97
  77,line 177
  18,line 91
  74,line 172
  15,line 87
  71,line 166
  12,line 81
  67,line 160
  64,line 157
  61,line 152
  57,line 146
  54,line 143
  51,line 139
  47,line 132
  44,line 127
}

array set plotsend::lr1_table {
  66,trans {}
  35 {{80 {262 274 276 278 284 285 286} 1}}
  85,trans {}
  14,trans {}
  36 {{77 {262 274 276 278 284 285 286} 1}}
  33,trans {{257 75} {258 76} {259 77} {260 78} {261 79} {272 80} {296 81} {297 82} {301 83} {305 84}}
  37 {{79 {262 274 276 278 284 285 286} 1}}
  52,trans {}
  38 {{20 0 2}}
  71,trans {}
  39 {{64 0 1} {65 0 1} {66 0 1} {67 0 1} {68 0 1} {69 0 1} {70 0 1}}
  40 {{36 0 1} {37 0 1}}
  90,trans {}
  89,trans {}
  18,trans {{270 58} {277 59}}
  1,trans {{279 28} {281 29} {288 30} {304 31} {315 32} {316 33}}
  41 {{39 0 1}}
  37,trans {}
  42 {{38 0 1}}
  56,trans {}
  43 {{40 0 1}}
  75,trans {}
  44 {{4 0 2}}
  94,trans {}
  23,trans {}
  45 {{46 0 1}}
  5,trans {}
  42,trans {}
  46 {{47 0 1}}
  61,trans {}
  47 {{48 0 1}}
  80,trans {}
  79,trans {}
  48 {{6 0 2}}
  27,trans {}
  50 {{10 0 2}}
  9,trans {{268 49}}
  49 {{30 0 2}}
  46,trans {}
  51 {{72 0 1}}
  65,trans {}
  52 {{21 0 2}}
  84,trans {}
  13,trans {{268 5} {269 6} {273 9} {294 19} {298 21} {306 25} {310 53}}
  53 {{3 0 2}}
  32,trans {}
  54 {{43 0 1}}
  51,trans {}
  55 {{44 0 1}}
  70,trans {}
  69,trans {}
  56 {{42 0 1}}
  88,trans {}
  17,trans {{268 54} {273 55} {302 56} {313 57}}
  57 {{5 0 2}}
  0,trans {{257 1} {263 2} {264 3} {265 4} {268 5} {269 6} {270 7} {271 8} {273 9} {275 10} {280 11} {281 12} {282 13} {283 14} {287 15} {289 16} {292 17} {293 18} {294 19} {295 20} {298 21} {299 22} {303 23} {304 24} {306 25} {309 26} {310 27}}
  36,trans {}
  58 {{15 0 2}}
  55,trans {}
  60 {{34 0 1}}
  59 {{8 0 2}}
  74,trans {}
  61 {{35 0 1}}
  93,trans {}
  22,trans {}
  62 {{33 0 1}}
  4,trans {{266 40} {268 41} {273 42} {306 43} {312 44}}
  41,trans {}
  63 {{31 0 2}}
  60,trans {}
  59,trans {}
  64 {{78 0 1}}
  78,trans {}
  65 {{80 0 1}}
  26,trans {}
  66 {{77 0 1}}
  8,trans {{267 45} {268 46} {306 47} {314 48}}
  45,trans {}
  67 {{79 0 1}}
  64,trans {}
  68 {{76 0 1}}
  83,trans {}
  70 {{82 0 1}}
  69 {{81 0 1}}
  12,trans {{290 51} {318 52}}
  31,trans {}
  71 {{22 0 2}}
  50,trans {{291 94}}
  49,trans {}
  72 {{74 0 1}}
  68,trans {}
  73 {{75 0 1}}
  87,trans {}
  74 {{63 {257 258 259 260 261 272 296 297 301 305} 2}}
  16,trans {}
  35,trans {}
  75 {{49 0 2}}
  54,trans {}
  76 {{51 0 2}}
  73,trans {}
  77 {{53 0 2}}
  92,trans {}
  78 {{54 0 2}}
  21,trans {}
  3,trans {}
  40,trans {{268 92} {306 93}}
  39,trans {{262 85} {274 86} {276 87} {278 88} {284 89} {285 90} {286 91}}
  80 {{50 0 2}}
  79 {{52 0 2}}
  58,trans {}
  81 {{55 0 2}}
  10 {{12 0 1}}
  77,trans {}
  82 {{57 0 2}}
  11 {{9 0 1} {10 0 1}}
  83 {{58 0 2}}
  25,trans {}
  7,trans {}
  12 {{21 0 1} {71 0 0} {72 0 0}}
  44,trans {}
  84 {{56 0 2}}
  13 {{3 0 1} {25 0 0} {26 0 0} {27 0 0} {28 0 0} {29 0 0} {30 0 0} {31 0 0}}
  63,trans {}
  85 {{67 0 2}}
  14 {{19 0 1}}
  82,trans {}
  86 {{66 0 2}}
  11,trans {{300 50}}
  15 {{7 0 1}}
  87 {{70 0 2}}
  30,trans {}
  29,trans {{304 74}}
  16 {{24 0 1}}
  48,trans {}
  88 {{64 0 2}}
  0 {{0 0 0} {1 0 0} {2 0 0} {3 0 0} {4 0 0} {5 0 0} {6 0 0} {7 0 0} {8 0 0} {9 0 0} {10 0 0} {11 0 0} {12 0 0} {13 0 0} {14 0 0} {15 0 0} {16 0 0} {17 0 0} {18 0 0} {19 0 0} {20 0 0} {21 0 0} {22 0 0} {23 0 0} {24 0 0} {25 0 0} {26 0 0} {27 0 0} {28 0 0} {29 0 0} {30 0 0} {31 0 0}}
  17 {{5 0 1} {41 0 0} {42 0 0} {43 0 0} {44 0 0}}
  67,trans {}
  90 {{69 0 2}}
  89 {{65 0 2}}
  1 {{11 0 1} {49 0 0} {50 0 0} {51 0 0} {52 0 0} {53 0 0} {54 0 0} {55 0 0} {56 0 0} {57 0 0} {58 0 0} {59 {257 258 259 260 261 272 296 297 301 305} 0} {60 {257 258 259 260 261 272 296 297 301 305} 0} {61 {257 258 259 260 261 272 296 297 301 305} 0} {62 {257 258 259 260 261 272 296 297 301 305} 0} {63 {257 258 259 260 261 272 296 297 301 305} 0}}
  18 {{8 0 1} {15 0 1} {16 0 1}}
  86,trans {}
  91 {{68 0 2}}
  15,trans {}
  2 {{20 0 1} {64 0 0} {65 0 0} {66 0 0} {67 0 0} {68 0 0} {69 0 0} {70 0 0} {77 {262 274 276 278 284 285 286} 0} {78 {262 274 276 278 284 285 286} 0} {79 {262 274 276 278 284 285 286} 0} {80 {262 274 276 278 284 285 286} 0}}
  19 {{31 0 1} {32 0 0} {33 0 0} {34 0 0} {35 0 0}}
  20 {{23 0 1}}
  92 {{36 0 2}}
  34,trans {}
  3 {{13 0 1}}
  21 {{25 0 1}}
  53,trans {}
  93 {{37 0 2}}
  4 {{4 0 1} {36 0 0} {37 0 0} {38 0 0} {39 0 0} {40 0 0}}
  22 {{18 0 1}}
  72,trans {}
  94 {{10 0 3}}
  5 {{26 0 1}}
  23 {{14 0 1}}
  91,trans {}
  20,trans {}
  19,trans {{268 60} {273 61} {302 62} {311 63}}
  6 {{28 0 1}}
  24 {{22 0 1} {73 0 0} {74 0 0} {75 0 0} {76 0 0} {77 0 0} {78 0 0} {79 0 0} {80 0 0} {81 0 0} {82 0 0}}
  2,trans {{X 34} {Y 35} {x 36} {y 37} {317 38} {320 39}}
  38,trans {}
  7 {{17 0 1}}
  25 {{27 0 1}}
  57,trans {}
  8 {{6 0 1} {45 0 0} {46 0 0} {47 0 0} {48 0 0}}
  26 {{0 0 1}}
  76,trans {}
  9 {{29 0 1} {30 0 1}}
  27 {{2 0 1}}
  24,trans {{X 64} {Y 65} {x 66} {y 67} {281 68} {307 69} {308 70} {319 71} {320 72} {321 73}}
  6,trans {}
  28 {{60 {257 258 259 260 261 272 296 297 301 305} 1}}
  43,trans {}
  29 {{62 {257 258 259 260 261 272 296 297 301 305} 1} {63 {257 258 259 260 261 272 296 297 301 305} 1}}
  30 {{61 {257 258 259 260 261 272 296 297 301 305} 1}}
  62,trans {}
  31 {{59 {257 258 259 260 261 272 296 297 301 305} 1}}
  81,trans {}
  10,trans {}
  32 {{11 0 2}}
  28,trans {}
  33 {{49 0 1} {50 0 1} {51 0 1} {52 0 1} {53 0 1} {54 0 1} {55 0 1} {56 0 1} {57 0 1} {58 0 1}}
  47,trans {}
  34 {{78 {262 274 276 278 284 285 286} 1}}
}

array set plotsend::token_id_table {
  286 MIN_
  286,t 0
  287 MODE_
  292,line 45
  302,line 55
  288 NUMBERS_
  317,t 1
  265,title BAR
  289 NAME_
  290 POSITION_
  300 STRIP_
  284,title LOG
  291 SCALE_
  301 STYLE_
  313,title {}
  292 SCATTER_
  302 SYMBOL_
  288,line 41
  293 SELECT_
  303 THEME_
  294 SHAPE_
  304 TITLE_
  305 WEIGHT_
  295 SHOW_
  306 WIDTH_
  296 SIZE_
  307 XAXIS_
  262,t 0
  297 SLANT_
  308 YAXIS_
  285,line 38
  298 SMOOTH_
  310 line
  309 plotsend
  299 STATISTICS_
  311 lineshape
  283,t 0
  312 bar
  313 scatter
  314,t 1
  314 errorr
  282,line 35
  315 fontt
  316 fontType
  264,title BACKGROUND
  317 axis
  283,title LIST
  318 legend
  312,title {}
  320 xy
  319 title
  278,line 31
  321 xyaxis
  error,line 64
  322 start'
  258,t 0
  275,line 28
  279,t 0
  280,t 0
  311,t 1
  272,line 25
  263,title AXIS
  282,title LINE
  311,title {}
  268,line 21
  276,t 0
  Y,t 0
  265,line 18
  307,t 0
  297,t 0
  262,line 15
  0,t 0
  0 {$}
  262,title AUTO
  281,title LEGEND
  310,title {}
  309,title {}
  error,t 0
  299,title STATISTICS
  258,line 8
  273,t 0
  294,t 0
  304,t 0
  321,line 182
  317,line 156
  261,title FONTWEIGHT
  279,title LABELS
  280,title LAYOUT
  308,title YAXIS
  269,t 0
  270,t 0
  298,title SMOOTH
  314,line 129
  291,t 0
  301,t 0
  322,t 1
  y,t 0
  311,line 110
  307,line 60
  266,t 0
  260,title FONTSTYLE
  259,title FONTSLANT
  297,line 50
  278,title GRID
  307,title XAXIS
  297,title SLANT
  287,t 0
  294,line 47
  304,line 57
  318,t 1
  X X
  error,title {}
  291,line 44
  301,line 54
  Y Y
  263,t 0
  258,title FONTSIZE
  287,line 40
  277,title GRAPH
  284,t 0
  306,title WIDTH
  296,title SIZE
  315,t 1
  284,line 37
  281,line 34
  260,t 0
  259,t 0
  281,t 0
  257,title FONT
  277,line 30
  276,title FORMAT
  312,t 1
  305,title WEIGHT
  295,title SHOW
  274,line 27
  Y,line 179
  271,line 24
  x x
  277,t 0
  y y
  308,t 0
  267,line 20
  298,t 0
  275,title FOREGROUND
  294,title SHAPE
  304,title TITLE
  264,line 17
  261,line 11
  274,t 0
  305,t 0
  295,t 0
  257,line 7
  274,title FLIP
  293,title SELECT
  303,title THEME
  322,title {}
  320,line 176
  319,line 169
  error error
  271,t 0
  y,line 178
  292,t 0
  302,t 0
  316,line 149
  273,title FILL
  313,line 123
  292,title SCATTER
  302,title SYMBOL
  321,title {}
  267,t 0
  310,line 101
  309,line 65
  299,line 52
  288,t 0
  320,t 1
  319,t 1
  306,line 59
  296,line 49
  272,title FAMILY
  291,title SCALE
  293,line 46
  301,title STYLE
  303,line 56
  320,title {}
  319,title {}
  264,t 0
  Y,title {}
  285,t 0
  289,line 42
  290,line 43
  300,line 53
  316,t 1
  286,line 39
  271,title ERROR
  261,t 0
  283,line 36
  289,title NAME
  290,title POSITION
  300,title STRIP
  318,title {}
  282,t 0
  X,title {}
  279,line 32
  280,line 33
  313,t 1
  276,line 29
  257,t 0
  269,title DASH
  270,title DATASET
  273,line 26
  288,title NUMBERS
  317,title {}
  278,t 0
  X,line 177
  310,t 1
  309,t 1
  299,t 0
  269,line 22
  270,line 23
  y,title {}
  266,line 19
  268,title COLOR
  275,t 0
  263,line 16
  287,title MODE
  X,t 0
  316,title {}
  306,t 0
  296,t 0
  260,line 10
  259,line 9
  x,title {}
  322,line 185
  272,t 0
  267,title CAP
  257 FONT_
  286,title MIN
  293,t 0
  303,t 0
  315,title {}
  258 FONTSIZE_
  318,line 165
  260 FONTSTYLE_
  259 FONTSLANT_
  261 FONTWEIGHT_
  262 AUTO_
  263 AXIS_
  x,line 176
  264 BACKGROUND_
  315,line 135
  265 BAR_
  266 BORDER_
  267 CAP_
  268,t 0
  268 COLOR_
  269 DASH_
  270 DATASET_
  312,line 116
  271 ERROR_
  272 FAMILY_
  289,t 0
  290,t 0
  300,t 0
  266,title BORDER
  273 FILL_
  274 FLIP_
  285,title MAX
  321,t 1
  314,title {}
  275 FOREGROUND_
  308,line 61
  276 FORMAT_
  298,line 51
  x,t 0
  277 GRAPH_
  278 GRID_
  279 LABELS_
  280 LAYOUT_
  281 LEGEND_
  305,line 58
  282 LINE_
  295,line 48
  265,t 0
  283 LIST_
  284 LOG_
  285 MAX_
}

proc plotsend::yyparse {} {
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
                    1 { ProcessSendCmdGet iap plots }
                    7 { ProcessSendCmdCVARGet mode }
                    8 { ProcessSendCmdCVARGet graph,current }
                    9 { ProcessSendCmdCVARGet layout }
                    10 { ProcessSendCmdCVARGet layout,strip,scale }
                    12 { ProcessSendCmdCVARGet graph,foreground }
                    13 { ProcessSendCmdCVARGet graph,background }
                    14 { ProcessSendCmdCVARGetYesNo theme }
                    15 { ProcessSendCmdCVARGet graph,ds,current }
                    16 { ProcessSendCmdCVARGet graph,ds,current }
                    17 { ProcessSendCmdCVARGet graph,ds,current }
                    18 { ProcessSendCmdCVAR PlotStatsGenerate }
                    19 { ProcessSendCmdCVAR PlotListGenerate }
                    23 { ProcessSendCmdCVARGetYesNo graph,ds,show }
                    24 { ProcessSendCmdCVARGet graph,ds,name }
                    25 { ProcessSendCmdCVARGet graph,ds,line,smooth }
                    26 { ProcessSendCmdCVARGet graph,ds,line,color }
                    27 { ProcessSendCmdCVARGet graph,ds,line,width }
                    28 { ProcessSendCmdCVARGetYesNo graph,ds,line,dash }
                    29 { ProcessSendCmdCVARGetYesNo graph,ds,line,fill }
                    30 { ProcessSendCmdCVARGet graph,ds,line,fill,color }
                    32 { ProcessSendCmdCVARGet graph,ds,line,shape,symbol }
                    33 { ProcessSendCmdCVARGet graph,ds,line,shape,symbol }
                    34 { ProcessSendCmdCVARGet graph,ds,line,shape,color }
                    35 { ProcessSendCmdCVARGetYesNo graph,ds,line,shape,fill }
                    36 { ProcessSendCmdCVARGet graph,ds,bar,border,color }
                    37 { ProcessSendCmdCVARGet graph,ds,bar,border,width }
                    38 { ProcessSendCmdCVARGetYesNo graph,ds,bar,fill }
                    39 { ProcessSendCmdCVARGet graph,ds,bar,color }
                    40 { ProcessSendCmdCVARGet graph,ds,bar,width }
                    41 { ProcessSendCmdCVARGet graph,ds,scatter,symbol }
                    42 { ProcessSendCmdCVARGet graph,ds,scatter,symbol }
                    43 { ProcessSendCmdCVARGet graph,ds,scatter,color }
                    44 { ProcessSendCmdCVARGetYesNo graph,ds,scatter,fill }
                    45 { ProcessSendCmdCVARGetYesNo graph,ds,error }
                    46 { ProcessSendCmdCVARGetYesNo graph,ds,error,cap }
                    47 { ProcessSendCmdCVARGet graph,ds,error,color }
                    48 { ProcessSendCmdCVARGet graph,ds,error,width }
                    49 { ProcessSendCmdCVARGet "$1,family" }
                    50 { ProcessSendCmdCVARGet "$1,family" }
                    51 { ProcessSendCmdCVARGet "$1,size" }
                    52 { ProcessSendCmdCVARGet "$1,weight" }
                    53 { ProcessSendCmdCVARGet "$1,slant" }
                    54 { ProcessSendCmdCVARGet "$1,weight" }
                    55 { ProcessSendCmdCVARGet "$1,size" }
                    56 { ProcessSendCmdCVARGet "$1,weight" }
                    57 { ProcessSendCmdCVARGet "$1,slant" }
                    58 { ProcessSendCmdCVARGet "$1,weight" }
                    59 { set _ graph,title }
                    60 { set _ graph,axis,title }
                    61 { set _ graph,axis,font }
                    62 { set _ graph,legend,font }
                    63 { set _ graph,legend,title }
                    64 { ProcessSendCmdCVARGetYesNo "graph,axis,$1,grid" }
                    65 { ProcessSendCmdCVARGetYesNo "graph,axis,$1,log" }
                    66 { ProcessSendCmdCVARGetYesNo "graph,axis,$1,flip" }
                    67 { ProcessSendCmdCVARGetYesNo "graph,axis,$1,auto" }
                    68 { ProcessSendCmdCVARGet "graph,axis,$1,min" }
                    69 { ProcessSendCmdCVARGet "graph,axis,$1,max" }
                    70 { ProcessSendCmdCVARGet "graph,axis,$1,format" }
                    71 { ProcessSendCmdCVARGetYesNo graph,legend }
                    72 { ProcessSendCmdCVARGet graph,legend,position }
                    73 { ProcessSendCmdCVARGet graph,title }
                    74 { ProcessSendCmdCVARGet "graph,axis,$1,title" }
                    75 { ProcessSendCmdCVARGet "graph,axis,$1,title" }
                    76 { ProcessSendCmdCVARGet graph,legend,title }
                    77 { set _ x }
                    78 { set _ x }
                    79 { set _ y }
                    80 { set _ y }
                    81 { set _ x }
                    82 { set _ y }
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

proc plotsend::yyerror {msg} {
     variable yycnt
     variable yy_current_buffer
     variable index_

     ParserError $msg $yycnt $yy_current_buffer $index_
}

package provide DS9 1.0

######
# Begin autogenerated taccle (version 1.3) routines.
# Although taccle itself is protected by the GNU Public License (GPL)
# all user-supplied functions are protected by their respective
# author's license.  See http://mini.net/tcl/taccle for other details.
######

namespace eval lock {
    variable yylval {}
    variable table
    variable rules
    variable token {}
    variable yycnt 0
    variable yyerr 0
    variable save_state 0

    namespace export yylex
}

proc lock::YYABORT {} {
    return -code return 1
}

proc lock::YYACCEPT {} {
    return -code return 0
}

proc lock::YYERROR {} {
    variable yyerr
    set yyerr 1
}

proc lock::yyclearin {} {
    variable token
    variable yycnt
    set token {}
    incr yycnt -1
}

proc lock::yyerror {s} {
    puts stderr $s
}

proc lock::setupvalues {stack pointer numsyms} {
    upvar 1 1 y
    set y {}
    for {set i 1} {$i <= $numsyms} {incr i} {
        upvar 1 $i y
        set y [lindex $stack $pointer]
        incr pointer
    }
}

proc lock::unsetupvalues {numsyms} {
    for {set i 1} {$i <= $numsyms} {incr i} {
        upvar 1 $i y
        unset y
    }
}

array set lock::table {
  31:294,target 31
  21:294 reduce
  48:0 reduce
  9:294 reduce
  0:275,target 19
  42:271,target 15
  64:0,target 49
  37:305,target 42
  37:295,target 32
  38:278,target 22
  33:0,target 32
  39:262,target 6
  32:294,target 32
  21:0 reduce
  0:302,target 39
  63:0 reduce
  42:287,target 31
  56:294 reduce
  38:305,target 42
  38:295,target 32
  26:294 reduce
  39:278,target 22
  37:269,target 13
  37:270,target 14
  33:294,target 32
  61:0,target 43
  29:0,target 29
  30:0,target 30
  35:0 reduce
  42:314,target 68
  39:305,target 42
  39:295,target 32
  9:0 reduce
  0:266,target 10
  42:262,target 6
  37:286,target 30
  62:294 reduce
  32:288 shift
  38:269,target 13
  38:270,target 14
  32:290 shift
  32:289 shift
  32:291 shift
  34:294,target 32
  32:292 shift
  32:293 shift
  32:294 reduce
  37:257 shift
  32:310 goto
  37:258 shift
  37:259 shift
  37:260 shift
  37:261 shift
  37:262 shift
  37:263 shift
  49:0 reduce
  50:0 reduce
  37:264 shift
  37:265 shift
  57:0,target 46
  0:283,target 27
  37:266 shift
  37:267 shift
  37:268 shift
  42:278,target 22
  26:0,target 26
  37:269 shift
  37:270 shift
  37:313,target 60
  37:271 shift
  37:272 shift
  37:273 shift
  38:286,target 30
  37:274 shift
  37:275 shift
  39:269,target 13
  39:270,target 14
  37:276 shift
  35:294,target 32
  37:277 shift
  37:278 shift
  37:279 shift
  37:280 shift
  37:281 shift
  37:261,target 5
  37:282 shift
  37:283 shift
  37:284 shift
  37:285 shift
  37:286 shift
  37:287 shift
  67:294 reduce
  22:0 reduce
  37:300 shift
  37:301 shift
  0:299,target 36
  0:309,target 46
  37:302 shift
  37:303 shift
  37:304 shift
  64:0 reduce
  37:305 shift
  37:295 shift
  37:296 shift
  37:306 shift
  37:297 shift
  37:307 shift
  37:298 shift
  37:308 goto
  38:313,target 61
  37:299 shift
  37:309 goto
  39:286,target 30
  0:257,target 1
  37:313 goto
  36:294,target 32
  54:0,target 38
  37:277,target 21
  38:261,target 5
  23:0,target 23
  36:0 reduce
  39:313,target 62
  0:274,target 18
  43:288 shift
  42:269,target 13
  42:270,target 14
  43:290 shift
  43:289 shift
  43:291 shift
  37:304,target 41
  43:292 shift
  43:293 shift
  38:277,target 21
  43:294 reduce
  39:261,target 5
  13:294 reduce
  8:0,target 8
  43:310 goto
  32:293,target 54
  2:294 reduce
  51:0,target 34
  20:0,target 20
  19:0,target 19
  51:0 reduce
  0:301,target 38
  42:286,target 30
  38:304,target 41
  39:277,target 21
  37:268,target 12
  33:293,target 54
  48:294 reduce
  23:0 reduce
  18:294 reduce
  5:0,target 5
  48:312 goto
  65:0 reduce
  7:294 reduce
  39:304,target 41
  40:294,target 32
  47:0,target 0
  0:265,target 9
  16:0,target 16
  42:261,target 5
  37:285,target 29
  38:268,target 12
  34:293,target 54
  0:282,target 26
  41:294,target 32
  54:294 reduce
  42:277,target 21
  24:294 reduce
  2:0,target 2
  38:285,target 29
  39:268,target 12
  35:293,target 54
  44:0,target 56
  37:259,target 3
  37:260,target 4
  13:0,target 13
  10:0 reduce
  0:298,target 35
  0:308,target 45
  52:0 reduce
  42:294,target 57
  39:285,target 29
  36:293,target 54
  37:276,target 20
  60:294 reduce
  59:294 reduce
  38:259,target 3
  38:260,target 4
  29:294 reduce
  30:294 reduce
  24:0 reduce
  41:0,target 32
  43:294,target 32
  66:0 reduce
  10:0,target 10
  0:273,target 17
  42:268,target 12
  37:303,target 40
  38:276,target 20
  39:259,target 3
  39:260,target 4
  32:292,target 53
  65:294 reduce
  35:288 shift
  44:294,target 56
  35:290 shift
  35:289 shift
  35:291 shift
  35:292 shift
  0:300,target 37
  35:293 shift
  35:294 reduce
  42:285,target 29
  68:0,target 45
  35:310 goto
  38:303,target 40
  39:276,target 20
  37:267,target 11
  0:257 shift
  33:292,target 53
  0:258 shift
  0:259 shift
  0:260 shift
  0:261 shift
  11:0 reduce
  0:262 shift
  0:263 shift
  45:294,target 54
  0:264 shift
  0:265 shift
  0:266 shift
  0:267 shift
  0:268 shift
  53:0 reduce
  0:270 shift
  0:269 shift
  0:271 shift
  0:272 shift
  0:273 shift
  0:274 shift
  39:303,target 40
  40:293,target 54
  0:275 shift
  0:276 shift
  0:264,target 8
  41:288 shift
  0:277 shift
  41:290 shift
  41:289 shift
  0:278 shift
  41:291 shift
  0:280 shift
  0:279 shift
  41:292 shift
  0:281 shift
  37:284,target 28
  41:293 shift
  0:282 shift
  41:294 reduce
  0:283 shift
  38:267,target 11
  65:0,target 58
  0:284 shift
  0:285 shift
  34:292,target 53
  0:286 shift
  11:294 reduce
  0:287 shift
  41:310 goto
  34:0,target 32
  0:300 shift
  0:301 shift
  46:294,target 55
  0:302 shift
  0:303 shift
  0:304 shift
  25:0 reduce
  0:305 shift
  0:295 shift
  0:296 shift
  0:306 shift
  0:297 shift
  0:307 shift
  0:298 shift
  0:308 goto
  0:299 shift
  0:309 goto
  67:0 reduce
  0:311 goto
  0:281,target 25
  41:293,target 54
  0:313 goto
  42:276,target 20
  38:284,target 28
  39:267,target 11
  35:292,target 53
  32:310,target 55
  37:258,target 2
  46:294 reduce
  62:0,target 42
  40:0 reduce
  0:297,target 34
  0:307,target 44
  16:294 reduce
  31:0,target 31
  5:294 reduce
  39:284,target 28
  36:292,target 53
  37:275,target 19
  33:310,target 56
  38:258,target 2
  48:294,target 40
  12:0 reduce
  43:293,target 54
  54:0 reduce
  0:272,target 16
  52:294 reduce
  58:0,target 51
  42:267,target 11
  37:302,target 39
  22:294 reduce
  27:0,target 27
  38:275,target 19
  34:310,target 57
  39:258,target 2
  49:294,target 33
  50:294,target 36
  32:291,target 52
  26:0 reduce
  68:0 reduce
  42:284,target 28
  1:0 reduce
  38:302,target 39
  39:275,target 19
  35:310,target 58
  51:294,target 34
  37:266,target 10
  57:294 reduce
  33:291,target 52
  55:0,target 53
  27:294 reduce
  24:0,target 24
  41:0 reduce
  39:302,target 39
  40:292,target 53
  0:263,target 7
  36:310,target 59
  52:294,target 37
  37:283,target 27
  38:266,target 10
  48:312,target 70
  34:291,target 52
  13:0 reduce
  9:0,target 9
  63:294 reduce
  33:288 shift
  33:290 shift
  33:289 shift
  33:291 shift
  52:0,target 37
  55:0 reduce
  33:292 shift
  33:293 shift
  0:280,target 24
  0:279,target 23
  33:294 reduce
  41:292,target 53
  21:0,target 21
  42:275,target 19
  37:299,target 36
  37:309,target 46
  38:257 shift
  33:310 goto
  38:258 shift
  53:294,target 35
  38:259 shift
  38:260 shift
  38:283,target 27
  38:261 shift
  38:262 shift
  39:266,target 10
  38:263 shift
  35:291,target 52
  38:264 shift
  38:265 shift
  38:266 shift
  38:267 shift
  37:257,target 1
  38:268 shift
  38:269 shift
  38:270 shift
  38:271 shift
  38:272 shift
  38:273 shift
  38:274 shift
  27:0 reduce
  38:275 shift
  38:276 shift
  38:277 shift
  0:296,target 33
  0:306,target 43
  38:278 shift
  38:279 shift
  38:280 shift
  38:281 shift
  69:0 reduce
  38:282 shift
  38:283 shift
  6:0,target 6
  38:284 shift
  2:0 reduce
  38:299,target 36
  38:309,target 46
  38:285 shift
  38:286 shift
  54:294,target 38
  38:287 shift
  39:283,target 27
  68:294 reduce
  38:300 shift
  38:301 shift
  48:0,target 39
  36:291,target 52
  38:302 shift
  38:303 shift
  37:274,target 18
  38:304 shift
  17:0,target 17
  38:305 shift
  38:295 shift
  38:296 shift
  38:306 shift
  38:257,target 1
  38:297 shift
  38:307 shift
  38:298 shift
  38:308 goto
  38:299 shift
  38:309 goto
  38:313 goto
  42:0 reduce
  43:292,target 53
  10:294,target 10
  39:299,target 36
  39:309,target 46
  40:310,target 63
  55:294,target 53
  0:271,target 15
  42:266,target 10
  37:301,target 38
  38:274,target 18
  39:257,target 1
  3:0,target 3
  32:290,target 51
  32:289,target 50
  45:0,target 54
  14:0 reduce
  44:294 reduce
  14:0,target 14
  56:0 reduce
  14:294 reduce
  11:294,target 11
  0:287,target 31
  41:310,target 64
  56:294,target 47
  42:283,target 27
  3:294 reduce
  38:301,target 38
  39:274,target 18
  37:265,target 9
  33:290,target 51
  33:289,target 50
  28:0 reduce
  12:294,target 12
  42:309,target 67
  57:294,target 46
  71:0 reduce
  42:0,target 57
  3:0 reduce
  39:301,target 38
  40:291,target 52
  49:294 reduce
  50:294 reduce
  11:0,target 11
  0:262,target 6
  42:257,target 65
  20:294 reduce
  19:294 reduce
  37:282,target 26
  38:265,target 9
  34:290,target 51
  34:289,target 50
  8:294 reduce
  13:294,target 13
  43:310,target 69
  58:294,target 51
  43:0 reduce
  0:278,target 22
  41:291,target 52
  42:274,target 18
  37:298,target 35
  37:308,target 45
  69:0,target 52
  38:282,target 26
  39:265,target 9
  35:290,target 51
  35:289,target 50
  55:294 reduce
  15:0 reduce
  25:294 reduce
  14:294,target 14
  60:294,target 44
  59:294,target 50
  0:305,target 42
  0:295,target 32
  57:0 reduce
  38:298,target 35
  38:308,target 45
  39:282,target 26
  36:290,target 51
  36:289,target 50
  37:273,target 17
  66:0,target 60
  15:294,target 15
  61:294,target 43
  29:0 reduce
  30:0 reduce
  35:0,target 32
  61:294 reduce
  43:291,target 52
  39:298,target 35
  39:308,target 45
  31:294 reduce
  4:0 reduce
  0:270,target 14
  0:269,target 13
  42:265,target 9
  37:300,target 37
  38:273,target 17
  16:294,target 16
  62:294,target 42
  32:288,target 49
  44:0 reduce
  0:286,target 30
  63:0,target 48
  42:282,target 26
  32:0,target 32
  38:300,target 37
  66:294 reduce
  36:288 shift
  39:273,target 17
  36:290 shift
  36:289 shift
  36:291 shift
  36:292 shift
  36:293 shift
  36:294 reduce
  37:264,target 8
  17:294,target 17
  63:294,target 48
  33:288,target 49
  42:257 shift
  36:310 goto
  16:0 reduce
  42:261 shift
  42:262 shift
  42:263 shift
  0:313,target 48
  42:264 shift
  42:265 shift
  42:266 shift
  58:0 reduce
  42:267 shift
  42:268 shift
  42:269 shift
  42:270 shift
  42:271 shift
  42:272 shift
  39:300,target 37
  40:290,target 51
  40:289,target 50
  42:273 shift
  42:274 shift
  0:261,target 5
  42:275 shift
  42:276 shift
  42:277 shift
  42:278 shift
  37:281,target 25
  42:279 shift
  42:280 shift
  60:0,target 44
  59:0,target 50
  42:281 shift
  38:264,target 8
  42:282 shift
  18:294,target 18
  42:283 shift
  64:294,target 49
  34:288,target 49
  42:284 shift
  28:0,target 28
  42:285 shift
  42:286 shift
  42:287 shift
  31:0 reduce
  42:294 reduce
  42:307 shift
  12:294 reduce
  42:309 goto
  0:277,target 21
  41:290,target 51
  41:289,target 50
  5:0 reduce
  42:273,target 17
  42:314 goto
  37:297,target 34
  37:307,target 44
  1:294 reduce
  38:281,target 25
  39:264,target 8
  20:294,target 20
  19:294,target 19
  65:294,target 58
  35:288,target 49
  56:0,target 47
  45:0 reduce
  0:304,target 41
  25:0,target 25
  38:297,target 34
  38:307,target 44
  39:281,target 25
  21:294,target 21
  66:294,target 60
  36:288,target 49
  17:294 reduce
  37:272,target 16
  6:294 reduce
  17:0 reduce
  1:294,target 1
  43:290,target 51
  43:289,target 50
  60:0 reduce
  59:0 reduce
  39:297,target 34
  39:307,target 44
  0:268,target 12
  53:0,target 35
  42:264,target 8
  22:294,target 22
  67:294,target 59
  22:0,target 22
  38:272,target 16
  53:294 reduce
  23:294 reduce
  2:294,target 2
  32:0 reduce
  0:285,target 29
  42:281,target 25
  6:0 reduce
  23:294,target 23
  68:294,target 45
  7:0,target 7
  39:272,target 16
  37:263,target 7
  49:0,target 33
  50:0,target 36
  18:0,target 18
  3:294,target 3
  46:0 reduce
  42:307,target 66
  58:294 reduce
  24:294,target 24
  70:294,target 71
  69:294,target 52
  28:294 reduce
  40:288,target 49
  0:259,target 3
  0:260,target 4
  37:279,target 23
  37:280,target 24
  38:263,target 7
  4:294,target 4
  4:0,target 4
  18:0 reduce
  46:0,target 55
  61:0 reduce
  15:0,target 15
  25:294,target 25
  0:276,target 20
  41:288,target 49
  42:272,target 16
  37:296,target 33
  37:306,target 43
  38:279,target 23
  38:280,target 24
  64:294 reduce
  34:288 shift
  34:290 shift
  34:289 shift
  39:263,target 7
  34:291 shift
  34:292 shift
  34:293 shift
  34:294 reduce
  5:294,target 5
  39:257 shift
  34:310 goto
  39:258 shift
  39:259 shift
  39:260 shift
  39:261 shift
  33:0 reduce
  39:262 shift
  39:263 shift
  39:264 shift
  0:303,target 40
  39:265 shift
  26:294,target 26
  39:266 shift
  39:267 shift
  1:0,target 1
  39:268 shift
  39:269 shift
  39:270 shift
  39:271 shift
  7:0 reduce
  38:296,target 33
  38:306,target 43
  39:272 shift
  39:273 shift
  39:274 shift
  39:279,target 23
  39:280,target 24
  39:275 shift
  43:0,target 32
  39:276 shift
  39:277 shift
  39:278 shift
  12:0,target 12
  39:279 shift
  39:280 shift
  37:271,target 15
  39:281 shift
  6:294,target 6
  39:282 shift
  39:283 shift
  39:284 shift
  39:285 shift
  39:286 shift
  39:287 shift
  70:294 shift
  69:294 reduce
  40:288 shift
  39:300 shift
  40:290 shift
  40:289 shift
  39:301 shift
  40:291 shift
  39:302 shift
  40:292 shift
  39:303 shift
  40:293 shift
  27:294,target 27
  39:304 shift
  40:294 reduce
  47:0 accept
  39:305 shift
  39:295 shift
  43:288,target 49
  39:296 shift
  39:306 shift
  39:297 shift
  39:307 shift
  39:298 shift
  39:308 goto
  10:294 reduce
  39:296,target 33
  39:299 shift
  39:306,target 43
  39:309 goto
  40:310 goto
  0:267,target 11
  39:313 goto
  42:263,target 7
  37:287,target 31
  38:271,target 15
  7:294,target 7
  71:0,target 41
  40:0,target 32
  20:0 reduce
  19:0 reduce
  28:294,target 28
  62:0 reduce
  0:284,target 28
  42:279,target 23
  42:280,target 24
  38:287,target 31
  45:294 reduce
  39:271,target 15
  8:294,target 8
  15:294 reduce
  37:262,target 6
  4:294 reduce
  29:294,target 29
  30:294,target 30
  34:0 reduce
  67:0,target 59
  0:311,target 47
  36:0,target 32
  8:0 reduce
  39:287,target 31
  0:258,target 2
  9:294,target 9
  37:278,target 22
  38:262,target 6
  51:294 reduce
}

array set lock::rules {
  9,l 309
  11,l 309
  32,l 310
  53,l 313
  6,l 309
  28,l 309
  50,l 313
  49,l 313
  3,l 308
  25,l 309
  46,l 313
  0,l 315
  22,l 309
  43,l 313
  18,l 309
  40,l 312
  39,l 311
  15,l 309
  36,l 310
  57,l 314
  12,l 309
  33,l 310
  54,l 313
  7,l 309
  29,l 309
  30,l 309
  51,l 313
  4,l 308
  26,l 309
  47,l 313
  1,l 308
  23,l 309
  44,l 313
  19,l 309
  20,l 309
  41,l 311
  16,l 309
  37,l 310
  58,l 314
  13,l 309
  34,l 310
  55,l 313
  8,l 309
  10,l 309
  31,l 309
  52,l 313
  5,l 309
  27,l 309
  48,l 313
  2,l 308
  24,l 309
  45,l 313
  21,l 309
  42,l 313
  17,l 309
  38,l 310
  60,l 314
  59,l 314
  14,l 309
  35,l 310
  56,l 313
}

array set lock::rules {
  12,dc 1
  26,dc 1
  3,dc 1
  41,dc 3
  55,dc 1
  18,dc 1
  33,dc 1
  9,dc 1
  47,dc 2
  11,dc 1
  25,dc 1
  2,dc 1
  40,dc 0
  39,dc 1
  54,dc 1
  17,dc 1
  32,dc 0
  8,dc 1
  46,dc 2
  10,dc 1
  24,dc 1
  1,dc 1
  38,dc 1
  53,dc 2
  16,dc 1
  31,dc 1
  7,dc 1
  45,dc 2
  60,dc 1
  59,dc 1
  23,dc 1
  0,dc 1
  37,dc 1
  52,dc 2
  15,dc 1
  29,dc 1
  30,dc 1
  6,dc 1
  44,dc 2
  58,dc 1
  22,dc 1
  36,dc 1
  51,dc 2
  14,dc 1
  28,dc 1
  5,dc 1
  43,dc 2
  57,dc 0
  21,dc 1
  35,dc 1
  50,dc 2
  49,dc 2
  13,dc 1
  27,dc 1
  4,dc 1
  42,dc 2
  56,dc 1
  19,dc 1
  20,dc 1
  34,dc 1
  48,dc 2
}

array set lock::rules {
  41,line 153
  7,line 117
  37,line 148
  4,line 113
  34,line 145
  1,line 110
  31,line 141
  27,line 137
  24,line 134
  21,line 131
  17,line 127
  14,line 124
  11,line 121
  40,e 1
  60,line 178
  59,line 177
  56,line 172
  53,line 167
  50,line 164
  49,line 163
  46,line 160
  43,line 157
  9,line 119
  40,line 152
  39,line 152
  6,line 116
  36,line 147
  3,line 112
  33,line 144
  29,line 139
  30,line 140
  26,line 136
  23,line 133
  19,line 129
  20,line 130
  16,line 126
  13,line 123
  10,line 120
  58,line 176
  55,line 171
  52,line 166
  48,line 162
  45,line 159
  42,line 156
  8,line 118
  38,line 149
  5,line 115
  35,line 146
  2,line 111
  32,line 143
  28,line 138
  25,line 135
  22,line 132
  18,line 128
  15,line 125
  12,line 122
  57,line 175
  54,line 170
  51,line 165
  47,line 161
  44,line 158
}

array set lock::lr1_table {
  66,trans {}
  35 {{51 {0 294} 1} {32 {0 294} 0} {33 {0 294} 0} {34 {0 294} 0} {35 {0 294} 0} {36 {0 294} 0} {37 {0 294} 0} {38 {0 294} 0}}
  14,trans {}
  36 {{50 {0 294} 1} {32 {0 294} 0} {33 {0 294} 0} {34 {0 294} 0} {35 {0 294} 0} {36 {0 294} 0} {37 {0 294} 0} {38 {0 294} 0}}
  33,trans {{288 49} {289 50} {290 51} {291 52} {292 53} {293 54} {310 56}}
  37 {{44 {0 294} 1} {42 {0 294} 0} {43 {0 294} 0} {44 {0 294} 0} {45 {0 294} 0} {46 {0 294} 0} {47 {0 294} 0} {48 {0 294} 0} {49 {0 294} 0} {50 {0 294} 0} {51 {0 294} 0} {52 {0 294} 0} {53 {0 294} 0} {54 {0 294} 0} {55 {0 294} 0} {56 {0 294} 0} {1 {0 294} 0} {2 {0 294} 0} {3 {0 294} 0} {4 {0 294} 0} {5 {0 294} 0} {6 {0 294} 0} {7 {0 294} 0} {8 {0 294} 0} {9 {0 294} 0} {10 {0 294} 0} {11 {0 294} 0} {12 {0 294} 0} {13 {0 294} 0} {14 {0 294} 0} {15 {0 294} 0} {16 {0 294} 0} {17 {0 294} 0} {18 {0 294} 0} {19 {0 294} 0} {20 {0 294} 0} {21 {0 294} 0} {22 {0 294} 0} {23 {0 294} 0} {24 {0 294} 0} {25 {0 294} 0} {26 {0 294} 0} {27 {0 294} 0} {28 {0 294} 0} {29 {0 294} 0} {30 {0 294} 0} {31 {0 294} 0}}
  52,trans {}
  38 {{43 {0 294} 1} {42 {0 294} 0} {43 {0 294} 0} {44 {0 294} 0} {45 {0 294} 0} {46 {0 294} 0} {47 {0 294} 0} {48 {0 294} 0} {49 {0 294} 0} {50 {0 294} 0} {51 {0 294} 0} {52 {0 294} 0} {53 {0 294} 0} {54 {0 294} 0} {55 {0 294} 0} {56 {0 294} 0} {1 {0 294} 0} {2 {0 294} 0} {3 {0 294} 0} {4 {0 294} 0} {5 {0 294} 0} {6 {0 294} 0} {7 {0 294} 0} {8 {0 294} 0} {9 {0 294} 0} {10 {0 294} 0} {11 {0 294} 0} {12 {0 294} 0} {13 {0 294} 0} {14 {0 294} 0} {15 {0 294} 0} {16 {0 294} 0} {17 {0 294} 0} {18 {0 294} 0} {19 {0 294} 0} {20 {0 294} 0} {21 {0 294} 0} {22 {0 294} 0} {23 {0 294} 0} {24 {0 294} 0} {25 {0 294} 0} {26 {0 294} 0} {27 {0 294} 0} {28 {0 294} 0} {29 {0 294} 0} {30 {0 294} 0} {31 {0 294} 0}}
  71,trans {}
  39 {{42 {0 294} 1} {42 {0 294} 0} {43 {0 294} 0} {44 {0 294} 0} {45 {0 294} 0} {46 {0 294} 0} {47 {0 294} 0} {48 {0 294} 0} {49 {0 294} 0} {50 {0 294} 0} {51 {0 294} 0} {52 {0 294} 0} {53 {0 294} 0} {54 {0 294} 0} {55 {0 294} 0} {56 {0 294} 0} {1 {0 294} 0} {2 {0 294} 0} {3 {0 294} 0} {4 {0 294} 0} {5 {0 294} 0} {6 {0 294} 0} {7 {0 294} 0} {8 {0 294} 0} {9 {0 294} 0} {10 {0 294} 0} {11 {0 294} 0} {12 {0 294} 0} {13 {0 294} 0} {14 {0 294} 0} {15 {0 294} 0} {16 {0 294} 0} {17 {0 294} 0} {18 {0 294} 0} {19 {0 294} 0} {20 {0 294} 0} {21 {0 294} 0} {22 {0 294} 0} {23 {0 294} 0} {24 {0 294} 0} {25 {0 294} 0} {26 {0 294} 0} {27 {0 294} 0} {28 {0 294} 0} {29 {0 294} 0} {30 {0 294} 0} {31 {0 294} 0}}
  40 {{48 {0 294} 1} {32 {0 294} 0} {33 {0 294} 0} {34 {0 294} 0} {35 {0 294} 0} {36 {0 294} 0} {37 {0 294} 0} {38 {0 294} 0}}
  18,trans {}
  1,trans {}
  41 {{49 {0 294} 1} {32 {0 294} 0} {33 {0 294} 0} {34 {0 294} 0} {35 {0 294} 0} {36 {0 294} 0} {37 {0 294} 0} {38 {0 294} 0}}
  37,trans {{257 1} {258 2} {259 3} {260 4} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {295 32} {296 33} {297 34} {298 35} {299 36} {300 37} {301 38} {302 39} {303 40} {304 41} {305 42} {306 43} {307 44} {308 45} {309 46} {313 60}}
  42 {{45 {0 294} 1} {57 {0 294} 0} {58 {0 294} 0} {59 {0 294} 0} {60 {0 294} 0} {5 {0 294} 0} {6 {0 294} 0} {7 {0 294} 0} {8 {0 294} 0} {9 {0 294} 0} {10 {0 294} 0} {11 {0 294} 0} {12 {0 294} 0} {13 {0 294} 0} {14 {0 294} 0} {15 {0 294} 0} {16 {0 294} 0} {17 {0 294} 0} {18 {0 294} 0} {19 {0 294} 0} {20 {0 294} 0} {21 {0 294} 0} {22 {0 294} 0} {23 {0 294} 0} {24 {0 294} 0} {25 {0 294} 0} {26 {0 294} 0} {27 {0 294} 0} {28 {0 294} 0} {29 {0 294} 0} {30 {0 294} 0} {31 {0 294} 0}}
  56,trans {}
  43 {{52 {0 294} 1} {32 {0 294} 0} {33 {0 294} 0} {34 {0 294} 0} {35 {0 294} 0} {36 {0 294} 0} {37 {0 294} 0} {38 {0 294} 0}}
  44 {{56 {0 294} 1}}
  23,trans {}
  5,trans {}
  45 {{54 {0 294} 1}}
  42,trans {{257 65} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {307 66} {309 67} {314 68}}
  46 {{55 {0 294} 1}}
  61,trans {}
  47 {{0 0 1}}
  48 {{39 0 1} {41 0 1} {40 294 0}}
  50 {{36 {0 294} 1}}
  49 {{33 {0 294} 1}}
  27,trans {}
  9,trans {}
  46,trans {}
  51 {{34 {0 294} 1}}
  65,trans {}
  52 {{37 {0 294} 1}}
  53 {{35 {0 294} 1}}
  13,trans {}
  32,trans {{288 49} {289 50} {290 51} {291 52} {292 53} {293 54} {310 55}}
  54 {{38 {0 294} 1}}
  51,trans {}
  55 {{53 {0 294} 2}}
  70,trans {{294 71}}
  69,trans {}
  56 {{47 {0 294} 2}}
  57 {{46 {0 294} 2}}
  17,trans {}
  0,trans {{257 1} {258 2} {259 3} {260 4} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {295 32} {296 33} {297 34} {298 35} {299 36} {300 37} {301 38} {302 39} {303 40} {304 41} {305 42} {306 43} {307 44} {308 45} {309 46} {311 47} {313 48}}
  36,trans {{288 49} {289 50} {290 51} {291 52} {292 53} {293 54} {310 59}}
  58 {{51 {0 294} 2}}
  55,trans {}
  60 {{44 {0 294} 2}}
  59 {{50 {0 294} 2}}
  61 {{43 {0 294} 2}}
  62 {{42 {0 294} 2}}
  22,trans {}
  4,trans {}
  41,trans {{288 49} {289 50} {290 51} {291 52} {292 53} {293 54} {310 64}}
  63 {{48 {0 294} 2}}
  60,trans {}
  59,trans {}
  64 {{49 {0 294} 2}}
  65 {{58 {0 294} 1}}
  66 {{60 {0 294} 1}}
  26,trans {}
  8,trans {}
  45,trans {}
  67 {{59 {0 294} 1}}
  64,trans {}
  68 {{45 {0 294} 2}}
  70 {{41 0 2}}
  69 {{52 {0 294} 2}}
  12,trans {}
  71 {{41 0 3}}
  31,trans {}
  50,trans {}
  49,trans {}
  68,trans {}
  16,trans {}
  35,trans {{288 49} {289 50} {290 51} {291 52} {292 53} {293 54} {310 58}}
  54,trans {}
  21,trans {}
  3,trans {}
  40,trans {{288 49} {289 50} {290 51} {291 52} {292 53} {293 54} {310 63}}
  39,trans {{257 1} {258 2} {259 3} {260 4} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {295 32} {296 33} {297 34} {298 35} {299 36} {300 37} {301 38} {302 39} {303 40} {304 41} {305 42} {306 43} {307 44} {308 45} {309 46} {313 62}}
  58,trans {}
  10 {{10 {0 294} 1}}
  11 {{11 {0 294} 1}}
  25,trans {}
  7,trans {}
  12 {{12 {0 294} 1}}
  44,trans {}
  13 {{13 {0 294} 1}}
  63,trans {}
  14 {{14 {0 294} 1}}
  11,trans {}
  15 {{15 {0 294} 1}}
  30,trans {}
  29,trans {}
  16 {{16 {0 294} 1}}
  48,trans {{312 70}}
  0 {{0 0 0} {39 0 0} {41 0 0} {42 {0 294} 0} {43 {0 294} 0} {44 {0 294} 0} {45 {0 294} 0} {46 {0 294} 0} {47 {0 294} 0} {48 {0 294} 0} {49 {0 294} 0} {50 {0 294} 0} {51 {0 294} 0} {52 {0 294} 0} {53 {0 294} 0} {54 {0 294} 0} {55 {0 294} 0} {56 {0 294} 0} {1 {0 294} 0} {2 {0 294} 0} {3 {0 294} 0} {4 {0 294} 0} {5 {0 294} 0} {6 {0 294} 0} {7 {0 294} 0} {8 {0 294} 0} {9 {0 294} 0} {10 {0 294} 0} {11 {0 294} 0} {12 {0 294} 0} {13 {0 294} 0} {14 {0 294} 0} {15 {0 294} 0} {16 {0 294} 0} {17 {0 294} 0} {18 {0 294} 0} {19 {0 294} 0} {20 {0 294} 0} {21 {0 294} 0} {22 {0 294} 0} {23 {0 294} 0} {24 {0 294} 0} {25 {0 294} 0} {26 {0 294} 0} {27 {0 294} 0} {28 {0 294} 0} {29 {0 294} 0} {30 {0 294} 0} {31 {0 294} 0}}
  17 {{17 {0 294} 1}}
  67,trans {}
  1 {{1 {0 294} 1}}
  18 {{18 {0 294} 1}}
  15,trans {}
  2 {{2 {0 294} 1}}
  19 {{19 {0 294} 1}}
  20 {{20 {0 294} 1}}
  34,trans {{288 49} {289 50} {290 51} {291 52} {292 53} {293 54} {310 57}}
  3 {{3 {0 294} 1}}
  21 {{21 {0 294} 1}}
  53,trans {}
  4 {{4 {0 294} 1}}
  22 {{22 {0 294} 1}}
  5 {{5 {0 294} 1}}
  23 {{23 {0 294} 1}}
  20,trans {}
  19,trans {}
  2,trans {}
  6 {{6 {0 294} 1}}
  24 {{24 {0 294} 1}}
  38,trans {{257 1} {258 2} {259 3} {260 4} {261 5} {262 6} {263 7} {264 8} {265 9} {266 10} {267 11} {268 12} {269 13} {270 14} {271 15} {272 16} {273 17} {274 18} {275 19} {276 20} {277 21} {278 22} {279 23} {280 24} {281 25} {282 26} {283 27} {284 28} {285 29} {286 30} {287 31} {295 32} {296 33} {297 34} {298 35} {299 36} {300 37} {301 38} {302 39} {303 40} {304 41} {305 42} {306 43} {307 44} {308 45} {309 46} {313 61}}
  7 {{7 {0 294} 1}}
  25 {{25 {0 294} 1}}
  57,trans {}
  8 {{8 {0 294} 1}}
  26 {{26 {0 294} 1}}
  9 {{9 {0 294} 1}}
  27 {{27 {0 294} 1}}
  24,trans {}
  6,trans {}
  28 {{28 {0 294} 1}}
  43,trans {{288 49} {289 50} {290 51} {291 52} {292 53} {293 54} {310 69}}
  29 {{29 {0 294} 1}}
  30 {{30 {0 294} 1}}
  62,trans {}
  31 {{31 {0 294} 1}}
  10,trans {}
  32 {{53 {0 294} 1} {32 {0 294} 0} {33 {0 294} 0} {34 {0 294} 0} {35 {0 294} 0} {36 {0 294} 0} {37 {0 294} 0} {38 {0 294} 0}}
  28,trans {}
  33 {{47 {0 294} 1} {32 {0 294} 0} {33 {0 294} 0} {34 {0 294} 0} {35 {0 294} 0} {36 {0 294} 0} {37 {0 294} 0} {38 {0 294} 0}}
  47,trans {}
  34 {{46 {0 294} 1} {32 {0 294} 0} {33 {0 294} 0} {34 {0 294} 0} {35 {0 294} 0} {36 {0 294} 0} {37 {0 294} 0} {38 {0 294} 0}}
}

array set lock::token_id_table {
  286 WCSY_
  286,t 0
  287 WCSZ_
  292,line 44
  302,line 58
  288 YES_
  265,title WCSD
  289 NO_
  290 ON_
  300 CROP_
  284,title WCSW
  291 OFF_
  301 CROSSHAIR_
  313,title {}
  292 TRUE_
  302 FRAME_
  288,line 40
  293 FALSE_
  303 SCALE_
  294 STRING_
  304 SCALELIMITS_
  305 SLICE_
  295 3D_
  306 SMOOTH_
  296 AXES_
  307 NONE_
  262,t 0
  297 BIN_
  308 coordsys
  285,line 36
  298 BLOCK_
  310 yesno
  309 wcssys
  299 COLORBAR_
  311 command
  283,t 0
  312 @PSEUDO1
  313 lock
  314,t 1
  314 lockslice
  282,line 33
  315 start'
  264,title WCSC
  283,title WCSV
  312,title {}
  278,line 29
  error,line 108
  258,t 0
  275,line 26
  279,t 0
  280,t 0
  311,t 1
  272,line 23
  263,title WCSB
  282,title WCSU
  311,title {}
  268,line 19
  276,t 0
  265,line 16
  307,t 0
  297,t 0
  262,line 13
  0,t 0
  0 {$}
  262,title WCSA
  281,title WCST
  310,title {}
  309,title {}
  error,t 0
  299,title COLORBAR
  258,line 8
  273,t 0
  294,t 0
  304,t 0
  261,title WCS
  279,title WCSR
  280,title WCSS
  308,title {}
  269,t 0
  270,t 0
  298,title BLOCK
  314,line 174
  291,t 0
  301,t 0
  311,line 151
  307,line 64
  266,t 0
  260,title DETECTOR
  259,title AMPLIFIER
  297,line 53
  278,title WCSQ
  307,title NONE
  297,title BIN
  287,t 0
  294,line 47
  304,line 60
  error,title {}
  291,line 43
  301,line 57
  263,t 0
  258,title PHYSICAL
  287,line 38
  277,title WCSP
  284,t 0
  306,title SMOOTH
  296,title AXES
  315,t 1
  284,line 35
  281,line 32
  260,t 0
  259,t 0
  281,t 0
  257,title IMAGE
  277,line 28
  276,title WCSO
  312,t 1
  305,title SLICE
  295,title 3D
  274,line 25
  271,line 22
  277,t 0
  308,t 1
  267,line 18
  298,t 0
  275,title WCSN
  294,title string
  304,title SCALELIMITS
  264,line 15
  261,line 12
  274,t 0
  305,t 0
  295,t 0
  257,line 7
  274,title WCSM
  293,title FALSE
  303,title SCALE
  error error
  271,t 0
  292,t 0
  302,t 0
  273,title WCSL
  313,line 169
  292,title TRUE
  302,title FRAME
  267,t 0
  310,line 142
  309,line 114
  299,line 55
  288,t 0
  306,line 62
  296,line 52
  272,title WCSK
  291,title OFF
  293,line 45
  301,title CROSSHAIR
  303,line 59
  264,t 0
  285,t 0
  289,line 41
  290,line 42
  300,line 56
  286,line 37
  271,title WCSJ
  261,t 0
  283,line 34
  289,title NO
  290,title ON
  300,title CROP
  282,t 0
  279,line 30
  280,line 31
  313,t 1
  276,line 27
  257,t 0
  269,title WCSH
  270,title WCSI
  273,line 24
  288,title YES
  278,t 0
  310,t 1
  309,t 1
  299,t 0
  269,line 20
  270,line 21
  266,line 17
  268,title WCSG
  275,t 0
  263,line 14
  287,title WCSZ
  306,t 0
  296,t 0
  260,line 10
  259,line 9
  272,t 0
  267,title WCSF
  257 IMAGE_
  286,title WCSY
  293,t 0
  303,t 0
  315,title {}
  258 PHYSICAL_
  260 DETECTOR_
  259 AMPLIFIER_
  261 WCS_
  262 WCSA_
  263 WCSB_
  264 WCSC_
  315,line 179
  265 WCSD_
  266 WCSE_
  267 WCSF_
  268,t 0
  268 WCSG_
  269 WCSH_
  270 WCSI_
  312,line 152
  271 WCSJ_
  272 WCSK_
  289,t 0
  290,t 0
  300,t 0
  266,title WCSE
  273 WCSL_
  274 WCSM_
  285,title WCSX
  314,title {}
  275 WCSN_
  308,line 109
  276 WCSO_
  298,line 54
  277 WCSP_
  278 WCSQ_
  279 WCSR_
  280 WCSS_
  281 WCST_
  305,line 61
  282 WCSU_
  295,line 51
  265,t 0
  283 WCSV_
  284 WCSW_
  285 WCSX_
}

proc lock::yyparse {} {
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
                    32 { set _ 1 }
                    33 { set _ 1 }
                    34 { set _ 1 }
                    35 { set _ 1 }
                    36 { set _ 0 }
                    37 { set _ 0 }
                    38 { set _ 0 }
                    40 { global ds9; if {!$ds9(init)} {YYERROR} else {yyclearin; YYACCEPT} }
                    42 { ProcessCmdSet panzoom lock $2 LockFrameCurrent }
                    43 { ProcessCmdSet crosshair lock $2 LockCrosshairCurrent }
                    44 { ProcessCmdSet crop lock $2 LockCropCurrent }
                    45 { ProcessCmdSet cube lock $2 LockCubeCurrent }
                    46 { ProcessCmdSet bin lock $2 LockBinCurrent }
                    47 { ProcessCmdSet cube lock,axes $2 LockAxesCurrent }
                    48 { ProcessCmdSet scale lock $2 LockScaleCurrent }
                    49 { ProcessCmdSet scale lock,limits $2 LockScaleLimitsCurrent }
                    50 { ProcessCmdSet colorbar lock $2 LockColorCurrent }
                    51 { ProcessCmdSet block lock $2 LockBlockCurrent }
                    52 { ProcessCmdSet smooth lock $2 LockSmoothCurrent }
                    53 { ProcessCmdSet threed lock $2 Lock3DCurrent }
                    54 { set _ $1 }
                    55 { set _ $1 }
                    56 { set _ none }
                    57 { set _ image }
                    58 { set _ image }
                    59 { set _ $1 }
                    60 { set _ none }
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

proc lock::yyerror {msg} {
     variable yycnt
     variable yy_current_buffer
     variable index_

     ParserError $msg $yycnt $yy_current_buffer $index_
}
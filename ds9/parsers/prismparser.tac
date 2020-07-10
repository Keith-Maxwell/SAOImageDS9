%{
%}
#include def.tin

#include numeric.tin
#include string.tin

%start command

%token CLEAR_
%token CLOSE_
%token CURRENT_
%token EXTENSION_
%token HISTOGRAM_
%token IMAGE_
%token LOAD_
%token OPEN_
%token PLOT_

%token LINE_
%token BAR_
%token SCATTER_

%token NEW_
%token OVER_

%%

#include numeric.trl

command : prism
 | prism {global ds9; if {!$ds9(init)} {YYERROR} else {yyclearin; YYACCEPT}} STRING_
 ;

prism : {PrismDialog prism}
 | OPEN_ {PrismDialog prism}
 | STRING_ {PrismCmdLoad $1}
 | LOAD_ STRING_ {PrismCmdLoad $2}
 | CLOSE_ {ProcessCmdCVAR0 PrismDestroy}
 | CLEAR_ {ProcessCmdCVAR0 PrismClear}
 | EXTENSION_ ext
 | IMAGE_ image
 | PLOT_ plot
 | HISTOGRAM_
 | CURRENT_ STRING_ {PrismCmdRef $2}
 ;

ext : INT_ {PrismCmdExt $1}
 | STRING_ {PrismCmdExtName $1}
 ;

image : {ProcessCmdCVAR0 PrismCmdImage}
 | ext STRING_ STRING_ {ProcessCmdCVAR2 xx $2 yy $3; ProcessCmdCVAR0 PrismCmdImage}
 ;

histogram : STRING_ {ProcessCmdCVAR3 col $1 num 20 plot,mode newplot}
 | STRING_ INT_ {ProcessCmdCVAR3 col $1 num $2 plot,mode newplot}
 | STRING_ INT_ mode {ProcessCmdCVAR3 col $1 num $2 plot,mode $3}
 ;

plot : STRING_ STRING_ {ProcessCmdCVAR6 xx $1 yy $2 xerr {} yerr {} plot,type scatter plot,mode newplot PrismPlotGenerate}
 | STRING_ STRING_ type mode {ProcessCmdCVAR6 xx $1 yy $2 xerr {} yerr {} plot,type $3 plot,mode $4 PrismPlotGenerate}
 | STRING_ STRING_ STRING_ STRING_ {ProcessCmdCVAR6 xx $1 yy $2 xerr $3 yerr $4 plot,type scatter plot,mode newplot PrismPlotGenerate}
 | STRING_ STRING_ STRING_ STRING_ type mode {ProcessCmdCVAR6 xx $1 yy $2 xerr $3 yerr $4 plot,type $5 plot,mode $6 PrismPlotGenerate}
 ;

type : LINE_ {set _ line}
 | BAR_ {set _ bar}
 | SCATTER_ {set _ scatter}
 ;

mode : NEW_ {set _ newplot}
 | OVER_ {set _ overplot}
 ;
 
%%

proc prism::yyerror {msg} {
     variable yycnt
     variable yy_current_buffer
     variable index_

     ParserError $msg $yycnt $yy_current_buffer $index_
}

package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L = [a-zA-Z_.\-~/áéíóúÁÉÍÓÚÃ,#Ññ,\”$%&#@\|\(\) ]+
html=[H|h][T|t][M|m][L|l][" "]*[L|l][A|a][N|n][G|g][" "]*[=][" "]*[\"|\“|\'][" "]*[a-z|A-Z][a-z|A-Z][" "]*[\"|\”|\']
ATimg = [s|S][r|R][C|c]|[A|a][L|l][T|t]|[W|w][I|i][D|d][T|t][H|h]|[H|h][E|e][I|i][G|g][H|h][T|t]
ATlist = [T|t][y|y][P|p][E|e]|[V|v][A|a][L|l][U|u][E|e]
ATa = [H|h][R|r][E|e][F|f]|[T|t][A|a][R|r][G|g][E|e][T|t]
ATg = [I|i][D|d]|[C|c][L|l][A|a][S|s][S|s]
proto = [H|h][T|t][T|t][P|p]|[H|h][T|t][T|t][P|p][S|s]|[F|f][T|t][P|p]|[F|f][T|t][P|p][S|s]
seccion = [s|S][E|e][c|C][T|t][i|I][O|o][n|N]
tabla= [t|T][A|a][b|B][l|L][e|E]
Titu= [h|H]
lista = [o|O][L|l]
listad = [u|U][L|l]
itemlista = [l|L][I|i]
href = [H|h][R|r][E|e][F|f]
target = [T|t][A|a][R|r][G|g][E|e][T|t]
cap = [C|c][a|A][p|P][t|T][i|I][o|O][n|N]
cabeza = [t|T][h|H][e|E][a|A][d|D]
pie = [T|t][F|f][O|o][O|o][T|t]
cuerpo = [t|T][B|b][O|o][D|d][Y|y]
celda = [t|T][d|D]
columna = [t|T][h|H]
fila = [t|T][r|R]
Parrafo = p | P
Documento = [H|h][T|t][M|m][L|l]
DocHTML = [D|d][O|o][C|c][T|t][Y|y][P|p][E|e][" "][H|h][T|t][M|m][L|l]
Meta = [m|M][e|E][t|T][a|A]
name= [N|n][A|a][M|m][E|e]
charset= [C|c][H|h][A|a][R|r][S|s][e|E][t|T][" "]*[=]
utf=[" "]*[\"|\“|\'][" "]*[U|u][T|t][F|f][" "]*[-][" "]*[8][" "]*[\"|\”|\']
Head = [H|h][E|e][A|a][D|d]
Title = [T|t][I|i][T|t][L|l][E|e]
Body = [B|b][O|o][D|d][Y|y]
Strong = [S|s][T|t][R|r][O|o][N|n][G|g]
Div = [D|d][I|i][V|v]
hr = [H|h][R|r]
br = [B|b][R|r]
em = [E|e][M|m]
mark = [M|m][A|a][R|r][K|k]
img= [I|i][M|m][G|g]
tableC= [T|t][A|a][B|b][L|l][E|e][" "]*[B|b][O|o][R|r][D|d][E|e][R|r][" "]*[=][" "]*[\"|\“|\'][" "]*[1][" "]*[\"|\”|\'][" "]*
in= [<|\<][" "]* 
inf="</"[" "]* 
fn= [" "]*[>]
src=[S|s][R|r][C|c]
width=[W|w][I|i][D|d][T|t][H|h]
height=[H|h][E|e][I|i][G|g][H|h][T|t]
target =[T|t][A|a][R|r][G|g][E|e][T|t]
late=[T|t][Y|y][P|p][E|e]
value=[V|v][A|a][L|l][U|u][E|e]
fndos = [" "]*[/]?[>]
id = [I|i][D|d]
class = [C|c][L|l][A|a][S|s][S|s]
cierreF= [" "]*[/][>]
D=[0-9]+
espacio=[ , \t,\r,\n,]+
alt=[A|a][L|l][T|t]
EtiqA= [a|A]
ATabla= [R|r][U|u][L|l][E|e][S|s][" "]*[=][" "]*[\"|\“|\']{L}[" "]*[\"|\”|\'][" "]*
Especiales = [\", ¡, !, ¿, ?, \-, +, ', *, :, ;, , \t,\r,\n,]+
Content=[C|c][O|o][N|n][T|t][E|e][N|n][T|t]
Comillas=[\"|\”|\“|\']
%{
    public String lexeme;
%}
%%

{Especiales} {/*Ignore*/}
{espacio}    {/*Ignore*/}
"//".* {/*ignore*/}
{in}{img}{espacio}*                                                             { lexeme=yytext(); return Imagen;} 
{in}{Meta}{espacio}*{charset}{utf}{fndos}                                       { lexeme=yytext(); lexeme=yytext(); return AperturaLibreriaHTML; } 
{in}{Meta}{espacio}*{name}{espacio}*"="{espacio}*{Comillas}{espacio}*{L}{espacio}*{Comillas}{fndos} { lexeme=yytext(); return AperturaMetaName; }
{in}{Meta}{espacio}*{name}{espacio}*"="{espacio}*{Comillas}{espacio}*{L}{espacio}*{Comillas}{espacio}*{Content}"="{espacio}*{Comillas}{espacio}*{L}{espacio}*{Comillas}{fndos}  { lexeme=yytext(); return AperturaMetaNameConAtributo; }
{in}"!"{DocHTML}{fn}                                                            { lexeme=yytext(); return InicioDocumento; }
{inf}{Documento}{fn}                                                            { lexeme=yytext(); return CierreDeDocumento; }
{in}{Parrafo}{fn}                                                               { lexeme=yytext(); return InicioDeParrafo; }
{in}{Parrafo}{espacio}*                                                         { lexeme=yytext(); return InicioDeParrafoConAtributo; }
{inf}{Parrafo}{fn}                                                              { lexeme=yytext(); return FinDeParrafo; }
{in}{Head}{fn}                                                                  { lexeme=yytext(); return AperturaHead; }
{in}{Head}{espacio}*                                                            { lexeme=yytext(); return AperturaHeadConAtributo; }
{inf}{Head}{fn}                                                                 { lexeme=yytext(); return CierreHead; }
{in}{Title}{fn}                                                                 { lexeme=yytext(); return AperturaTitle; }
{in}{Title}{espacio}*                                                           { lexeme=yytext(); return AperturaTitleConAtributo; }
{inf}{Title}{fn}                                                                { lexeme=yytext(); return CierreTitulo; }
{in}{Body}{fn}                                                                  { lexeme=yytext(); return AperturaBody; }
{in}{Body}{espacio}*                                                            { lexeme=yytext(); return AperturaBodyConAtributo; }
{inf}{Body}{fn}                                                                 { lexeme=yytext(); return CierreBody; }
{in}{Strong}{fn}                                                                { lexeme=yytext(); return InicioMarcadoConEnfasis;}
{in}{Strong}{espacio}*                                                          { lexeme=yytext(); return InicioMarcadoConEnfasisConAtributo;}
{inf}{Strong}{fn}                                                               { lexeme=yytext(); return FinMarcadoConEnfasis;}
{in}{Div}{fn}                                                                   { lexeme=yytext(); return AperturaDivision;}
{in}{Div}{espacio}*                                                             { lexeme=yytext(); return AperturaDivisionConAtributo;}
{inf}{Div}{fn}                                                                  { lexeme=yytext(); return CierreDivision; }
{in}{hr}{fn}                                                                    { lexeme=yytext(); return UnaLineaHorizontal; } 
{in}{br}{fn}                                                                    { lexeme=yytext(); return SaltoDeLinea; }
{in}{em}{fn}                                                                    { lexeme=yytext(); return InicioResaltadoEm; }
{in}{em}{espacio}*                                                              { lexeme=yytext(); return InicioResaltadoEmConAtributo; }
{inf}{em}{fn}                                                                   { lexeme=yytext(); return FinResaltadoEm; }
{in}{EtiqA}{fn}                                                                 { lexeme=yytext(); return AperturaEtiquetaA; }
{in}{EtiqA}{espacio}*                                                           { lexeme=yytext(); return AperturaEtiquetaAconAtributo; }
{inf}{EtiqA}{fn}                                                                { lexeme=yytext(); return CierreEtiquetaA; }
{in}{mark}{fn}                                                                  { lexeme=yytext(); return InicioResaltadoMark; }
{in}{mark}{espacio}*                                                            { lexeme=yytext(); return InicioResaltadoMarkConAtributo; }
{inf}{mark}{fn}                                                                 { lexeme=yytext(); return FinResaltadoMark; }
{in}{seccion}{fn}                                                               { lexeme=yytext(); return AperturaSeccion ; }
{in}{seccion}{espacio}*                                                         { lexeme=yytext(); return AperturaSeccionConAtributo ; }
{inf}{seccion}{fn}                                                              { lexeme=yytext(); return CierreSeccion; }
{in}{Titu}"1" {fn}                                                              { lexeme=yytext(); return AperturaTitulo1; }
{in}{Titu}"1"{espacio}*                                                         { lexeme=yytext(); return AperturaTitulo1ConAtributo; }
{inf}{Titu}"1" {fn}                                                             { lexeme=yytext(); return CierreTitulo1; }
{in}{Titu}"2"{fn}                                                               { lexeme=yytext(); return AperturaTitulo2; }
{in}{Titu}"2"{espacio}*                                                         { lexeme=yytext(); return AperturaTitulo2ConAtributo; }
{inf}{Titu}"2"{fn}                                                              { lexeme=yytext(); return CierreTitulo2; }
{in}{Titu}"3"{fn}                                                               { lexeme=yytext(); return AperturaTitulo3; }
{in}{Titu}"3"{espacio}*                                                         { lexeme=yytext(); return AperturaTitulo3ConAtributo; }
{inf}{Titu}"3"{fn}                                                              { lexeme=yytext(); return CierreTitulo3; }
{in}{Titu}"4"{fn}                                                               { lexeme=yytext(); return AperturaTitulo4; }
{in}{Titu}"4"{espacio}*                                                         { lexeme=yytext(); return AperturaTitulo4ConAtributo; }
{inf}{Titu}"4"{fn}                                                              { lexeme=yytext(); return CierreTitulo4; }
{in}{Titu}"5"{fn}                                                               { lexeme=yytext(); return AperturaTitulo5; }
{in}{Titu}"5"{espacio}*                                                         { lexeme=yytext(); return AperturaTitulo5ConAtributo; }
{inf}{Titu}"5"{fn}                                                              { lexeme=yytext(); return CierreTitulo5; }
{in}{Titu}"6"{fn}                                                               { lexeme=yytext(); return AperturaTitulo6; }
{in}{Titu}"6"{espacio}*                                                         { lexeme=yytext(); return AperturaTitulo6ConAtributo; }
{inf}{Titu}"6"{fn}                                                              { lexeme=yytext(); return CierreTitulo6; }
{in}{lista}{fn}                                                                 { lexeme=yytext(); return AperturaDeListaOrdenada; }
{in}{lista}{espacio}*                                                           { lexeme=yytext(); return AperturaDeListaOrdenadaConAtributo; }
{inf}{lista}{fn}                                                                { lexeme=yytext(); return CierreDeListaOrdenada; }
{in}{listad}{fn}                                                                { lexeme=yytext(); return AperturaListaDesordenada; }
{in}{listad}{espacio}*                                                          { lexeme=yytext(); return AperturaListaDesordenadaConAtributo; }
{inf}{listad}{fn}                                                               { lexeme=yytext(); return CierreListaDesordenada; }
{in}{itemlista}{fn}                                                             { lexeme=yytext(); return ItemEnLaLista; }
{in}{itemlista}{espacio}*                                                       { lexeme=yytext(); return ItemEnLaListaConAtributo; }
{inf}{itemlista}{fn}                                                            { lexeme=yytext(); return CierreDeItemEnLaLista; }
{in}{tableC}{fn}                                                                { lexeme=yytext(); return TablaConBorde; }
{in}{tableC}{espacio}*                                                          { lexeme=yytext(); return TablaConBordeConAtributo; }
{in}{tabla}{fn}                                                                 { lexeme=yytext(); return InicioDeTabla; }
{inf}{tabla}{fn}                                                                { lexeme=yytext(); return CierreDeTabla; }
{in}{cap}{fndos}                                                                { lexeme=yytext(); return InicioDeTituloDeTabla; }
{in}{cap}{espacio}*                                                             { lexeme=yytext(); return InicioDeTituloDeTablaConAtributo; }
{inf}{cap}{fn}                                                                  { lexeme=yytext(); return FinDeTituloDeTabla; }
{in}{cabeza}{fn}                                                                { lexeme=yytext(); return InicioDeCabezaDeTabla; }
{in}{cabeza}{espacio}*                                                          { lexeme=yytext(); return InicioDeCabezaDeTablaConAtributo; }
{inf}{cabeza}{fn}                                                               { lexeme=yytext(); return CierreDeCabezaDeTabla; }
{in}{pie}{fn}                                                                   { lexeme=yytext(); return InicioDePieDeTabla; }
{in}{pie}{espacio}*                                                             { lexeme=yytext(); return InicioDePieDeTablaConAtributo; }
{inf}{pie}{fn}                                                                  { lexeme=yytext(); return FinDePieDeTabla; }
{in}{cuerpo}{fn}                                                                { lexeme=yytext(); return InicioDeCuerpoDeTabla; }
{in}{cuerpo}{espacio}*                                                          { lexeme=yytext(); return InicioDeCuerpoDeTablaConAtributo; }
{inf}{cuerpo}{fn}                                                               { lexeme=yytext(); return FinDeCuerpoDeTabla; }
{in}{celda}{fn}                                                                 { lexeme=yytext(); return InicioDeCelda; }
{in}{celda}{espacio}*                                                           { lexeme=yytext(); return InicioDeCeldaConAtributo; }
{inf}{celda}{fn}                                                                { lexeme=yytext(); return CierreDeCelda; }
{in}{columna}{fn}                                                               { lexeme=yytext(); return InicioDeColumna; }
{in}{columna}{espacio}*                                                         { lexeme=yytext(); return InicioDeColumnaConAtributo; }
{inf}{columna}{fn}                                                              { lexeme=yytext(); return CierreDeColumna; }
{in}{fila}{fn}                                                                  { lexeme=yytext(); return InicioDefila; }
{in}{fila}{espacio}*                                                            { lexeme=yytext(); return InicioDefilaConAtributo; }
{inf}{fila}{fn}                                                                 { lexeme=yytext(); return CierreDeFila; }
{ATlist}{espacio}*                                                              { lexeme=yytext(); return Atributolista; }
{ATabla}{espacio}*                                                              { lexeme=yytext(); return AtributoTabla; }
({ATg}{espacio}*                                                                { lexeme=yytext(); return Atributogeneral; }
{in}{html}{fndos}                                                               { lexeme=yytext(); return AperturaDeIdiomaHTML; }
{cierreF}                                                                       { lexeme=yytext(); return CierreEtiqueta;}
{fn}
{espacio}*{src}{espacio}                                                        { lexeme=yytext(); return FinEtiqueta; }                                                       { lexeme=yytext(); return Atributosrc; } 
{espacio}*{width}{espacio}*                                                     { lexeme=yytext(); return Atributowidth; } 
{espacio}*{height}{espacio}*                                                    { lexeme=yytext(); return Atributoheight; }   
{espacio}*{alt}{espacio}*                                                       { lexeme=yytext(); return alt; }
{espacio}*"="{espacio}*                                                         { lexeme=yytext(); return SignoIgual; }
{late}{espacio}*"="{espacio}*{Comillas}{L}*{Comillas}{espacio}*                 { lexeme=yytext(); return LATE; }        
{value}{espacio}*"="{espacio}*{Comillas}({L}|{D}){Comillas}{espacio}*{D}*                          { lexeme=yytext(); return VALUE; }
{target}                                                                        { lexeme=yytext(); return AtributoTARGET; }
{href}{espacio}*"="{espacio}*                                                   { lexeme=yytext(); return AtributoHREF; }
{class}{espacio}*"="                                                            { lexeme=yytext(); return CLASS; }
{id}{espacio}*"="                                                               { lexeme=yytext(); return ID; }
{L}({L}|{D})* | {D}*{L}({L}|{D})*                                                             { lexeme=yytext(); return texto;}
("(-"{D}+")")|{D}+                                                              { lexeme=yytext(); return Numero; }
{Content}{espacio}*"="{espacio}*{Comillas}?({L}|{D})*{Comillas}?{espacio}*      { lexeme=yytext(); return AtributoMeta; }
"\&""nbsp"|"\&""nbsp;"                                                          { lexeme=yytext(); return EspacioVacio; }
{Comillas}{proto}"://"({L}|{D})+:?{Comillas}{espacio}*|[#]{L}+|{Comillas}({L}|{D})+:?({L}|{D}){Comillas}{espacio}*|{Comillas}({L}|{D})*"."{L}*{Comillas}{espacio}*                      { lexeme=yytext(); return Url; }
 .                                                                              { lexeme=yytext(); return ERROR; }

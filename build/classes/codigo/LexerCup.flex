package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L = [a-zA-Z_.\-~/áéíóúÁÉÍÓÚÃ,Ññ&\:\!\¿\+\*\;\#\%\?\°\=@\|$ ]+
html=[H|h][T|t][M|m][L|l][" "]*[L|l][A|a][N|n][G|g][" "]*[=][" "]*[\"|\“|\'][" "]*[a-z|A-Z][a-z|A-Z][" "]*[\"|\”|\']
ATimg = [s|S][r|R][C|c]|[A|a][L|l][T|t]|[W|w][I|i][D|d][T|t][H|h]|[H|h][E|e][I|i][G|g][H|h][T|t]
ATlist = [T|t][y|y][P|p][E|e]|[V|v][A|a][L|l][U|u][E|e]
ATa = [H|h][R|r][E|e][F|f]|[T|t][A|a][R|r][G|g][E|e][T|t]
ATgCLASS = [C|c][L|l][A|a][S|s][S|s]
ATgID = [I|i][D|d]
proto = [H|h][T|t][T|t][P|p]|[H|h][T|t][T|t][P|p][S|s]|[F|f][T|t][P|p]|[F|f][T|t][P|p][S|s]
seccion = [s|S][E|e][c|C][T|t][i|I][O|o][n|N]
tabla= [t|T][A|a][b|B][l|L][e|E]
Titu= [h|H]
lista = [o|O][L|l]
listad= [u|U][L|l]
itemlista= [l|L][I|i]
href=[H|h][R|r][E|e][F|f]
cap = [C|c][a|A][p|P][t|T][i|I][o|O][n|N]
cabeza = [t|T][h|H][e|E][a|A][d|D]
pie = [T|t][F|f][O|o][O|o][T|t]
cuerpo = [td|T][B|b][O|o][D|d][Y|y]
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
img=[I|i][M|m][G|g]
tableC=[T|t][A|a][B|b][L|l][E|e][" "]*[B|b][O|o][R|r][D|d][E|e][R|r][" "]*[=][" "]*[\"|\“|\'][" "]*[1][" "]*[\"|\”|\'][" "]*
in=[<|\<][" "]* 
inf="</"[" "]* 
fn= [" "]*[>]
src=[S|s][R|r][C|c]
width=[W|w][I|i][D|d][T|t][H|h]
height=[H|h][E|e][I|i][G|g][H|h][T|t]
target =[T|t][A|a][R|r][G|g][E|e][T|t]
late=[T|t][Y|y][P|p][E|e]
value=[V|v][A|a][L|l][U|u][E|e]
fndos = [" "]*[/]?[>|\>]
id = [I|i][D|d]
class = [C|c][L|l][A|a][S|s][S|s]
alt=[A|a][L|l][T|t]
cierreF= [" "]*[/][>]
D=[0-9]+
espacio=[ , \t,\r,\n,]+
espacio2 = [ ]
alt=[A|a][L|l][T|t]
EtiqA= [a|A]
ATabla= [R|r][U|u][L|l][E|e][S|s][" "]*[=][" "]*[\"|\“|\']{L}[" "]*[\"|\”|\'][" "]*
Especiales = [\", ¡, !, ¿, ?, \-, +, ', *, :, ;, (, ), :]+
Parentesis = [\(,\)]+
Content=[C|c][O|o][N|n][T|t][E|e][N|n][T|t]
Comillas=[\"|\”|\“|\']
%{
     private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

{Especiales} {/*Ignore*/}
{espacio}    {/*Ignore*/}
"//".* {/*ignore*/}
{in}{img}{espacio}*                                                                       { return new Symbol(sym.Imagen, yychar, yyline, yytext()); } 
{in}{Meta}{espacio}*{charset}{utf}{fndos}                                       { return new Symbol(sym.AperturaLibreriaHTML, yychar, yyline, yytext()); } 
{in}{Meta}{espacio}*{name}{espacio}*"="{espacio}*{Comillas}{espacio}*{L}+{espacio}*{Comillas}{fndos} { return new Symbol(sym.AperturaMetaName, yychar, yyline, yytext()); }
{in}{Meta}{espacio}*{name}{espacio}*"="{espacio}*{Comillas}{espacio}*{L}+{espacio}*{Comillas}{espacio}*{Content}"="{espacio}*{Comillas}{espacio}*{L}+{espacio}*{Comillas}{fndos}  { return new Symbol(sym.AperturaMetaNameConAtributo, yychar, yyline, yytext()); }
{in}"!"{DocHTML}{fn}                                                            { return new Symbol(sym.InicioDocumento, yychar, yyline, yytext()); }
{inf}{Documento}{fn}                                                            { return new Symbol(sym.CierreDeDocumento, yychar, yyline, yytext()); }
{in}{Parrafo}{fn}                                                               { return new Symbol(sym.InicioDeParrafo, yychar, yyline, yytext()); }
{in}{Parrafo}{espacio}*                                                                   { return new Symbol(sym.InicioDeParrafoConAtributo, yychar, yyline, yytext()); }
{inf}{Parrafo}{fn}                                                         { return new Symbol(sym.FinDeParrafo, yychar, yyline, yytext()); }
{in}{Head}{fn}                                                                  { return new Symbol(sym.AperturaHead, yychar, yyline, yytext()); }
{inf}{Head}{fn}                                                                 { return new Symbol(sym.CierreHead, yychar, yyline, yytext()); }
{in}{Title}{fn}                                                                 { return new Symbol(sym.AperturaTitle, yychar, yyline, yytext()); }
{in}{Title}{espacio}*                                                                      { return new Symbol(sym.AperturaTitleConAtributo, yychar, yyline, yytext()); }
{inf}{Title}{fn}                                                                { return new Symbol(sym.CierreTitulo, yychar, yyline, yytext()); }
{in}{Body}{fn}                                                                  { return new Symbol(sym.AperturaBody, yychar, yyline, yytext()); }
{in}{Body}{espacio}*                                                                       { return new Symbol(sym.AperturaBodyConAtributo, yychar, yyline, yytext()); }
{inf}{Body}{fn}                                                                 { return new Symbol(sym.CierreBody, yychar, yyline, yytext()); }
{in}{Strong}{fn}                                                                { return new Symbol(sym.InicioMarcadoConEnfasis, yychar, yyline, yytext()); }
{in}{Strong}{espacio}*                                                                     { return new Symbol(sym.InicioMarcadoConEnfasisConAtributo, yychar, yyline, yytext()); }
{inf}{Strong}{fn}                                                               { return new Symbol(sym.FinMarcadoConEnfasis, yychar, yyline, yytext()); }
{in}{Div}{fn}                                                                   { return new Symbol(sym.AperturaDivision, yychar, yyline, yytext()); }
{in}{Div}{espacio}*                                                                        { return new Symbol(sym.AperturaDivisionConAtributo, yychar, yyline, yytext()); }
{inf}{Div}{fn}                                                                  { return new Symbol(sym.CierreDivision, yychar, yyline, yytext()); }
{in}{hr}{fn}                                                                    { return new Symbol(sym.UnaLineaHorizontal, yychar, yyline, yytext()); } 
{in}{br}{fn}                                                                    { return new Symbol(sym.SaltoDeLinea, yychar, yyline, yytext()); }
{in}{em}{fn}                                                                    { return new Symbol(sym.InicioResaltadoEm, yychar, yyline, yytext()); }
{in}{em}{espacio}*                                                                        { return new Symbol(sym.InicioResaltadoEmConAtributo, yychar, yyline, yytext()); }
{inf}{em}{fn}                                                                   { return new Symbol(sym.FinResaltadoEm, yychar, yyline, yytext()); }
{in}{EtiqA}{espacio}*                                                           { return new Symbol(sym.AperturaEtiquetaAconAtributo, yychar, yyline, yytext()); }
{inf}{EtiqA}{fn}                                                                { return new Symbol(sym.CierreEtiquetaA, yychar, yyline, yytext()); }
{in}{mark}{fn}                                                                  { return new Symbol(sym.InicioResaltadoMark, yychar, yyline, yytext()); }
{in}{mark}{espacio}*                                                                      { return new Symbol(sym.InicioResaltadoMarkConAtributo, yychar, yyline, yytext()); }
{inf}{mark}{fn}                                                                 { return new Symbol(sym.FinResaltadoMark, yychar, yyline, yytext()); }
{in}{seccion}{fn}                                                               { return new Symbol(sym.AperturaSeccion, yychar, yyline, yytext()); }
{in}{seccion}{espacio}*                                                                   { return new Symbol(sym.AperturaSeccionConAtributo, yychar, yyline, yytext()); }
{inf}{seccion}{fn}                                                              { return new Symbol(sym.CierreSeccion, yychar, yyline, yytext()); }
{in}{Titu}"1" {fn}                                                              { return new Symbol(sym.AperturaTitulo1, yychar, yyline, yytext()); }
{in}{Titu}"1"{espacio}*                                                                   { return new Symbol(sym.AperturaTitulo1ConAtributo, yychar, yyline, yytext()); }
{inf}{Titu}"1" {fn}                                                             { return new Symbol(sym.CierreTitulo1, yychar, yyline, yytext()); }
{in}{Titu}"2"{fn}                                                               { return new Symbol(sym.AperturaTitulo2, yychar, yyline, yytext()); }
{in}{Titu}"2"{espacio}*                                                                   { return new Symbol(sym.AperturaTitulo2ConAtributo, yychar, yyline, yytext()); }
{inf}{Titu}"2"{fn}                                                              { return new Symbol(sym.CierreTitulo2, yychar, yyline, yytext()); }
{in}{Titu}"3"{fn}                                                               { return new Symbol(sym.AperturaTitulo3, yychar, yyline, yytext()); }
{in}{Titu}"3"{espacio}*                                                                   { return new Symbol(sym.AperturaTitulo3ConAtributo, yychar, yyline, yytext()); }
{inf}{Titu}"3"{fn}                                                              { return new Symbol(sym.CierreTitulo3, yychar, yyline, yytext()); }
{in}{Titu}"4"{fn}                                                               { return new Symbol(sym.AperturaTitulo4, yychar, yyline, yytext()); }
{in}{Titu}"4"{espacio}*                                                                   { return new Symbol(sym.AperturaTitulo4ConAtributo, yychar, yyline, yytext()); }
{inf}{Titu}"4"{fn}                                                              { return new Symbol(sym.CierreTitulo4, yychar, yyline, yytext()); }
{in}{Titu}"5"{fn}                                                               { return new Symbol(sym.AperturaTitulo5, yychar, yyline, yytext()); }
{in}{Titu}"5"{espacio}*                                                                   { return new Symbol(sym.AperturaTitulo5ConAtributo, yychar, yyline, yytext()); }
{inf}{Titu}"5"{fn}                                                              { return new Symbol(sym.CierreTitulo5, yychar, yyline, yytext()); }
{in}{Titu}"6"{fn}                                                               { return new Symbol(sym.AperturaTitulo6, yychar, yyline, yytext()); }
{in}{Titu}"6"{espacio}*                                                                   { return new Symbol(sym.AperturaTitulo6ConAtributo, yychar, yyline, yytext()); }
{inf}{Titu}"6"{fn}                                                              { return new Symbol(sym.CierreTitulo6, yychar, yyline, yytext()); }
{in}{lista}{fn}                                                                 { return new Symbol(sym.AperturaDeListaOrdenada, yychar, yyline, yytext()); }
{in}{lista}{espacio}*                                                                     { return new Symbol(sym.AperturaDeListaOrdenadaConAtributo, yychar, yyline, yytext()); }
{inf}{lista}{fn}                                                                { return new Symbol(sym.CierreDeListaOrdenada, yychar, yyline, yytext()); }
{in}{listad}{fn}                                                                { return new Symbol(sym.AperturaListaDesordenada, yychar, yyline, yytext()); }
{in}{listad}{espacio}*                                                                    { return new Symbol(sym.AperturaListaDesordenadaConAtributo, yychar, yyline, yytext()); }
{inf}{listad}{fn}                                                               { return new Symbol(sym.CierreListaDesordenada, yychar, yyline, yytext()); }
{in}{itemlista}{fn}                                                             { return new Symbol(sym.ItemEnLaLista, yychar, yyline, yytext()); }
{in}{itemlista}{espacio}*                                                                 { return new Symbol(sym.ItemEnLaListaConAtributo, yychar, yyline, yytext()); }
{inf}{itemlista}{fn}                                                            { return new Symbol(sym.CierreDeItemEnLaLista, yychar, yyline, yytext()); }
{in}{tableC}{fn}                                                                 { return new Symbol(sym.TablaConBorde, yychar, yyline, yytext()); }
{in}{tableC}{espacio}*                                                                     { return new Symbol(sym.TablaConBordeConAtributo, yychar, yyline, yytext()); }
{in}{tabla}{fn}                                                                 { return new Symbol(sym.InicioDeTabla, yychar, yyline, yytext()); }
{in}{tabla}{espacio}*                                                                 { return new Symbol(sym.InicioDeTablaConAtributo, yychar, yyline, yytext()); }
{inf}{tabla}{fn}                                                                { return new Symbol(sym.CierreDeTabla, yychar, yyline, yytext()); }
{in}{cap}{fndos}                                                                { return new Symbol(sym.InicioDeTituloDeTabla, yychar, yyline, yytext()); }
{in}{cap}{espacio}*                                                                       { return new Symbol(sym.InicioDeTituloDeTablaConAtributo, yychar, yyline, yytext()); }
{inf}{cap}{fn}                                                                  { return new Symbol(sym.FinDeTituloDeTabla, yychar, yyline, yytext()); }
{in}{cabeza}{fn}                                                                { return new Symbol(sym.InicioDeCabezaDeTabla, yychar, yyline, yytext()); }
{in}{cabeza}{espacio}*                                                                    { return new Symbol(sym.InicioDeCabezaDeTablaConAtributo, yychar, yyline, yytext()); }
{inf}{cabeza}{fn}                                                               { return new Symbol(sym.CierreDeCabezaDeTabla, yychar, yyline, yytext()); }
{in}{pie}{fn}                                                                   { return new Symbol(sym.InicioDePieDeTabla, yychar, yyline, yytext()); }
{in}{pie}{espacio}*                                                                       { return new Symbol(sym.InicioDePieDeTablaConAtributo, yychar, yyline, yytext()); }
{inf}{pie}{fn}                                                                  { return new Symbol(sym.FinDePieDeTabla, yychar, yyline, yytext()); }
{in}{cuerpo}{fn}                                                                { return new Symbol(sym.InicioDeCuerpoDeTabla, yychar, yyline, yytext()); }
{in}{cuerpo}{espacio}*                                                                    { return new Symbol(sym.InicioDeCuerpoDeTablaConAtributo, yychar, yyline, yytext()); }
{inf}{cuerpo}{fn}                                                               { return new Symbol(sym.FinDeCuerpoDeTabla, yychar, yyline, yytext()); }
{in}{celda}{fn}                                                                 { return new Symbol(sym.InicioDeCelda, yychar, yyline, yytext()); }
{in}{celda}{espacio}*                                                                     { return new Symbol(sym.InicioDeCeldaConAtributo, yychar, yyline, yytext()); }
{inf}{celda}{fn}                                                                { return new Symbol(sym.CierreDeCelda, yychar, yyline, yytext()); }
{in}{columna}{fn}                                                               { return new Symbol(sym.InicioDeColumna, yychar, yyline, yytext()); }
{in}{columna}{espacio}*                                                         { return new Symbol(sym.InicioDeColumnaConAtributo, yychar, yyline, yytext()); }
{inf}{columna}{fn}                                                              { return new Symbol(sym.CierreDeColumna, yychar, yyline, yytext()); }
{in}{fila}{fn}                                                                  { return new Symbol(sym.InicioDefila, yychar, yyline, yytext()); }
{in}{fila}{espacio}*                                                            { return new Symbol(sym.InicioDefilaConAtributo, yychar, yyline, yytext()); }
{inf}{fila}{fn}                                                                 { return new Symbol(sym.CierreDeFila, yychar, yyline, yytext()); }
({ATgCLASS}{espacio}*"="{espacio}*{Comillas}?({L}|{D})*{Comillas}?{espacio}*)          { return new Symbol(sym.AtributogeneralCLASS, yychar, yyline, yytext()); }
({ATgID}{espacio}*"="{espacio}*{Comillas}?({L}|{D})*{Comillas}?{espacio}*)          { return new Symbol(sym.AtributogeneralID, yychar, yyline, yytext()); }
{Comillas}{proto}"://"({L}|{D})+:?{Comillas}{espacio}*|[#]{L}+|{Comillas}({L}|{D})+:?({L}|{D}){Comillas}{espacio}*|{Comillas}({L}|{D})*"."{L}*{Comillas}{espacio}*                  { return new Symbol(sym.Url, yychar, yyline, yytext()); }
{in}{html}{fndos}                                                               { return new Symbol(sym.AperturaDeIdiomaHTML, yychar, yyline, yytext()); }
{late}{espacio}*"="{espacio}*{Comillas}{L}*{Comillas}{espacio}*                                                   { return new Symbol(sym.LATE, yychar, yyline, yytext()); } 
{value}{espacio}*"="{espacio}*({L}|{D})*{espacio}*{D}*                          { return new Symbol(sym.VALUE, yychar, yyline, yytext()); }
{href}{espacio}*"="{espacio}*                                                   { return new Symbol(sym.AtributoHREF, yychar, yyline, yytext()); }
{id}{espacio}*"="                                                               { return new Symbol(sym.ID, yychar, yyline, yytext()); }
{class}{espacio}*"="                                                            { return new Symbol(sym.CLASS, yychar, yyline, yytext()); }
{target}{espacio}*"="{espacio}*{Comillas}({L}|{D})+{Comillas}{espacio}*                                                                      { return new Symbol(sym.AtributoTARGET, yychar, yyline, yytext()); }
{fn}                                                                            { return new Symbol(sym.FinEtiqueta, yychar, yyline, yytext()); }
{src}{espacio}*"="{espacio}*{Comillas}{proto}"://"({L}|{D})+:?{Comillas}{espacio}* | {src}{espacio}*"="{espacio}*{Comillas}({L}|{D})+[.]{L}+{Comillas}{espacio}*                     { return new Symbol(sym.Atributosrc, yychar, yyline, yytext()); } 
{width}{espacio}*"="{espacio}*{Comillas}(("(-"{D}+")")|{D}+){Comillas}{espacio}*                      { return new Symbol(sym.Atributowidth, yychar, yyline, yytext()); } 
{height}{espacio}*"="{espacio}*{Comillas}(("(-"{D}+")")|{D}+){Comillas}{espacio}*                                                             { return new Symbol(sym.Atributoheight, yychar, yyline, yytext()); }   
{alt}{espacio}*"="{espacio}*{Comillas}{L}({L}|{D})*{Comillas}{espacio}*                 { return new Symbol(sym.alt, yychar, yyline, yytext()); }
(({L}({L}|{D})*)|{in}{br}{fn}|{in}{hr}{fn}|({D}+({L}|{D})*)|{Parentesis}) *                                                                    { return new Symbol(sym.texto, yychar, yyline, yytext()); }

"\&""nbsp"|"\&""nbsp;"                                                          { return new Symbol(sym.EspacioVacio, yychar, yyline, yytext()); }
 .                                                                              { return new Symbol(sym.ERROR, yychar, yyline, yytext()); }


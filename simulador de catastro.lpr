program batallanaval;
uses crt;
Const
  LIMITE = 9;
type
tablero = array[1..LIMITE, 1..LIMITE] of byte;

var tablero1, tablero2: tablero;
fila, columna: byte;
i, j, opcion: byte;
procedure leer_posicion(var fila, columna:byte);
var valido: boolean;
posicion: string;
begin
repeat
readln(posicion);
posicion := upcase(posicion);
valido := false;

if (length(posicion) = 2) and (ord(posicion[2]) > 48) and (ord(posicion[2]) < 58) and (ord(posicion[1]) > 64) and (ord(posicion[1]) < 74) then
begin
columna := ord(posicion[1])-64;
fila := ord(posicion[2])-48;
valido := true;
end
else
//gotoxy(35,21);
write('Por favor, ingrese una posicion valida: ');
until (valido = true);
end;

procedure dibujar_tablero(titulo: string; tablero: tablero);
var i, j: byte;
begin
clrscr;
//gotoxy(35,1);
writeln(titulo);
//gotoxy(35,3);
writeln('   ___________________');
for i:= 1 to LIMITE do
begin
write(' ', i, '| ');
for j := 1 to LIMITE do
case tablero[i, j] of
0: write('b ');
1: write('b ');
2: write('o ');
3: write('x ');
end;
writeln('|');
end;
//gotoxy(33,15);
writeln('   ___________________');
//gotoxy(33,17);
writeln('    A B C D E F G H I ');
end;

procedure ingreso_barcos(titulo: string; var tablero: tablero);
var fila, columna: byte;
begin;
for i := 1 to 3 do begin
dibujar_tablero(titulo, tablero);

//gotoxy(35,19);
write('Escribe la posicion del barco ', i, ': ');
leer_posicion(fila, columna);

while tablero[fila, columna] = 3 do begin
//gotoxy(35,21);
write('Ya hay un barco aca. Escriba otra posicion: ');
leer_posicion(fila, columna);
end;

tablero[fila, columna] := 3;
end;

dibujar_tablero(titulo, tablero);
//gotoxy(33,21);
writeln('Presiona enter para continuar...');
//gotoxy(33,23);
readln;
clrscr;
end;


procedure atacar(fila, columna:byte; var tablero: tablero);
begin
while tablero[fila, columna] > 1 do
begin
write('Ya atacaste esa posicion, elige otra: ');
leer_posicion(fila, columna);
end;

if tablero[fila, columna] = 0 then
begin
tablero[fila, columna] := 2;
dibujar_tablero('disparaste al agua nomas', tablero);
end;

if tablero[fila, columna] = 1 then
begin
tablero[fila, columna] := 3;
//gotoxy(35,1);
dibujar_tablero('has acertado en un barco', tablero);
end;
end;

procedure realizar_ataque(titulo:string; var tablero: tablero);
var fila, columna: byte;
begin
dibujar_tablero(titulo, tablero);
//gotoxy(35,19);
write('Ingrese una posicion para atacar: ');
leer_posicion(fila, columna);
atacar(fila, columna, tablero);
//gotoxy(35,21);
write('Presiona enter para continuar...');
//gotoxy(35,23);
readln;
end;

function tablero_completo(tablero: tablero): boolean;
var i, j, c: byte;
begin
c := 0;
for i := 1 to LIMITE do
for j := 1 to LIMITE do
if tablero[i, j] = 3 then c := c + 1;

if c = 3 then tablero_completo := true
else tablero_completo := false;
end;

begin
repeat
clrscr; //poner menu facherito
writeln;
//gotoxy(55,13);
writeln(' 1 - Jugar');
//gotoxy(55,15);
writeln(' 0 - Salir');
writeln;
//gotoxy(55,17);
readln(opcion);
while (opcion <> 1) and (opcion <> 0) do
begin
//gotoxy(55,19);
writeln('Ingresa una opcion valida');
//gotoxy(55,21);
readln(opcion);
end;

if opcion = 1 then begin
clrscr;
//gotoxy(35,1);
writeln('Comienza la etapa de posicionamiento.');
//gotoxy(35,3);
writeln('Indica la posicion donde ubicar los barcos mediante su coordenada.');
//gotoxy(35,5);
writeln('Por ejemplo: "G3"');
//gotoxy(35,7);
writeln('Presiona enter para continuar...');
//gotoxy(35,9);
readln;
clrscr;

//gotoxy(35,1);
writeln('Turno del jugador 1');
//gotoxy(35,3);
writeln('Presiona enter para continuar...');
//gotoxy(35,5);
readln;
ingreso_barcos('Jugador 1', tablero1);

//gotoxy(35,1);
writeln('Turno del jugador 2');
//gotoxy(35,3);
writeln('Presiona enter para continuar...');
//gotoxy(35,5);
readln;
ingreso_barcos('Jugador 2', tablero2);

//gotoxy(35,1);
writeln('Los barcos fueron ubicados.');
//gotoxy(35,3);
writeln('Ahora comienza la etapa de ataque.');
//gotoxy(35,5);
writeln('Indica la posicion a atacar mediante su coordenada.');
//gotoxy(35,7);
writeln('Por ejemplo: "A1"');
//gotoxy(35,9);
writeln('Presiona enter para continuar...');
//gotoxy(35,11);
readln;

for i := 1 to LIMITE do
for j := 1 to LIMITE do
begin
if tablero1[i, j] = 3 then tablero1[i, j] := 1;
if tablero2[i, j] = 3 then tablero2[i, j] := 1;
end;

repeat
clrscr;
//gotoxy(35,1);
writeln('Turno del jugador 1');
//gotoxy(35,3);
writeln('Presiona enter para continuar...');
readln;

realizar_ataque('Turno de ataque: jugador 1', tablero2);
if tablero_completo(tablero2) = true then
begin
clrscr;
//gotoxy(35,3);
writeln('El jugador 1 ha ganado!');
break;
end;

clrscr;
//gotoxy(35,1);
writeln('Turno del jugador 2');
//gotoxy(35,3);
writeln('Presiona enter para continuar...');
//gotoxy(35,5);
readln;

realizar_ataque('Turno de ataque: jugador 2', tablero1);
if tablero_completo(tablero1) = true then
begin
clrscr;
//gotoxy(35,3);
writeln('El jugador 2 ha ganado!');
break;
end;

until (false);
//gotoxy(35,5);
writeln('Presiona enter para continuar...');
//gotoxy(35,7);
readln;
end;
until (opcion = 0);
end.

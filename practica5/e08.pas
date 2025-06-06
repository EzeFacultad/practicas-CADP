program memoria;
type
    datos = array [1..20] of integer;
    punt = ^datos;

procedure procesarDatos(v : datos; var v2 : datos);
var
    i, j : integer;
begin
    for i := 1 to 20 do
        v2[21 - i] := v[i];
end;

var
    vect : datos;
    pvect : punt;
    i : integer;
begin
    for i:= 1 to 20 do
      vect[i] := i;
    new(pvect);
    for i:= 20 downto 1 do
      pvect^[i] := 0;
    procesarDatos(pvect^, vect);
    writeln('fin');
end.

{
Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.

a) Hasta la sentencia de la línea 18 //Rta: Creo que 0 ya que no se llamó a ningún proceso ni variable
b) Hasta la sentencia de la línea 20 //Rta: 42 Bytes
c) Hasta la sentencia de la línea 23 //Rta: 88 Bytes (sumando los 42 bytes anteriores).
d) Hasta la sentencia de la línea 11 //Rta: Si no se imvoca el proceso, se ocupa memoria? Si es asi 42
e) Hasta la sentencia de la línea 25 //Rta: 130 Bytes (sumando los 88 Bytes anteriores).
}
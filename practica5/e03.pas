{
3. Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
Rta: 
    4 bytes
    20000 bytes
    20000 bytes
    20000 bytes
}
program punteros;
type
    numeros = array[1..10000] of integer;
    puntero_numeros = ^numeros;
var 
    n: puntero_numeros;
    num: numeros;
    i:integer;
begin
    writeln(sizeof(n), ' bytes');
    writeln(sizeof(num), ' bytes');
    new(n);
    writeln(sizeof(n^), ' bytes');
    for i:= 1 to 5000 do
        n^[i]:= i;
    writeln(sizeof(n^), ' bytes');
end.
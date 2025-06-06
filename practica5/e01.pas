{
1. Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.

Rta:
    4 bytes
    4 bytes
    4 bytes
    51 bytes
    51 bytes
}
program punteros;
    type
        cadena = string[50];
        puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    writeln(sizeof(pc), ' bytes');
    new(pc);
    writeln(sizeof(pc), ' bytes');
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc), ' bytes');
    writeln(sizeof(pc^), ' bytes');
    pc^:= 'otro nuevo nombre distinto al anterior';
    writeln(sizeof(pc^), ' bytes');
end.
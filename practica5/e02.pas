{
2. Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
Rta:
    4 bytes
    24 bytes
    4 bytes
    24 bytes
    24 bytes
    24 bytes
}

program punteros;
type
    cadena = string[9];

    producto = record
        codigo: integer;
        descripcion: cadena;
        precio: real;
    end;

    puntero_producto = ^producto;
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes');
    writeln(sizeof(prod), ' bytes');
    new(p);
    writeln(sizeof(p), ' bytes');
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes');
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes');
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes');
end.
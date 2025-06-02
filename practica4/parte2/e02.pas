program e02;

const
    dimF = 500;
type
    vector = array[1..dimF] of String;


// INCISO A
procedure cargarVector(var v: vector; var dimL: integer);
var
    nombre: String;
begin
    write('Nombre: '); readln(nombre);
    while (dimL < dimF) and (nombre <> 'ZZZ') do
        begin
            dimL:= dimL + 1;
            v[dimL]:= nombre;
            write('Nombre: '); readln(nombre);
        end;
end;

// INCISO B
procedure eliminar(var v: vector; var dimL: integer; nombre: String);
var
    pos,i: integer;
begin
    pos:= 1;
    while (pos <= dimL) and (v[pos] <> nombre) do
        pos:= pos + 1;
    
    if (pos <= dimL) then
        if (pos < dimL) then
            for i:=pos to dimL do
                v[i]:= v[i + 1];

        dimL:= dimL - 1;
end;

// INCISO C
procedure agregar(var v:vector; var dimL: integer; nombre: String);
begin
    if (dimL <= 4) then
        v[4]:= nombre;
end;

// INCISO D
procedure insertar(var v:vector; var dimL: integer; nombre: String);
begin
    if (dimL < dimF) then
        begin
            dimL:= dimL + 1;
            v[dimL]:= nombre;
        end;
end;

// programa principal
var
    v: vector;
    dimL: integer;
    nombre: String;
begin
    dimL:= 0;
    // INCISO A
    cargarVector(v,dimL);
    
    // INCISO B
    write('Nombre: '); readln(nombre);
    eliminar(v,dimL,nombre);

    // INCISO C
    write('Nombre: '); readln(nombre);
    agregar(v,dimL,nombre);

    // INCISO D
    write('Nombre: '); readln(nombre);
    insertar(v,dimL,nombre);

end.
program e01;

const
    dimF = 500;

type
    vector = array[1..500] of integer;


procedure cargarVector(var v: vector; var dimL: integer);
var
    num: integer;
begin
    write('Numero: '); readln(num);
    while (dimL < dimF) and (num <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= num;
            write('Numero: '); readln(num);
        end;
end;

procedure inciso(v: vector; dimL: integer; num: integer);
var
    x: integer;
begin
    // INCISO A
    x:= 1;
    while (x <= dimL) and (v[x] <> num) do
        x:= x + 1;
    
    // INCISO B
    x:= 1;
    while (x <= dimL) and (v[x] < num) do

    if (x <= dimL) and (v[x] = num) then
        writeln('El numero está en el vector ');
end;

// programa principal
var
    v: vector;
    dimL, num: integer;
begin
    dimL:= 0;
    cargarVector(v,dimL);
    write('Numero a buscar: '); readln(num);
    inciso(v,dimL,num);
end.
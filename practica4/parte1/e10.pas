program e10;

const
    dimF = 300;

type
    vector = array[1..dimF] of real;


procedure cargarVector(var v: vector; var dimL: integer);
var
    salario: integer;
begin
    write('Salario: '); readln(salario);
    while (dimL < dimF) and (salario <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= salario;
            write('Salario: '); readln(salario);
        end;
end;

procedure incisoA(var v: vector; dimL: integer; x: real);
var
    i: integer;
begin
    for i:=1 to dimL do
        v[i]:= v[i] * x;
end;

procedure incisoB(v: vector; dimL: integer);
var
    x: integer;
    suma: real;
begin
    suma:= 0;
    for x:=1 to dimL do
        suma:= suma + v[x];
    
    writeln('El sueldo promedio es: ',(suma/dimL):0:2);
end;

// programa principal
var
    v: vector;
    dimL: integer;
    x: real;
begin
    dimL:= 0;
    cargarVector(v,dimL);
    x:= 1.15;
    incisoA(v,dimL,x);
    incisoB(v,dimL);
end.

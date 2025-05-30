program e05;

const
    dimF = 100;

type
    vector = array[1..dimF] of integer;


function posicion(v: vector; x: integer): integer;
var
    i: integer;
begin
    i:= 1;
    while (i <= dimF) and (v[i] <> x) do
        i:= i + 1;

    if (i <= dimF) then
        posicion:= i
    else
        posicion:= -1;
end;

procedure intercambio(var v: vector; x,y: integer);
var
    num: integer;
begin
    num:= v[x];
    v[x]:= v[y];
    v[y]:= num;
end;

function elementoMaximo(v: vector; dimL: integer): integer;
var
    x,max: integer;
begin
    max:= 0;

    for x:=1 to dimL do
        begin
            if (max < v[x]) then
                begin
                    max:= v[x];
                    elementoMaximo:= x;
                end;
        end;
end;

function elementoMinimo(v: vector; dimL: integer): integer;
var
    x,min: integer;
begin
    min:= 9999;

    for x:=1 to dimL do
        begin
            if (min > v[x]) then
                begin
                    min:= v[x];
                    elementoMinimo:= x;
                end;
        end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
    num: integer;
begin
    write('Ingresar num: '); readln(num);
    while (dimL < dimF) and (num <> 0) do
        begin
            dimL:= dimL + 1;
            v[dimL]:= num;

            write('Ingresar num: '); readln(num);
        end;
end;
// programa principal
var
    v: vector;
    dimL,min,max: integer;
begin
    dimL:= 0;
    cargarVector(v,dimL);
    max:= elementoMaximo(v,dimL);
    min:= elementoMinimo(v,dimL);
    intercambio(v,max,min);
    writeln('El elemento maximo ',max,' que se encontraba en la posicion ',posicion(v,max),
    ' fue intercambiado con el elemento minimo ',min,' que se encontraba en la posicion ',posicion(v,min));
end.
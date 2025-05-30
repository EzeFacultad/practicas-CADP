program e04;

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

function sumaVector(v: vector): integer;
var
    x: integer;
begin
    sumaVector:= 0;
    for x:=1 to 100 do
        sumaVector:= sumaVector + v[x];
end;

function promedio(v: vector): real;
begin
    promedio:= sumaVector(v) / 100;
end;

function elementoMaximo(v: vector): integer;
var
    x,max: integer;
begin
    max:= 0;

    for x:=1 to dimF do
        begin
            if (max < v[x]) then
                begin
                    max:= v[x];
                    elementoMaximo:= x;
                end;
        end;
end;

function elementoMinimo(v: vector): integer;
var
    x,min: integer;
begin
    min:= 9999;

    for x:=1 to dimF do
        begin
            if (min > v[x]) then
                begin
                    min:= v[x];
                    elementoMinimo:= x;
                end;
        end;
end;

// programa principal
var
    v: vector;
    num,resultado,posicion,x,y: integer;
    promedio: real;
begin
    cargarVector(v);

    readln(num);
    resultado:= posicion(v,num);

    readln(x); readln(y);
    intercambio(v,x,y);

    resultado:= sumaVector(v);

    promedio:= promedio(v);

    posicion:= elementoMaximo(v);

    posicion:= elementoMinimo(v);
end.
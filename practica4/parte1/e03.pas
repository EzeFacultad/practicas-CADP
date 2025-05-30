program e04;

type
    vector = array[1..dimF] of integer;


procedure incisoA(v:vector: integer);
var
    x: integer;
begin
    for x:=1 to dimL do
        write(v[x],', ');
end;

procedure incisoB(v:vector; dimL: integer);
var
    x: integer;
begin
    for x:=dimL downto 1 do
        write(v[x],', ');
end;

procedure incisoC(v:vector; dimL: integer);
var
    x,aux: integer;
begin
    aux:= dimL/2;

    for x:=aux downto 1 do
        write(v[x],', ');

    aux:= aux + 1;
    for x:=aux to dimL do
        write(v[x],', ');
end;

procedure incisoD(v:vector; dimL,x,y: integer);
var
    i: integer;
begin
    if (x < y) then
        for i:= x to y do
            write(v[i],', ')
    else
        for i:=x downto y do
            write(v[x],', ');
end;

// programa principal
var 
    v: vector;
    dimL: integer;
    x,y: integer;
begin
    dimL:= 0;
    cargarVector(v,dimL); // se dispone
    incisoA(v,dimL);
    incisoB(v,dimL);
    incisoC(v,dimL);
    readln(x); readln(y);
    incisoD(v,dimL,x,y);

    incisoE() // NO SE ENTIENDE QUE PIDEN EXACTAMENTE
end.
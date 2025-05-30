program e07;

type
    vector = array[0..9] of integer;


procedure analizar(num: integer; var v: vector);
var
    dig: integer;
begin
    while (num <> 0) do
        begin
            dig:= num mod 10;
            v[dig]:= v[dig] + 1;
            num:= num div 10;
        end;
end;

procedure imprimir(v: vector);
var
    x,max,dig: integer;
begin
    max:= 0;

    for x:=0 to 9 do
        begin
            // INCISO A
            if (v[x] <> 0) then
                writeln('Numero ',x,': ',v[x],' veces');
            
            // INCISO B
            if (max < v[x]) then
                begin
                    max:= max + v[x];
                    dig:= x;
                end;
        end;
    
    // INCISO B
    writeln('El digito mas leido fue el ',dig);

    // INCISO C
    write('Los digitos que no tuvieron ocurrencias son: ');
    for x:=0 to 9 do
        if (v[x] = 0) then
            write(x,' ');
end;

// programa principal
var
    v: vector;
    num,x: integer;
begin
    for x:=0 to 9 do
        v[x]:= 0;

    write('Ingresar numero: '); readln(num);
    while (num <> -1) do
        begin
            analizar(num,v);
            write('Ingresar numero: '); readln(num);
        end;
    imprimir(v);
end.
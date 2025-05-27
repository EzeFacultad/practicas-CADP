program e02;

var
    x,max,pos,num: integer;
begin
    max:= 0;

    for x:=1 to 10 do
        begin
            write('Ingresar un numero: '); readln(num);
            if (num > max) then
                begin
                    max:= num;
                    pos:= x;
                end;
        end;

    writeln('El mayor numero leido fue el ',max,', en la posicion ',pos);
end.
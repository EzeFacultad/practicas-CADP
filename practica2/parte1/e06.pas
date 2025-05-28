program e06;

// INCISO A
procedure inciso;
    var
        num, max: integer;
    begin
        max:= 0;
        write('Ingresar numero: '); readln(num);

        while (num > 0) do
            begin
                if (num > max) and ((num mod 2) = 0) then
                    max:= num;
                
                write('Ingresar numero: '); readln(num);
            end;
        
        writeln('El numero mas grande fue el ',max);
    end;

// INCISO B
begin
    inciso;
end.
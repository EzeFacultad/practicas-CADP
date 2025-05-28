program e02;

var a,b: integer;

procedure uno;
    begin
        b := 3;
        writeln(b);
    end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a); // 3, 31
end.
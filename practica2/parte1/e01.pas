program alcance1;

var a,b: integer;

procedure uno;
    var 
        b: integer;
    begin
        b := 3;
        writeln(b);
    end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a); // 3, 21
end.
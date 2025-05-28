program e03;

var a: integer;

procedure uno;
    var 
        b: integer;
    begin
        b:= 2;
        writeln(b);
    end;

begin
    a:= 1;
    uno;
    writeln(a, b); 
    {
        El error es que se quiere imprimir la variable "b".
        Esta variable está declarada de manera local en el proceso "uno"
        y solo ahi puede ser impresa.
    }
end.
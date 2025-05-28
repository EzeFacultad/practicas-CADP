program e03;

// programa principal
var
    a,b,c: integer;
begin
    write('Ingresar numero A: '); readln(a);
    write('Ingresar numero B: '); readln(b);
    write('Ingresar numero C: '); readln(c);

    if (a > b) then
        if (a > c) then
            if (b > c) then
                writeln(a,' ',b,' ',c)
            else
                writeln(a,' ',c,' ',b)
        else
            writeln(c,' ',a,' ',b)
    else
        if (a > c) then
            writeln(b,' ',a,' ',c)
        else
            writeln(b,' ',c,' ',a)
end.
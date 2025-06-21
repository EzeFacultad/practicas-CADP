program e14;

type
    REG_prestamo = record
        nroPrestamo,ISBN,nroSocio,dia: integer;
    end;

    REG_lista = record
        ISBN,cantPrestamo: integer;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_lista;
        sig: Lista;
    end;

    vectorContador = array[1..31] of integer;

procedure cargarLista(var L,ult: Lista; r: REG_lista);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;

    if (L = nil) then
        begin
            nue^.sig:= nil;
            L:= nue;
        end
    else
        ult^.sig:= nue;
    ult:= nue;

end;

procedure leer(var p: REG_prestamo);
begin
    write('ISBN: ');readln(p.ISBN);
    if (p.ISBN <> 0) then
        begin
            write('Nro. prestamo: '); readln(p.nroPrestamo);
            write('Nro. socio: '); readln(p.nroSocio);
            write('Dia prestamo: '); readln(p.dia);
        end;
end;

procedure incisos(var L: Lista);
var
    ult: Lista;
    p: REG_prestamo;
    r: REG_lista;
    vc: vectorContador;
    x,min,dia,totalPrestamos,prestamoCondicion: integer;
begin
    for x:=1 to 31 do
        vc[x]:= 0;

    min:= 9999;
    totalPrestamos:= 0;
    prestamoCondicion:= 0;

    leer(p);
    while (p.ISBN <> -1) do
        begin
            r.ISBN:= p.ISBN;
            r.cantPrestamo:= 0;
            while (p.ISBN <> -1) and (r.ISBN = p.ISBN) do
                begin
                    // INCISO A
                    r.cantPrestamo:= r.cantPrestamo + 1;

                    // INCISO B
                    vc[p.dia]:= vc[p.dia] + 1;

                    // INCISO C
                    totalPrestamos:= totalPrestamos + 1;
                    if (p.nroPrestamo mod 2 = 1) and (p.nroSocio mod 2 = 0) then
                        prestamoCondicion:= prestamoCondicion + 1;

                    leer(p);
                end;
            
            // INCISO A
            cargarLista(L,ult,r);
        end;

    // INCISO B
    for x:=1 to 31 do
        if (min > vc[x]) then
            begin
                min:= vc[x];
                dia:= x;
            end;
    writeln('El dia que tuvo menos prestamos es: ',dia);

    // INCISO C
    writeln('El porcentaje de prestamos que cumplen con la condicion es: ',((prestamoCondicion / totalPrestamos) * 100):0:2);
end;


// programa principal
var
    L: Lista;
begin
    L:= nil;
    incisos(L);
end.
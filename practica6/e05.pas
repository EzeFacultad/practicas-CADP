program e05;

type
    REG_producto = record
        cod,stockAct,stockMin: integer;
        descrip: String;
        precio: real;
    end;

    Lista = ^Nodo;
    Nodo = record
        dato: REG_producto;
        sig: Lista;
    end;


procedure crearLista(var L: Lista; r: REG_producto);
var
    nue: Lista;
begin
    new(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
end;

procedure leer(var r: REG_producto);
begin
    write('Cod: '); readln(r.cod);
    if (r.cod <> -1) then
        begin
            write('Stock Act: '); readln(r.stockAct);
            write('Stock Min: '); readln(r.stockMin);
            write('Descripcion: '); readln(r.descrip);
            write('Precio: '); readln(r.precio);
        end;
end;

procedure cargarLista(var L: Lista);
var
    r: REG_producto;
begin
    leer(r);
    while (r.cod <> -1) do
        begin
            crearLista(L,r);
            leer(r);
        end;
end;

function digPares(cod: integer): boolean;
var
    cant: integer;
begin
    cant:= 0;
    while (cod <> 0) and (cant < 3) do
        begin
            if (((cod mod 10) mod 2 ) = 0) then
                cant:= cant + 1;
            
            cod:= cod div 10;
        end;
    
    digPares:= (cod = 3);
end;

procedure incisos(L: Lista);
var
    cantTotal,stockBajo,minCod1,minCod2: integer;
    min1,min2: real;
begin
    cantTotal:= 0;
    stockBajo:= 0;
    min1:= 9999;
    min2:= 9999;

    while (L <> nil) do
        begin
            // INCISO A
            cantTotal:= cantTotal + 1;
            if (L^.dato.stockAct < L^.dato.stockMin) then
                stockBajo:= stockBajo + 1;

            // INCISO B
            if (digPares(L^.dato.cod)) then
                writeln('Descripcion: ',L^.dato.descrip);

            // INCISO C
            if (min1 > L^.dato.precio) then
                begin
                    min2:= min1;
                    minCod2:= minCod1;
                    min1:= L^.dato.precio;
                    minCod1:= L^.dato.cod;
                end
            else
                if (min2 > L^.dato.precio) then
                    begin
                        min2:= L^.dato.precio;
                        minCod2:= L^.dato.cod;
                    end;

            L:= L^.sig;
        end;
    
    // INCISO A
    writeln('El porcentaje de prod. con menos stock act. que minimos es: ',((stockBajo / cantTotal) * 100):0:2);

    // INCISO C
    writeln('El codigo de los 2 productos bajos es: ',minCod1,' y ',minCod2);
end;

// programa principal
var
    L: Lista;
begin
    L:= nil;
    cargarLista(L);
    incisos(L);
end.
program e04;

const
    min = 3.40;
    mb = 1.35;

type
    REG_linea = record
        num,cantMin: integer;
        cantMB: real;
    end;

    REG_cliente = record
        cod,cantLinea: integer;
        lineas: REG_linea;
    end;


// INCISO A
procedure leer(var r: REG_cliente);
var
    x: integer;
begin
    write('Cod cliente: '); readln(r.cod);
    write('Cant. de lineas: '); readln(r.cantLinea);
    for x:=1 to r.cantLinea do
        begin
            write('Num. de telefono: '); readln(r.lineas.num);
            write('Cant. minutos: '); readln(r.lineas.cantMin);
            write('Cant MB: '); readln(r.lineas.cantMB);
        end;
end;

// INICISO B
procedure recibirCliente(r: REG_cliente);
var
    montoTotal,mbTotal: real;
    minTotal,x: integer;
begin
    montoTotal:= 0;
    minTotal:= 0;
    mbTotal:= 0;
    
    for x:=1 to r.cantLinea do
        begin
            minTotal:= minTotal + r.lineas.cantMin;
            mbTotal:= mbTotal + r.lineas.cantMB;
        end;
    
    montoTotal:= (minTotal * min) + (mbTotal * mb); 
    write('El usuario ',r.cod,' uso un total de ',minTotal,'minutos y ',mbTotal,'MB. ');
    writeln('Y el monto a facturar es de $',montoTotal);
end;


// programa principal
var
    r: REG_cliente;
    x: integer;
begin
    for x:=1 to 9300 do
        begin
            leer(r);
            recibirCliente(r);
        end;
end.
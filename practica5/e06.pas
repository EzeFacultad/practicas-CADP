{
6) Realizar un programa que ocupe 50 KB de memoria en total. Para ello:

a) El programa debe utilizar sólo memoria estática

}

program e06a;

type
    REG_Fecha = record
        dia,mes,anio: integer;
    end;

    REG_personas = record
        nombre,apellido,pais: string[29];
        edad,dni,tel: integer;
        fecha: REG_Fecha;
    end;

    vector = array [1..49] of REG_personas;

procedure leer(var v: vector);
var
    r: REG_personas;
begin
    write('Nombre: '); readln(r.nombre);
    write('Apellido: '); readln(r.apellido);
    write('D.N.I: '); readln(r.dni);
    write('Edad: '); readln(r.edad);
    write('Pais origen: '); readln(r.pais);
    write('Fecha de nacimiento:');
    write('Dia: '); readln(r.fecha.dia);
    write('Mes: '); readln(r.fecha.mes);
    write('Anio: '); readln(r.fecha.anio);
    write('Tel: '); readln(r.tel);
end;
  
var
    v: vector;
    x: integer;
begin
    for x:=1 to 49 do
        begin
            writeln('=================');
            leer(v);
        end;
    writeln(sizeof(x),' bytes.');
    writeln(sizeof(v),' bytes.');
end.


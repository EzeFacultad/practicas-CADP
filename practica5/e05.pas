program e05;

type
    TEmpleado = record
        sucursal: char;
        apellido: string[25];
        correoElectronico: string[40];
        sueldo: real;
    end;

    Str50 = string[50];

Var
    alguien: TEmpleado;
    PtrEmpleado: ^TEmpleado;
Begin
    {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
    Readln( alguien.apellido ); // 26

    {Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II) Rta: Se le restó 26}
    New( PtrEmpleado ); // 4

    {¿Cuánta memoria disponible hay ahora? (III) Rta: 399.974 bytes}
    Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido ); // 1 + 26 = 27

    Readln( PtrEmpleado^.correoElectronico, PtrEmpleado^.sueldo ); // 41 + 8 = 49, segun PDF 41 + 4 = 45

    {¿Cuánta memoria disponible hay ahora? (IV) Rta: 399.898}
    Dispose( PtrEmpleado ); // 8, segun PDF 4
    writeln(sizeof(PtrEmpleado));
    {¿Cuánta memoria disponible hay ahora? (V) Rta: 399.890}
end.
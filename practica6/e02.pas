program e02;

type
    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;

    nodo = record
        dato: persona;
        sig: lista;
    end;


// generarLista e imprimirInformacion se declararon de manera local
procedure leerPersona(p: persona); // parámetro pasado por valor
begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
        read(p.apellido);
    end;

    {Carga la lista hasta que llega el dni 0}
    procedure generarLista(var l:lista);
    var
        p:nodo; // debeia definir "p" como persona
    begin
        leerPersona(p);
        while (p.dni <> 0) do begin
            agregarAdelante(l,p); // Pascal no permite invocar un módulo
                                // que no se haya definido antes
                    // no se vuelve a leer otro dato
        end;
    end;

    procedure imprimirInformacion(var l:lista); // se está pasando por referencia
    begin
        while (l <> nil) do begin
            writeln('DNI: ', l^.dato.dni, 'Nombre:',
            l^.nombre, 'Apellido:', l^.apellido); // deberia ser l^.DATO.
            l:= l^.sig;
        end;
    end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona); // deberia pasarse por referencia
var
    aux: lista;
begin
    // no se hizo new(aux)
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;

{Programa principal}
var
    l:lista;
begin
    // lista no inicializada
    generarLista(l);
    imprimirInformacion(l); // está intentando invocar un proceso local
end.
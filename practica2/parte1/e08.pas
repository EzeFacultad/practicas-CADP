program anidamientos;

procedure leer;
    var
        letra : char;

    function analizarLetra : boolean;
        begin
            if (letra >= 'a') and (letra <= 'z') then
                analizarLetra := true
            else
                if (letra >= 'A') and (letra <= 'Z') then
                    analizarletra := false;
        end; { fin de la funcion analizarLetra }

    begin
        readln(letra);
        if (analizarLetra) then
            writeln('Se trata de una minúscula')
        else
            writeln('Se trata de una mayúscula');
    end; { fin del procedure leer}

var
    ok : boolean;
begin { programa principal }
    leer;
    ok := analizarLetra;
    if ok then
        writeln('Gracias, vuelva prontosss');
end.


{
a. La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer, pero esto
puede traer problemas en el código del programa principal.
    i) ¿Qué clase de problema encuentra? 
        Rta: La funcion es local al proceso "leer" lo que solo puede utilizarse dentro de ese proceso
    ii) ¿Cómo se puede resolver el problema para que el programa compile y funcione correctamente?
        Rta: Eliminar las líneas 28, 29 y 30

b. La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable
letra.
    i) ¿De qué valores se trata?
        Rta: Los números y simbolos 
    ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
        Rta: El programa imprime como si se ingresaran minúsculas
    iii) ¿Cómo se puede resolver este problema?
        Rta: Como ahora no solo se tiene encuenta las letras mayúsculas y minúsculas, y ahora hay que tener
        en cuenta los números y simbolos, se deberia devolver 4 respuestas diferentes:
            - Minúsculas
            - Mayúsculas
            - Números
            - Simbolos
        
        Si usamos una función, se podria indicar que devuelva un numero de 1 a 4 y dependiendo del valor
        va a ser una de las 4 opciones.
        
        Además habria que agregar:
        else
            if (letra >= '0') and (letra <= '9') then
                writeln('es numero')
            else
                writeln('es simbolo');
}
{
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo.
}
program e04;

// Rta: se reciben mal los parámetros.
procedure leerDatos(var legajo: integer; salario : real);
    begin
        writeln('Ingrese el nro de legajo y el salario');
        read(legajo);
        read(salario);
    end;

procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
    var
        maxSalario : real;
    begin
        if (nuevoLegajo > maxLegajo) then begin
            maxLegajo:= nuevoLegajo;
            // Rta: el maxSalario está declarado de manera local y se pierde el valor al salir.
            maxSalario := nuevoSalario
        end;
    end;

var
    legajo, maxLegajo, i : integer;
    salario, maxSalario : real;
begin
    sumaSalarios := 0; // Rta: no se declaró la variable.
    for i := 1 to 130 do begin
        leerDatos(salario, legajo); // Rta: orden de parámetros mal.
        actualizarMaximo(legajo, salario, maxLegajo);
        sumaSalarios := sumaSalarios + salario;
    end;
    writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
    // Rta: se imprime maxSalario que no se le asignó ningun valor.
    writeln('El salario del empleado más nuevo es ',maxSalario);
end.
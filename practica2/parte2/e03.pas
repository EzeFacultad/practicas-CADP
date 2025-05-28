program Ejercicio3;

{ suma los números entre a y b, y retorna el resultado en c }
// Rta: C deberia ser una variable y pasarse por referencia
procedure sumar(a, b, c : integer);
    var
        suma : integer;
    begin
        // Rta: deberia verificarse si a < b
        for i := a to b do // Rta: i sin declararse
            suma := suma + i;
        c := c + suma; 
        // Rta: no se puede guardar en un número
        // Rta: no deberia sumar c al resultado
    end;

var
    resultado : integer;
begin
    resultado := 0;
    readln(a); readln(b); // Rta: a y b sin declarar
    sumar(a, b, 0); // Rta: se pasa un número en vez de la variable c
    // Rta: a resultado no se le asigno el resultado de la suma
    write('La suma total es ',resultado);
    { averigua si el resultado final estuvo entre 10 y 30}
    // Rta: no está definida la variable ok
    ok := (resultado >= 10) or (resultado <= 30); 
    if (not ok) then
        write ('La suma no quedó entre 10 y 30');
end.
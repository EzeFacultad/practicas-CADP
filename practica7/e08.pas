program e08;
const
	minMotivo = 1;
	maxMotivo = 7;
type
	codigosMotivo = minMotivo..maxMotivo;

	fechas = record
		dia, mes, anio : integer;
	end;
	
	transferencia = record
		nroOrigen, dniOrigen, nroDestino, dniDestino : integer;
		fecha : fechas;
		hora : strign;
		monto : real;
		codMotivo : codigosMotivo;
	end;

	lista = ^nodo;
	nodo = record
		dato : transferencia;
		sig : lista;
	end;
	
	codTransfeTerceros = array [codigosMotivo] of integer;


procedure cargarLista1 (var L : lista); // se dispone
begin
end;

procedure insertarOrdenado (var L : lista; t : transferencia);
var
	nuevo, anterior, actual : lista;
begin
	new (nuevo);
	nuevo^.dato := t;
	anterior := L;
	actual := L;
	
	while (L <> nil) and (t.nroOrigen < L^.dato.nroOrigen) do begin
		anterior := actual;
		actual := actual^.sig;
	end;

	if (anterior = actual) then
		L := nuevo
	else
		anterior^.sig := actual;
	nuevo^.sig := actual;
end;

procedure cargarNuevaLista (var L2: lista; L1: lista);
begin
	while (L1 <> nil) do begin
		if (L1^.dato.nroOrigen <> L1^.dato.nroDestino) then
			insertarOrdenado(L2,L1^.dato);
		
		L1:= L1^.sig;
	end;
end;

function menosParesQueImpares (nroDestino: integer) : boolean;
var
	dig, pares, impares : integer;
begin
	pares := 0;
	impares := 0;
	while (nroDestino <> 0) do begin
		dig := nroDestino MOD 10;
		if ((dig MOD 2) = 0) then
			pares := pares + 1
		else
			impares := impares + 1;
		nroDestino := nroDestino DIV 10;
	end;
	menosParesQueImpares := (pares < impares);
end;

procedure inicializarVectorContador (var v : codTransfeTerceros);
var
	i : integer;
begin
	for i := minMotivo to maxMotivo do 
		v[i] := 0;
end;

procedure recorrerVector(v: codTransfeTerceros);
var
	x,max,codMax: integer;
begin
	max:= 0;
	for x:=1 to 7 do
		if (max < v[x]) then
			begin
				max:= v[x];
				codMax:= x;
			end;
	
	writeln('El codigo de motivos con mas transeferencias es: ',codMax);
end;

procedure procesarNuevaLista (L : lista; var v : codTransfeTerceros);
var
	totalTerceros : real;
	actualOrigen, maxTerceros, codMax, junioMenosPares : integer;
begin
	maxTerceros := -9999;
	junioMenosPares := 0;
	while (L <> nil) do begin
		totalTerceros := 0;

		actualOrigen := L^.dato.nroOrigen;
		while (L <> nil) and (actualOrigen = L^.dato.nroOrigen) do
			begin
				// INCISO B
				totalTerceros := totalTerceros + L^.dato.monto;
				
				// INCISO C
				v[L^.dato.codMotivo] := v[L^.dato.codMotivo] + 1;
				
				// INCISO D
				if (L^.dato.fecha.mes = 6) and (menosParesQueImpares(L^.dato.nroDestino)) THEN
					junioMenosPares := junioMenosPares + 1;

				L := L^.sig;
			end;

		// INCISO B
		writeln('El monto total transferido a terceros de la cuenta origen ', actualOrigen, ' es ', totalTerceros);

	end;

	// INCISO C
	recorrerVector(v);

	// INCISO D
	writeln('Cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos dígitos pares que impares: ', junioMenosPares);
end;

var
	L1, L2 : lista;
	v : codTransfeTerceros;
begin
	L1 := nil;
	L2 := nil;
	cargarLista(L1); // se dispone
	cargarNuevaLista(L2, L1);
	inicializarVectorContador(v);
	procesarNuevaLista(L2, v);
end.
:-use_module('TDAjugador.pl').



%TDA juego constructor
juego(Jugadores,Tablero,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaximoCasas,MaximoHoteles,
	[Jugadores,Tablero,DineroBanco,NumeroDados,TurnoActual,TasaImpuesto,MaximoCasas,MaximoHoteles]).
%Agregar jugadadres
juegoAgregarJugadores([JugadoresIn, Tablero, DineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles],JugadorNuevo,[JugadoresOut, Tablero, NuevoDineroBanco, Dados, Turno, TasaImpuesto, MaxCasas, MaxHoteles]):-
    jugadorNuevoDinero(JugadorNuevo, 1500, JugadorConDinero),
    append(JugadoresIn, [JugadorConDinero], JugadoresOut),
    NuevoDineroBanco is DineroBanco - 1500.

%%getter de juego TurnoActual
juegoObtenerJugadorActual(JuegoIn,JugadorActual):-
        juego(Jugadores, _, _, _, TurnoActual, _, _, _, JuegoIn),
        nth0(TurnoActual, Jugadores, JugadorActual).
%me lo entrega pero lo entrega al inicio tipo hayq ue pasarle todo el texto de una y no consulta por consulta

%voy con el lanzar dados
% Predicado myRandom
myRandom(Xn, Xn1):-
  Xn1 is ((1103515245 * Xn) + 12345) mod 2147483648).
% Predicado getDadoRandom que recibe la semilla y controla los resultados
getDadoRandom( Seed, NvaSeed, R):-
    myRandom( Seed, NvaSeed),
    R is 1 + (NvaSeed mod 6).

% Valores de referencia seed para retornar entre 1 a 6
% retorna R=1 y NvoSeed=1187151906
getDadoRandom(112, NvoSeed, R).

% retorna R=2 y NvoSeed=851444701
getDadoRandom(822, NvoSeed,R). 

% retorna R=3 y NvoSeed=187537622
getDadoRandom(231139, NvoSeed, R).

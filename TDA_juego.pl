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
juegoObtenerTurnoActual([_,_,_,_,TurnoActual,_,_,_],TurnoActual).
%me esta entregando en indice, me falta que me buscar el jugador y que me entrege el jugador.

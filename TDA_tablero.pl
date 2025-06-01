
:- module(tdatablero, [tablero/5,tableroGetPropiedades/2,tableroGetCartasSuerte/2,tableroGetCartasComunidad/2,tableroGetCasillasEspeciales/2,tableroActualizarPropiedades/3,tableroSetListaPropiedades/3,tableroActualizarJugadores/3]).
:-use_module('TDA_propiedad',[propiedadGetId/2]).
:- use_module('TDA_jugador.pl', [jugadorGetId/2]).


%propiedades (lista) X cartas-suerte (lista) X cartas-comunidad (lista) X casillas-especiales (lista) X tablero (board)
tablero(Propiedades,CartasSuerte,CartasComunidad,CasillasEspeciales,[Propiedades,CartasSuerte,CartasComunidad,CasillasEspeciales]).

%necesito hacer un append a la parte de propiedades y que me devuelva el tablero modificado
tableroAgregarPropiedades(TableroIN, Propiedades, TableroOUT) :-
    tablero(PropiedadesIN, CartasSuerte, CartaComunidad, CasillasEspeciales, TableroIN),
    append(PropiedadesIN, Propiedades, PropiedadesOUT),
    tablero(PropiedadesOUT, CartasSuerte, CartaComunidad, CasillasEspeciales, TableroOUT).
%SOLO PARA QUE CUENTE EL COMMIT DEBO ELIMINAR ESTO LUEGO
%%getteerr
tableroGetPropiedades([Propiedades|_],Propiedades).
tableroGetCartasSuerte([_,CartasSuerte|_],CartasSuerte).
tableroGetCartasComunidad([_,_,CartasComunidad|_],CartasComunidad).
tableroGetCasillasEspeciales([_,_,_,CasillasEspeciales|_],CasillasEspeciales).
%SETTER


tableroSetListaPropiedades(TableroIn,NewListaPropiedades,TableroOut):-
    tableroGetCartasSuerte(TableroIn,CartasSuerteOut),
    tableroGetCartasComunidad(TableroIn,CartasComunidadOut),
    tableroGetCasillasEspeciales(TableroIn,CasillasEspecialesOut),
    tablero(NewListaPropiedades,CartasSuerteOut,CartasComunidadOut,CasillasEspecialesOut,TableroOut).

%hecho por mi con recursion 
tableroActualizarPropiedades([],_,[]).% caso base

tableroActualizarPropiedades([PrimeraPropiedad|RestoPropiedades],PropiedadIn,[PropiedadIn|RestoPropiedades]):-
  propiedadGetId(PropiedadIn,IdPropiedadIn),
  propiedadGetId(PrimeraPropiedad,IdPrimeraPropiedad),
  IdPrimeraPropiedad =:= IdPropiedadIn, 
  !.

tableroActualizarPropiedades([PrimeraPropiedad|RestoPropiedades],PropiedadIn,[PrimeraPropiedad|ListaPropiedadesActualizadas]):-
  tableroActualizarPropiedades(RestoPropiedades,PropiedadIn,ListaPropiedadesActualizadas).

tableroActualizarJugadores([],_,[]).
tableroActualizarJugadores([PrimerJugador|RestoJugadores],JugadorIn,[JugadorIn|RestoJugadores]):-
    jugadorGetId(JugadorIn,IdJugadorIn),
    jugadorGetId(PrimerJugador,IdPrimerJugador),
    IdPrimerJugador=IdJugadorIn,
     !.
tableroActualizarJugadores([PrimerJugador|RestoJugadores],JugadorIn,[PrimerJugador|ListaJugadoresActualizada]):-
    tableroActualizarJugadores(RestoJugadores,JugadorIn,ListaJugadoresActualizada).
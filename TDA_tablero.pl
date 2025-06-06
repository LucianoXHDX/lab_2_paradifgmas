:- module(tdatablero, [
    tablero/5,
    tableroGetPropiedades/2,
    tableroGetCartasSuerte/2,
    tableroGetCartasComunidad/2,
    tableroGetCasillasEspeciales/2,
    tableroAgregarPropiedades/3,
    tableroSetListaPropiedades/3,
    tableroSetListaCartasComunidad/3,
    tableroSetListaCartasSuerte/3,
    tableroActualizarPropiedades/3,
    tableroActualizarJugadores/3,
    tableroActualizarCartas/3,
    tableroGetPropiedad/3,
    tableroExtraerPropiedad/2
]).

:- use_module('TDA_propiedad.pl', [propiedadGetId/2]).
:- use_module('TDA_jugador.pl', [jugadorGetId/2]).
:- use_module('TDA_carta.pl', [cartaGetID/2]).
/* -----------------------------------------| 
|                                           |
|                                           |
|             COMENTADA CORECTAMENTE        |
|                                           |
|-------------------------------------------|
*/

%Descripcion:Es el constructor del TDA tablero, genera una lista que representa el tablero del juego
%Dominio:Propiedades(list)XCartasSuerte(list)XCartasComunidad(list)XCasillasEspeciales(list)
%Recorrido:Tablero(list), con los parametros señalados en el dominio
%Tipo de algoritmo: constructor
%propiedades (lista) X cartas-suerte (lista) X cartas-comunidad (lista) X casillas-especiales (lista) X tablero (board)
tablero(Propiedades,CartasSuerte,CartasComunidad,CasillasEspeciales,[Propiedades,CartasSuerte,CartasComunidad,CasillasEspeciales]).

%necesito hacer un append a la parte de propiedades y que me devuelva el tablero modificado
% Descripción: Esta funcion permite agregar propiedades a un tablero, devuelve un nuvo tablero con todos los parametros iguales excepto la lsita de propiedades que fue actualizada
% Dominio: TableroIn (list) X Propiedades (list)
% Recorrido: TableroOut (list)
% Tipo de algoritmo: Actualizacion de estructura
tableroAgregarPropiedades(TableroIn, Propiedades, TableroOut) :-
    tableroGetPropiedades(TableroIn, PropiedadesIn),
    tableroGetCartasSuerte(TableroIn, CartasSuerte),
    tableroGetCartasComunidad(TableroIn, CartasComunidad),
    tableroGetCasillasEspeciales(TableroIn, CasillasEspeciales),
    append(PropiedadesIn, Propiedades, PropiedadesOut),
    
    tablero(PropiedadesOut, CartasSuerte, CartasComunidad, CasillasEspeciales, TableroOut).

%%getteerr
%Descripcion:Esta funcion entrega las lista de propiedades que estan en la lista del tablero que representa el tabelero del juego
%Dominio:Tablero(list)
%Recorrido:Propiedades(list)
%Tipo de algoritmo:Acceso a un elemento de la lista
tableroGetPropiedades([Propiedades|_],Propiedades).

%Descripcion:Esta funcion entrega las lista de las cartas de suerte que estan en la lista del tablero que representa el tabelero del juego
%Dominio:Tablero(list)
%Recorrido:CartasSuerte(list)
%Tipo de algoritmo:Acceso a un elemento de la lista
tableroGetCartasSuerte([_,CartasSuerte|_],CartasSuerte).

%Descripcion:Esta funcion entrega las lista de las cartas de la comunidad que estan en la lista del tablero que representa el tabelero del juego
%Dominio:Tablero(list)
%Recorrido:CartasComunidad(list)
%Tipo de algoritmo:Acceso a un elemento de la lista
tableroGetCartasComunidad([_,_,CartasComunidad|_],CartasComunidad).

%Descripcion:Esta funcion entrega las lista de las casillas especiales que estan en la lista del tablero que representa el tabelero del juego
%Dominio:Tablero(list)
%Recorrido:CasillasEspeciales(list)
%Tipo de algoritmo:Acceso a un elemento de la lista
tableroGetCasillasEspeciales([_,_,_,CasillasEspeciales|_],CasillasEspeciales).







%Descripcion:Esta funcion crea un nuevo tablero con todos los parametros iguales excepto la lista de propiedades que uno de los argumentos que se le pasa  a la funcion
%Dominio:TableroIn(list)XNuevaListaPropiedades(list)
%Recorrido:TableroOut(list)
%Tipo de algoritmo:
tableroSetListaPropiedades(TableroIn,NewListaPropiedades,TableroOut):-
    tableroGetCartasSuerte(TableroIn,CartasSuerteOut),
    tableroGetCartasComunidad(TableroIn,CartasComunidadOut),
    tableroGetCasillasEspeciales(TableroIn,CasillasEspecialesOut),
    tablero(NewListaPropiedades,CartasSuerteOut,CartasComunidadOut,CasillasEspecialesOut,TableroOut).

%Descripcion:Esta funcion es para poder agregar las cartas de comunidad a la lista que representa el tablero
%Dominio:TableroIn(list)XNewCartasComunida(list)
%Recorrido:TableroOut(list)
%Tipo de algoritmo:Modificado
tableroSetListaCartasComunidad(TableroIn,NewCartasComunidad,TableroOut):-
  tableroGetPropiedades(TableroIn,Propiedades),
  tableroGetCartasSuerte(TableroIn,CartasSuerte),
  tableroGetCasillasEspeciales(TableroIn,CasillasEspeciales),
  tablero(Propiedades,CartasSuerte,NewCartasComunidad,CasillasEspeciales,TableroOut).

%Descripcion:Esta funcion es para poder agregar las cartas de suerte a la lista que representa el tablero
%Dominio:TableroIn(list)XNewCartasSuerte(list)
%Recorrido:TableroOut(list)
%Tipo de algoritmo:Modificador
tableroSetListaCartasSuerte(TableroIn,NewCartasSuerte,TableroOut):-
  tableroGetPropiedades(TableroIn,Propiedades),
  tableroGetCartasComunidad(TableroIn,CartasComunidad),
  tableroGetCasillasEspeciales(TableroIn,CasillasEspeciales),
  tablero(Propiedades,NewCartasSuerte,CartasComunidad,CasillasEspeciales,TableroOut).





%hecho por mi con recursion 
%Descripcion:Esta función reemplaza una propiedad dentro de una lista de propiedades por una versión modificada,
%              buscando por coincidencia de ID. Si encuentra una propiedad con el mismo ID, la reemplaza y
%              retorna la nueva lista de propiedades actualizada. Si no la encuentra, mantiene las propiedades igual.
%Dominio: ListaPropiedades (list) X PropiedadModificada (list)
%Recorrido:  ListaPropiedadesActualizada (list)
%Tipo de algoritmo:
tableroActualizarPropiedades([],_,[]).% caso base

tableroActualizarPropiedades([[PrimeraPropiedad,Pos]|RestoPropiedades],PropiedadIn,[[PropiedadIn,Pos]|RestoPropiedades]):-
  propiedadGetId(PropiedadIn,IdPropiedadIn),
  propiedadGetId(PrimeraPropiedad,IdPrimeraPropiedad),
  IdPrimeraPropiedad =:= IdPropiedadIn, 
  !.

tableroActualizarPropiedades([[PrimeraPropiedad,Pos]|RestoPropiedades],PropiedadIn,[[PrimeraPropiedad,Pos]|ListaPropiedadesActualizadas]):-
  tableroActualizarPropiedades(RestoPropiedades,PropiedadIn,ListaPropiedadesActualizadas).
%otra funcion
%Descripcion:Esta función reemplaza un jugador dentro de una lista de jugadores por una versión modificada,
%              buscando por coincidencia de ID. Si encuentra un jugador con el mismo ID, lo reemplaza y
%              retorna la nueva lista actualizada. El resto de los jugadores se mantienen igual.

%Dominio:ListaJugadores (list) X JugadorModificado (list)
%Recorrido:LstaJugadoresActualizada (list)
%Tipo de algoritmo: Recursion
tableroActualizarJugadores([],_,[]).
tableroActualizarJugadores([PrimerJugador|RestoJugadores],JugadorIn,[JugadorIn|RestoJugadores]):-
    jugadorGetId(JugadorIn,IdJugadorIn),
    jugadorGetId(PrimerJugador,IdPrimerJugador),
    IdPrimerJugador=IdJugadorIn,
     !.
tableroActualizarJugadores([PrimerJugador|RestoJugadores],JugadorIn,[PrimerJugador|ListaJugadoresActualizada]):-
    tableroActualizarJugadores(RestoJugadores,JugadorIn,ListaJugadoresActualizada).


%FUNCIOANANDO
tableroActualizarCartas([],_,[]).
tableroActualizarCartas([PrimeraCarta|RestoCartas],CartaEliminar,ListaEliminada):-
  cartaGetID(CartaEliminar,IdCartaEliminar),
  cartaGetID(PrimeraCarta,IdPrimeracarta),
  IdCartaEliminar==IdPrimeracarta,
  !,
  tableroActualizarCartas(RestoCartas,CartaEliminar,ListaEliminada).

tableroActualizarCartas([PrimeraCarta|RestoCartas],CartaEliminar,[PrimeraCarta|ListaCartasSuerteActualizadas]):-
  tableroActualizarCartas(RestoCartas,CartaEliminar,ListaCartasSuerteActualizadas).


%Descripcion:Esta funcion sirve para obtener una propiedad buscada por su id, para esto se la pasa el tablero y el id de la propiedad que quiero buscar y devuleve la propiedad

%Dominio:TableroIn(list)XIDPropiedad(int)
%Recorrido:Propiedad(list)
%Tipo de algoritmo: Acceso a un elemento
tableroGetPropiedad(TableroIn, IdPropiedad, PropiedadOut):-
  tableroGetPropiedades(TableroIn, ListaPropiedades),
  Indice is IdPropiedad-1,
  nth0(Indice, ListaPropiedades, PropiedadOut),
  [PropiedadOut|_].

%para ignorar la posicion
tableroExtraerPropiedad([Propiedad, _], Propiedad).
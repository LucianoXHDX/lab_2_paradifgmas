
:- module(tdajugador, [
    jugador/8,
    jugadorGetId/2,
    jugadorGetNombre/2,
    jugadorGetDinero/2,
    jugadorGetPropiedades/2,
    jugadorGetPosicionActual/2,
    jugadorGetEstaEnCarcel/2,
    jugadorGetTotalCartasSalirCarcel/2,
    jugadorSetDinero/3,
    jugadorNuevoDinero/3,
    jugadorSumarPosicion/3,
    jugadorComprarPropiedad/4,
    jugadorEstaEnBancarrota/1,
    jugadorPagarRenta/5
]).

:- use_module('TDA_propiedad.pl', [propiedad/9, propiedadGetId/2]).
%COMENTADA CORRECTAMENTE


/*id (int) X nombre (string) X dinero (int) X propiedades (list id's)
 X posicionActual (int) X estaEnCarcel (boolean) X totalCartasSalirCarcel (int) X jugador (TDA player)*/

%Descripcion: Es el constructor del TDA jugador, genera una lista que representa un jugador
%Dominio: Id(int)XNombre(string)XDinero(int)XPropiedades(list id's)XPosicionActual(int)XEstaEnCarcel(boolean)XTotalCartasSalirCarcel (int)
%Recorrido:Jugador(list), con los parametros señalados en el dominio.
%Tipo de algoritmo:constructor

jugador(Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,
        [Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]).
%setter de dinero, propiedades, posicion actual esta en carcel y total de cartas
%setter dinero

%Descripcion:Esta función obtiene el identificador (Id) del jugador desde la lista que representa al jugador.
%Dominio:Jugador(list)
%Recorrido:Id(int)
%Tipo de algoritmo:Acceso a un elemnto de la lista
jugadorGetId([Id|_],Id).

%Descripcion: Esta funcion obtiene el nombre del jugador desde la lista que representa al jugador
%Dominio:Jugador(list)
%Recorrido:Nombre(string)
%Tipo de algoritmo:Acceso a un elemento de la lista

jugadorGetNombre([_,Nombre|_],Nombre).

%Descripcion: Esta funcion obtiene el Dinero del jugador desde la lista que representa al jugador.
%Dominio:Jugador(list)
%Recorrido:Dinero(int)
%Tipo de algoritmo:Acceso a un elemto de la lista
jugadorGetDinero([_,_,Dinero|_],Dinero).

%Descripcion:Esta funcion obtiene la lista de propiedades del jugador desde la lista que representa al jugador.
%Dominio:Jugador(list)
%Recorrido:Propiedades(list)
%Tipo de algoritmo:Acceso a un elemento de la lista
jugadorGetPropiedades([_,_,_,Propiedades|_],Propiedades).

%Descripcion:Esta funcion obtiene la posicion actual del jugador desde la lista que representa al jugador.
%Dominio:Jugador(list)
%Recorrido:PosicionActual(int)
%Tipo de algoritmo:Acceso a un elemento de la lista.
jugadorGetPosicionActual([_,_,_,_,PosicionActual|_],PosicionActual).

%Descripcion:Esta funcion obtiene EstaEnCarcel(bool) del jugador de la lista que representa al jugador, entrega verdadero si el jugador esta en la carcel, y falso en el caso contrario.
%Dominio:Jugador(list)
%Recorrido:EstaEnCarcel(bool)
%Tipo de algoritmo:Acceso a un elemento de la lista
jugadorGetEstaEnCarcel([_,_,_,_,_,EstaEnCarcel|_],EstaEnCarcel).

%Descripcion:Esta funcion obtiene la cant de cartas que tiene el jugador para salir de la carce, desde la lista que representa al jugador
%Dominio:Jugador(list)
%Recorrido:TotalCartasSalirCarcel(int)
%Tipo de algoritmo:Acceso a un elemento de la lista
jugadorGetTotalCartasSalirCarcel([_,_,_,_,_,_,TotalCartasSalirCarcel|_],TotalCartasSalirCarcel).

% Descripción: Esta función modifica el dinero de un jugador sumandole una ganancia. 
%              Devuelve un nuevo jugador con el dinero actualizado y el resto de atributos iguales.
% Dominio: Jugador (list) X Ganancia (int)
% Recorrido: JugadorModificado (list)
%Tipo de algoritmo: Actualizacion de estructura
jugadorSetDinero([Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel],
                 Ganancia,
                 [Id, Nombre, NuevoDinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]) :-
    NuevoDinero is Dinero + Ganancia.


%Descripcion:Esta funcion modifca el dinero de un jugador, eliminando el dinero anterior y cambiandolo por el nuevo dinero.
%            Devuelve un nuevo jugador con el nuevo dinero y el resto de atributos iguales,esto me sirve para la funcionalidades de las cartas
%Dominio:Jugador(list)XNuevaPlata(int)
%Recorrido:JugadorMoficado(list)
%Tipo de algoritmo:Modificador de elemento en la estructura
jugadorNuevoDinero([Id, Nombre, _, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel], NuevaPlata,[Id, Nombre, NuevaPlata, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]).
 

%Descripcion:Esta funcion modifica la posicion actual del jugador sumandole la cantidad que debe avanzar, 
%            devuelve un nuevo jugador con la posicion actual modificada y el resto de atributos iguales 
%Dominio:Jugador(list)XCantAvanza(int)
%Recorrido:JugadorModificado(list)
%Tipo de algoritmo:Modificado de elemento en la estructura
jugadorSumarPosicion([Id,Nombre,Dinero,Propiedades,PosicionActual,EstaEnCarcel,TotalCartasSalirCarcel],
                        CantAvanza,
                        [Id,Nombre,Dinero,Propiedades,NuevaPosicion,EstaEnCarcel,TotalCartasSalirCarcel]):-
                        NuevaPosicion is PosicionActual + CantAvanza .

%Descripcion:Esta funcion permite al jugador comprar una propiedad(si tiene el dinero suficiente), crea un nuevo jugador
%            con todo los parametro iguales excepto el dinero que fue descontado por la compra y la lista de propiedades que ahora tiene una nueva propiedad
%            Tambien crea una nueva propiedad con el id del jugador como dueño
%Dominio:Jugador(list)XPropiedad(list)
%Recorrido:JugadorModificado(list)XPropiedadModificada(list)
%Tipo de algoritmo:modificador de estructuas
jugadorComprarPropiedad(JugadorIn,PropiedadIn,PropiedadOut,JugadorOut):-
        jugador(IdJugador, NombreJugador, _, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,JugadorIn),
        propiedad(IdPropiedad,NombrePropiedad,Precio,Renta,_Duenno,Casas,EsHotel,EstaHipotecada,PropiedadIn),
        jugadorGetDinero(JugadorIn,DineroJugador),
        DineroJugador>=Precio,%puede comprar la propiedad
        jugadorSetDinero(JugadorIn,-Precio,JugadorConDineroActualizado),
        jugador(_, _, NuevoDinero, _, _, _, _, JugadorConDineroActualizado),
        propiedad(IdPropiedad,NombrePropiedad,Precio,Renta,IdJugador,Casas,EsHotel,EstaHipotecada,PropiedadOut),
        append(Propiedades,[IdPropiedad],NuevasPropiedades),
        jugador(IdJugador, NombreJugador, NuevoDinero, NuevasPropiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,JugadorOut). 


%Descripcion: Esta funcion permite verificar si el jugador esta en bancarrota, el jugador esta en bancarrota si su dinero es menor o igual a 0, en ese caso devuelve true
%Dominio:Jugador(list)
%Recorrido:Bool(true si esta en bancarrota)
%Tipo de algoritmo: verificacion de parametro
jugadorEstaEnBancarrota(JugadorIn):-
        jugadorGetDinero(JugadorIn,DineroJugador),
        DineroJugador =< 0.
%verdadero si esta en bancarrota



%Descripcion: Esta funcion permite que un jugador le pague la renta o monto a otro
%Dominio:JugadorPagadorIn(list)XJugadorReceptorIn(list)XMonto(int)
%Recorrido:JugadorPagadorOut(list)XJugadorReceptorOut(list)
%Tipo de algoritmo: modificador

jugadorPagarRenta(JugadorPagadorIn,JugadorReceptorIn,Monto,JugadorPagadorOut,JugadorReceptorOut):-
        jugadorSetDinero(JugadorReceptorIn,Monto,JugadorReceptorOut),%es el jugador que recibe el dinero
        jugadorSetDinero(JugadorPagadorIn,-Monto,JugadorPagadorOut).%es el jugador que debe pagar

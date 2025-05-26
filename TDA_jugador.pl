:-module(TDAjugador,[jugador/8,jugadorSetDinero/3,jugadorNuevoDinero/3]).

/*id (int) X nombre (string) X dinero (int) X propiedades (list id's)
 X posicionActual (int) X estaEnCarcel (boolean) X totalCartasSalirCarcel (int) X jugador (TDA player)*/


jugador(Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel,
        [Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]).

%setter de dinero, propiedades, posicion actual esta en carcel y total de cartas
%setter dinero

jugadorSetDinero([Id, Nombre, Dinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel],
                 Cambio,
                 [Id, Nombre, NuevoDinero, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]) :-
    NuevoDinero is Dinero + Cambio.


jugadorNuevoDinero([Id, Nombre, _, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel], NuevaPlata,[Id, Nombre, NuevaPlata, Propiedades, PosicionActual, EstaEnCarcel, TotalCartasSalirCarcel]).

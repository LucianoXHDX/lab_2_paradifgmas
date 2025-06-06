
/* -----------------------------------------| 
|                                           |
|                                           |
|             COMENTADA CORECTAMENTE        |
|                                           |
|-------------------------------------------|
*/

:- module(tda_carta, [
    carta/5,
    cartaGetID/2,
    cartaGetDescripcion/2,
    cartaGetAccion/2
]).
%Descripcion:Es el constructor del TDA carta, genera una lista que representa una carta para el juego.
%Dominio:Id(int)XTipo(string)XDescripcion(string)XAccion(String)
%Recorrido:Carta(lista con los parametros de arriba)
%Tipo de algoritmo: constructor.
carta(Id,Tipo,Descripcion,Accion,[Id,Tipo,Descripcion,Accion]).

%Descripcion:Esta funcion obtiene el identificador(ID) desde la lista que representa la carta
%Dominio:Carta(list)
%Recorrido:ID(int)
%Tipo de algoritmo:Acceso a un elmento de la lista
cartaGetID([ID|_],ID).

%Descripcion:Esta funcion obtiene la descripcion de lo que hace la carta desde la lista que representa la carta
%Dominio:Carta(list)
%Recorrido:Descripcion(string)
%Tipo de algoritmo:Acceso a un elmento de la lista
cartaGetDescripcion([_,_,Descripcion|_],Descripcion).
%Descripcion:Esta funcion obtiene la accion de lo que hace la carta desde la lista que representa la carta
%Dominio:Carta(list)
%Recorrido:Accion(string)
%Tipo de algoritmo:Acceso a un elmento de la lista

cartaGetAccion([_,_,_,Accion|_],Accion).

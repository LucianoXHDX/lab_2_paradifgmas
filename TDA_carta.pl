
/* -----------------------------------------| 
|                                           |
|                                           |
|             COMENTADA CORECTAMENTE        |
|                                           |
|-------------------------------------------|
*/
:-module(tdacarta,[carta/5,cartaGetID/2]).
%esta correctamente comentada pero me falta la parte de que se pueda extraer una carta ahi saldran mas funciones
%FALTA PORDER EXTRAER LAS CARTAS PARA EL RF
%Id (int) X tipo (string) X descripcion (string) X accion (predicado) X carta (card)

%Descripcion:Es el constructor del TDA carta, genera una lista que representa una carta para el juego.
%Dominio:Id(int)XTipo(string)XDescripcion(string)XAccion(String)
%Recorrido:Carta(lista con los parametros de arriba)
%Tipo de algoritmo: constructor.
carta(Id,Tipo,Descripcion,Accion,[Id,Tipo,Descripcion,Accion]).

%Descripcion:
%Dominio:
%Recorrido:
%Tipo de algoritmo:
cartaGetID([ID|_],ID).
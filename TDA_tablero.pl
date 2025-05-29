
:- module(tdatablero,[tablero/5]).


%propiedades (lista) X cartas-suerte (lista) X cartas-comunidad (lista) X casillas-especiales (lista) X tablero (board)
tablero(Propiedades,CartasSuerte,CartaComunidad,CasillasEspeciales,[Propiedades,CartasSuerte,CartaComunidad,CasillasEspeciales]).

%necesito hacer un append a la parte de propiedades y que me devuelva el tablero modificado
tableroAgregarPropiedades(TableroIN, Propiedades, TableroOUT) :-
    tablero(PropiedadesIN, CartasSuerte, CartaComunidad, CasillasEspeciales, TableroIN),
    append(PropiedadesIN, Propiedades, PropiedadesOUT),
    tablero(PropiedadesOUT, CartasSuerte, CartaComunidad, CasillasEspeciales, TableroOUT).
%SOLO PARA QUE CUENTE EL COMMIT DEBO ELIMINAR ESTO LUEGO

entretenimiento(cine).
entretenimiento(teatro).
entretenimiento(pool).
entretenimiento(parqueTematico).
costo(cine, 30).
costo(teatro, 40).
costo(pool, 15).
costo(parqueTematico, 50).

entretenimientos(Dinero, ListaEntretenimientos):- 
    findall(Entre, entretenimiento(Entre), Lista), 
    combinatoria(Lista, Dinero,  ListaEntretenimientos).

combinatoria([], _, []).
combinatoria([Entre|Resto], Dinero, [Entre|RestoEntrete]):-costo(Entre, Costo), 
   Costo =< Dinero, DineroRestante is Dinero - Costo, 
   combinatoria(Resto, DineroRestante, RestoEntrete).
combinatoria([_|Resto], Dinero, Lista):-combinatoria(Resto, Dinero, Lista).


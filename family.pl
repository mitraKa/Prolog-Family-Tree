/*Facts*/

male(bill).
male(john).
male(frank).
male(joe).
male(larrie).
male(philip).
male(kevin).
male(chris).
male(danny).

female(anne).
female(dorothy).
female(sharon).
female(rochelle).
female(danelle).
female(marg).
female(connie).
female(corrie).

parent(bill,john).
parent(bill,frank).
parent(bill,joe).
parent(anne,john).
parent(anne,frank).
parent(anne,joe).
parent(john,larrie).
parent(john,sharon).
parent(john,philip).
parent(john,kevin).
parent(dorothy,larrie).
parent(dorothy,sharon).
parent(dorothy,philip).
parent(dorothy,kevin).
parent(larrie,connie).
parent(larrie,corrie).
parent(larrie,chris).
parent(marg,connie).
parent(marg,corrie).
parent(marg,chris).
parent(danny,rochelle).
parent(danny,danelle).
parent(sharon,rochelle).
parent(sharon,danelle).


/*Rules*/
father(X,Y) :- male(X),
               parent(X,Y).

mother(X,Y) :-
             female(X),
			 parent(X,Y).

son(X,Y) :-
         male(X),
		 parent(Y,X).

daughter(X,Y) :-
              female(X),
			  parent(Y,X).

 brother(X,Y) :-
               son(X,Z),
			   son(Y,Z).

 sister(X,Y) :-
              daughter(X,Z),
			  daughter(Y,Z).


grandfather(X,Y) :-
                  father(X,Z),
				  parent(Z,Y).

grandmother(X,Y) :-
                  mother(X,Z),
				  parent(Z,Y).

grandson(X,Y) :-
                 son(X,Z),
				(son(Z,Y) ; daughter(Z,Y)).

granddaughter(X,Y) :-
                 daughter(X,Z),
				 (son(Z,Y) ; daughter(Z,Y)).

uncle(X,Y) :-
             brother(X,Z),
			 parent(Z,Y).

aunt(X,Y)  :-
            sister(X,Z),
			parent(Z,Y).

nephew(X,Y) :-
            son(X,Z),
			(sister(Z,Y) ; brother(Z,Y)).


niece(X,Y) :-
            daughter(X,Z),
			(sister(Z,Y) ; brother(Z,Y)).

cousin(X,Y) :-
             parent(Z,X),
			 (uncle(Z,Y);aunt(Z,Y)).
			 
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y),
                 ancestor(X,Z).

descendant(X,Y) :- son(X,Y).
descendant(X,Y) :- daughter(X,Y).
descendant(X,Y) :- (son(Z,Y);daughter(Z,Y)),descendant(X,Z).









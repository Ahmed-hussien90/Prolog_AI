parent(pam,bob).
parent(tom,bob).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(ann,liz).

male(bob).
female(pam).
male(pat).
female(ann).
female(jim).
female(liz).
male(jim).

mother(A,B) :- female(A), parent(A,B).
father(A,B) :- male(A), parent(A,B).
sublings(A,B):-  parent(X,A), parent(X,B), A\=B.
sister(A,B) :- female(A) ,sublings(A,B).
brother(A,B) :- male(A) ,sublings(A,B).
parent_sublings(X,Y):- sublings(X,Z) , parent(Z,Y).
uncle(X,Y) :- male(X), parent_sublings(X,Y).
aunt(X,Y):- female(X), parent_sublings(X,Y).
ancestor(X,Y):- parent(X,Y).
ancestor(X,Z) :- parent(X,Y),ancestor(Y,Z).
child_Of_uncle(X,Y) :- uncle(Z,X),parent(Z,Y).
child_Of_aunt(X,Y) :- aunt(Z,X),parent(Z,Y).

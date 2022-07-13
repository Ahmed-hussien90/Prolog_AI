parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

:- discontiguous female/1.
:- discontiguous male/1.

female(pam).
male(tom).
male(bob).
female(liz).
female(pat).
female(ann).
male(jim).

offspring(Y, X) :-
	parent(X, Y).

mother(X, Y) :-
	parent(X, Y),
	female(X).

grandparent(X, Z) :-
	parent(X, Y),
	parent(Y, Z).

different( X, Y) :-
	X = Y, !, fail;
	true.

sister(X, Y) :-
	parent(Z, X),
	parent(Z, Y),
	female(X),
	different(X, Y).

happy(X) :-
	parent(X, _),
	write(X), write(' is happy'), nl, false.

hastwochildren(X) :-
	parent(X, Y),
	sister(_, Y),
	write(X), write(' has two children'), nl, false.


grandchild(X, Y) :-
	parent(Y, A),
	parent(A, X),
	write(X), write(' is a grandchild for '), write(Y), nl, false.


aunt(X, Y) :-
	sister(X, A),
	parent(A, Y),
	write(X), write(' is an aunt for '), write(Y), nl, false.

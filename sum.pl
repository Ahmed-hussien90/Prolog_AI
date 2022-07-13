sum([X],X).
sum([H|T], S) :- sum(T,X), S is H + X.

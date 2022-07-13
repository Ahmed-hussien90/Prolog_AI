member1(X ,[X|_]).
member1(X,[_|List]):- member1(X,List).

% permution of list

perm([],_).
perm([H|T],List):- member(H,List),perm(T,List).
perm(N ,List, L):- length(L,N), perm(L,List).

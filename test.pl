% Check Element in list

member1(X ,[X|_]).
member1(X,[_|List]):- member1(X,List).

% length of list

leng([] , 0).
leng([_|R], L):-  leng(R ,L1), L is L1 + 1.

% gcd rule

gcd(0, X, X):- X > 0, !.
gcd(X, Y, Z):- X >= Y, X1 is X-Y, gcd(X1,Y,Z).
gcd(X, Y, Z):- X < Y, X1 is Y-X, gcd(X1,X,Z).

% factorial function

factorial(0,1).
factorial(N,M) :-
N>0,
N1 is N-1,
factorial(N1, M1),
M is N*M1.

% fibonachy function

fib(0,0).
fib(1,1).
fib(N,A):- N1 is N-1 , N2 is N-2 , fib(N1,A1), fib(N2,A2) , A is A1+A2.

% index of element in list

index(N ,[N|_] , 0).
index(N ,[A|R] , I):- index(N ,R , I1) , I is I1 + 1.


% permution of list

perm([],_).
perm([H|T],List):- member(H,List),perm(T,List).
perm(N ,List, L):- length(L,N), perm(L,List).

% union of list


union1([],[],[]).
union1(List1,[],List1).
union1(List1, [Head2|Tail2], [Head2|Output]):-
    \+(member(Head2,List1)), union1(List1,Tail2,Output).
union1(List1, [Head2|Tail2], Output):-
    member(Head2,List1), union1(List1,Tail2,Output).

% intersction of list


inter([], _, []).
inter([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inter(T1, L2, Res).
inter([_|T1], L2, Res) :-
    inter(T1, L2, Res).

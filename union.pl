member1(X ,[X|_]).
member1(X,[_|List]):- member1(X,List).

union1([],[],[]).
union1(List1,[],List1).
union1(List1, [Head2|Tail2], [Head2|Output]):-
    \+(member(Head2,List1)), union1(List1,Tail2,Output).
union1(List1, [Head2|Tail2], Output):-
    member(Head2,List1), union1(List1,Tail2,Output).
%z5304897 Junyu Zhang

% inside or outside the subset of argument(E)
type(1; 0).  % 1: in; 0: out.
1 { expect(X, T) : type(T) } 1 :- argument(X).  % set type of argument

%%%no arguments in E attack any other argument of E 
:- attack(X, Y), expect(X, 1), expect(Y, 1).
:- attack(X, Y), X==Y.

%%%any argument outside of E is attacked by an argument from E.
attacked(Y) :- expect(X, 1), attack(X, Y).
:- not attacked(Y), expect(Y, 0).

choose(X) :- expect(X, 1).

#show choose/1.

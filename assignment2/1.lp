%z5304897 Junyu Zhang
%Test 1
%argument(a), argument(b), argument(c),argument(d).
%attack(a, b), %attack(b, c), attack(d, c).

%Test 2
%argument(a), argument(b), argument(c), argument(d).
%attack(a,b), attack(b,a), attack(a,c), %attack(b,d).

%Test 3
argument(a), argument(b), argument(c), argument(d), argument(e), argument(f).
attack(a,b), attack(b,a), attack(a,c), attack(b,c), attack(c,d), attack(d,f), attack(e,d), attack(e,f), attack(f,e).

% set in or out the subset of argument(E)
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

%Test 1
%argument(a). argument(b). argument(c). argument(d).
%attack(a, b). attack(b, c). attack(d, c).

%Test 2
%argument(a). argument(b). argument(c). argument(d).
%attack(a,b). attack(b,a). attack(a,c), %attack(b,d).

%Test 3
argument(a). argument(b). argument(c). argument(d). argument(e). argument(f).
attack(a,b). attack(b,a). attack(a,c). attack(b,c). attack(c,d). attack(d,f). attack(e,d). attack(e,f). attack(f,e).

%Test 4
%argument(a). argument(b). argument(c). argument(d).
%attack(a, c).
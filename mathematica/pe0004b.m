Clear["Global`*"];
RepeatedTiming[
 lst = Flatten[Table[{
     a*10001 + b*1010 + c*100,
     a*100001 + b*10010 + c*1100},
    {a, 1, 9}, {b, 0, 9}, {c, 0, 9}]];
 cond[n_] := Module[{chk},
   chk[x_] := 
    IntegerLength@x == 3 && IntegerLength@Quotient[n, x] == 3;
   AnyTrue[Divisors@n, chk]];
 ans = Max@Select[lst, cond]]
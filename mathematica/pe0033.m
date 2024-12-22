Clear["Global`*"];
RepeatedTiming[
 cond[{x_, y_}] := Module[{a1, a2, b1, b2},
   {a1, a2} = QuotientRemainder[x, 10];
   {b1, b2} = QuotientRemainder[y, 10];
   If[a1 == b1 && x*b2 == y*a2 , Return@True];
   If[a2 == b2 && a2 != 0 && x*b1 == y*a1 , Return@True];
   If[a1 == b2 && x*b1 == y*a2 , Return@True];
   If[a2 == b1 && x*b2 == y*a1 , Return@True];
   Return@False];
 lst = Select[Flatten[Table[{i, j}, {i, 10, 99}, {j, i + 1, 99}], 1], 
   cond];
 ans = Denominator[Times @@ (#[[1]]/#[[2]] & /@ lst)]]
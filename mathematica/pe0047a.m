Clear["Global`*"];
RepeatedTiming[
 cond[n_] := PrimeNu@n == 4;
 ans = NestWhile[# + 1 &, 1, ! AllTrue[# + {0, 1, 2, 3}, cond] &]]
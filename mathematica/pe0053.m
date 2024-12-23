Clear["Global`*"];
RepeatedTiming[
 lst = Flatten@Table[Binomial[n, k], {n, 1, 100}, {k, 0, n}];
 ans = Length@Select[lst, # > 10^6 &]]
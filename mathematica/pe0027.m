Clear["Global`*"];
RepeatedTiming[
 calc[{a_, b_}] := NestWhile[# + 1 &, 0, PrimeQ[#^2 + a*# + b] &];
 as = Range[-999, 999, 2];
 bs = Select[Range[-999, 999, 2], PrimeQ];
 ans = Times @@ First@MaximalBy[Tuples[{as, bs}], calc]]
Clear["Global`*"];
RepeatedTiming[
 calc[n_] := Length@Last@First@RealDigits[1/n];
 ans = First@MaximalBy[Range[1, 10^3 - 1], calc]]
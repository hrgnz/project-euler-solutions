Clear["Global`*"];
RepeatedTiming[
 n = NestWhile[# + 1 &, 1,
   DivisorSigma[0, PolygonalNumber@#] <= 500 &];
 ans = {n, PolygonalNumber@n}]
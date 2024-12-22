Clear["Global`*"];
RepeatedTiming[
 p[n_] := PolygonalNumber[5, n];
 y[k_] := 1/12 (2 + (7 - 4 Sqrt[3])^(2 k) (5 - 3 Sqrt[3]) +
     (5 + 3 Sqrt[3]) (7 + 4 Sqrt[3])^(2 k));
 ans = p@y@2 // Simplify]
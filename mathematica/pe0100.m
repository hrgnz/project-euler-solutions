Clear["Global`*"];
RepeatedTiming[
 nmax = 10^12;
 b[k_] := 1/8 (4 + (3 - 2 Sqrt[2])^k (2 + Sqrt[2])
     - (-2 + Sqrt[2]) (3 + 2 Sqrt[2])^k);
 n[k_] := 1/4 (2 - (3 - 2 Sqrt[2])^k (1 + Sqrt[2])
     + (-1 + Sqrt[2]) (3 + 2 Sqrt[2])^k);
 k = NestWhile[# + 1 &, 1, n@# <= nmax &];
 ans = Simplify@b@k]
ClearAll["Global`*"];
RepeatedTiming[
 {a, b} = {2 - Sqrt@3, 2 + Sqrt@3};
 n1[k_] := (a^(2 k) + b^(2 k) + 1)/3 // Simplify;
 n2[k_] := (a*b^(2 k) + b*a^(2 k) - 1)/3 // Simplify;
 num1[k_] := num1[k] = 3*n1[k] + 1;
 num2[k_] := num2[k] = 3*n2[k] - 1;
 k1max = NestWhile[# + 1 &, 1, num1@# <= 10^9 &] - 1;
 k2max = NestWhile[# + 1 &, 2, num2@# <= 10^9 &] - 1;
 ans = Total[num1 /@ Range[1, k1max]] + Total[num2 /@ Range[2, k2max]];
 {ans, {k1max, k2max - 1}}]
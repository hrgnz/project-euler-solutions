Clear["Global`*"];
AbsoluteTiming[
 pentagonal[k_] := pentagonal[k] = Quotient[k (3 k - 1), 2];
 p[0] := 1;
 p[_?Negative] := 0;
 p[n_] := p[n] = Mod[
    Sum[Cos[(k + 1) Pi] (p[n - pentagonal[k]] + p[n - pentagonal[-k]]),
     {k, 1, Quotient[1 + Sqrt[1 + 24 n], 6]}], 10^6];
 ans = NestWhile[# + 1 &, 1, p@# != 0 &]]
Clear["Global`*"];
RepeatedTiming[
 p[0] := 1;
 p[n_ /; n < 0] := 0;
 p[n_ /; n > 0] := p[n] = Mod[Sum[(-1)^(k + 1)*
      (p[n - PolygonalNumber[5, k]] + p[n - PolygonalNumber[5, -k]]),
     {k, Floor[1/6 + Sqrt[1 + 24*n]/6]}], 10^6];
 ans = NestWhile[# + 1 &, 1, p@# != 0 &]]
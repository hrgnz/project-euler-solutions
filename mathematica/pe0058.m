Clear["Global`*"];
RepeatedTiming[
 f[1] = 3;
 f[n_] := f[n] = f[n - 1] +
    Length@Select[Table[(2 n + 1)^2 - 2 n*i, {i, 1, 3}], PrimeQ];
 ans = 2*NestWhile[# + 1 &, 1, 10*f@# >= 4 # + 1 &] + 1]
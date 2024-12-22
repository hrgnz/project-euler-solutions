AbsoluteTiming[
 nmax = 10^6;
 acc = Accumulate@Prime@Range@PrimePi@nMax;
 f[x_, y_] := acc[[x]] - acc[[y - 1]];
 imax = NestWhile[# + 1 &, 2, f[# + 20, #] < nmax &] - 1;
 g[n_] := Module[{t1, t2},
   t1 = NestWhile[# + 1 &, 20, f[n + #, n] < nmax &] - 1;
   t2 = SelectFirst[Range[t1, 1, -1], PrimeQ@f[n + #, n] &, -1];
   If[t2 >= 20, {t2 + 1, Prime[n], Prime[n + t2], f[n + t2, n]}, {0, 
     0, 0, 0}]];
 ans = Flatten@MaximalBy[g /@ Range@imax, First]]
ClearAll["Global`*"];
RepeatedTiming[
 nmax = 10^7 - 1;
 f[n_ /; n < 10] := f[n] = n^2;
 f[n_] := f[n] = Total[f /@ QuotientRemainder[n, 10]];
 cond[n_] := NestWhile[f, n, # != 1 && # != 89 &] == 1; 
 ans = nmax - Length@Parallelize@Select[Range@nmax, cond]]
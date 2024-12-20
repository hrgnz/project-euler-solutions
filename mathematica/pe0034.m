Clear["Global`*"];
RepeatedTiming[
 kmax = NestWhile[# + 1 &, 1, Power[10, # - 1] <= #*9! &] - 1;
 nmax = Min[10^kmax - 1, kmax*9!];
 cond[n_] := Total[IntegerDigits[n]!] == n;
 lst = Parallelize@Select[Range[3, nmax], cond];
 ans = {Total@lst, lst}]
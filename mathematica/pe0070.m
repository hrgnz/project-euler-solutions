Clear["Global`*"];
RepeatedTiming[
 nmax = 10^7;
 cond[n_] := Sort@IntegerDigits@n == Sort@IntegerDigits@EulerPhi@n;
 lst = Parallelize@Select[Range[2, nmax - 1], cond];
 ans = First@MinimalBy[lst, #/EulerPhi@# &]]
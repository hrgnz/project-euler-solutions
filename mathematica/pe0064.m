Clear["Global`*"];
RepeatedTiming[
 nmax = 10^4;
 cond[n_] := OddQ@Length@Last@ContinuedFraction@Sqrt@n;
 lst = Complement[Range@nmax, Table[k^2, {k, Sqrt@nmax}]];
 ans = Length@Parallelize@Select[lst, cond@# &]]
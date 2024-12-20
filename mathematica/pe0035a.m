Clear["Global`*"];
RepeatedTiming[
 cond[n_] := AllTrue[FromDigits@RotateLeft[IntegerDigits@n, #] & /@
    Range@IntegerLength@n, PrimeQ];
 ans = Length@Parallelize@Select[Prime@Range@PrimePi[10^6], cond]]
 
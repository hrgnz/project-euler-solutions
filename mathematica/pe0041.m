Clear["Global`*"];
RepeatedTiming[
 cond[n_] := PrimeQ@n && Sort@IntegerDigits@n == Range@IntegerLength@n;
 lst47 = Join[Range[7654321, 1234567, -2], Range[4321, 1234, -2]];
 ans = SelectFirst[lst47, cond]]
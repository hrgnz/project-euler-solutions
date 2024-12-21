Clear["Global`*"];
RepeatedTiming[
 f[n_] := n*10^5 + 2 n;
 cond[n_] := Sort@IntegerDigits@f@n == Range@9;
 ans = f@SelectFirst[Range[9876, 9123, -1], cond];
 ans = Max[918273645, ans]]
Clear["Global`*"];
RepeatedTiming[
 cond[x_] := IntegerDigits@x == Reverse@IntegerDigits@x;
 ans = Max@
   Select[Flatten[Table[i*j, {i, 100, 999}, {j, i, 999}]], cond]]
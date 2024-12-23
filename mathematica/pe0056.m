Clear["Global`*"];
RepeatedTiming[
 ans = Max@
   Table[Total@IntegerDigits@Power[a, b], {a, 1, 99}, {b, 1, 99}]]
RepeatedTiming[
 f[x_] := Sort@IntegerDigits@x;
 cond[x_] := AllTrue[Range[2, 6], f[#*x] == f[x] &];
 ans = NestWhile[# + 9 &, 9, ! cond@# &]]
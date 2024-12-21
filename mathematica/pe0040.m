Clear["Global`*"];
RepeatedTiming[
 kmax = NestWhile[# + 1 &, 1, Sum[9 k*10^(k - 1), {k, #}] < 10^6 &];
 lst = Flatten@Array[IntegerDigits@# &, 10^kmax];
 ans = Apply[Times, lst[[10^#]] & /@ Range[0, 6]]]
Clear["Global`*"];
RepeatedTiming[
 ans = NestWhile[# + 1 &, 1, IntegerLength@Fibonacci@# < 10^3 &]]
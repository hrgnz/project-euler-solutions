Clear["Global`*"];
RepeatedTiming[
 ans = FromDigits@Part[Permutations@Range[0, 9], 10^6]]
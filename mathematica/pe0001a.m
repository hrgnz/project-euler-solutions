Clear["Global`*"];
RepeatedTiming[
 ans = Total@Select[Range@999, Divisible[#, 3] || Divisible[#, 5] &]]
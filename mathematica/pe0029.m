Clear["Global`*"];
RepeatedTiming[
 f[{a_, b_}] := Power[a, b];
 ans = CountDistinctBy[Tuples[Range[2, 100], 2], f]]
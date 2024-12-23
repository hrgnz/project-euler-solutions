Clear["Global`*"];
RepeatedTiming[
 ans = First@MaximalBy[Range[10^6], #/EulerPhi@# &]]
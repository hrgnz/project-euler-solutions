Clear["Global`*"];
RepeatedTiming[
 ans = ParallelSum[EulerPhi@i, {i, 2, 10^6}]]
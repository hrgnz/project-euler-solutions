Clear["Global`*"];
RepeatedTiming[
 kmax = NestWhile[# + 1 &, 1, #*9^5 > Power[10, # - 1] &] - 1;
 cond[n_] := Total[(IntegerDigits@n)^5] == n;
 lst = Parallelize@Select[Range[2, 10^kmax - 1], cond];
 ans = {Total@lst, Length@lst, lst}]
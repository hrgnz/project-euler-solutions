Clear["Global`*"];
dat = Import["0099_base_exp.txt", "CSV"];
RepeatedTiming[
 f[{a_, b_}] := b*Log10[a];
 lst = f /@ dat;
 ans = First@Position[lst, Max@lst]]
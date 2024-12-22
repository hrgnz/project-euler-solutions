Clear["Global`*"];
RepeatedTiming[
 calc[s_] := Total@LetterNumber@s;
 lst = calc /@ Sort[Flatten[Import["./0022_names.txt", "CSV"]]];
 ans = lst . Range@Length@lst]
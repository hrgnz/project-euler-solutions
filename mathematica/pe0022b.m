Clear["Global`*"];
RepeatedTiming[
 calc[s_] := Total@ToCharacterCode@s - 64*StringLength@s;
 lst = calc /@ Sort[Flatten[Import["0022_names.txt", "CSV"]]];
 ans = lst . Range@Length@lst]
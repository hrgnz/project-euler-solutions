Clear["Global`*"];
RepeatedTiming[
 calc[s_] := Total@LetterNumber@s;
 wList = calc /@ Flatten[Import["0042_words.txt", "CSV"]];
 kMax = NestWhile[# + 1 &, 1, PolygonalNumber@# < Max@wList &];
 pList = Table[PolygonalNumber@k, {k, kMax}];
 ans = Length@Select[wList, MemberQ[pList, #] &]]
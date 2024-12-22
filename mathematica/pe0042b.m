Clear["Global`*"];
RepeatedTiming[
 calc[s_] := Total@LetterNumber@s;
 lst = calc /@ Flatten[Import["0042_words.txt", "CSV"]];
 squareQ[n_] := AllTrue[FactorInteger[1 + 8 n], EvenQ[#[[2]]] &];
 ans = Length@Select[lst, squareQ]]
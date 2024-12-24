Clear["Global`*"];
AbsoluteTiming[
 dat = Flatten@Import["0089_roman.txt", "CSV"];
 calc[s_] := 
  Subtract @@ (StringLength /@ {s, 
      RomanNumeral@Quiet@FromRomanNumeral@s});
 ans = Total[calc /@ dat]]
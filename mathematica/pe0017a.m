Clear["Global`*"];
RepeatedTiming[
 f[n_] := Module[{s},
   If[! Divisible[n, 100],
    s = StringReplace[IntegerName[n, "Words"],
      {"hundred" -> "hundredand", " " -> "", "\[Hyphen]" -> ""}],
    s = StringReplace[IntegerName[n, "Words"],
      {" " -> "", "\[Hyphen]" -> ""}]];
   StringLength@s];
 ans = Total[f /@ Range@1000]]
Clear["Global`*"];
RepeatedTiming[
 f[n_] := StringLength@StringReplace[IntegerName[n, "Words"],
    {" " -> "", "\[Hyphen]" -> ""}];
 g[n_] := Sum[f@k, {k, n}];
 ans = g[99]*10 + (g[9] + StringLength["hundredand"]*9)*100
   		- StringLength["and"]*9 + StringLength["onethousand"]]
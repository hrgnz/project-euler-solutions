Clear["Global`*"];
RepeatedTiming[
 calc[n_] := Module[{lst, res},
   lst = 
    Table[k^3, {k, Ceiling@Power[10^(n - 1), 1/3], 
      Floor@Power[10^n - 1, 1/3]}]; 
   res = SelectFirst[GatherBy[lst, Sort@IntegerDigits@# &], 
     Length@# == 5 &];
   If[MissingQ@res, False, Throw@Min@res]];
 ans = Catch@NestWhile[# + 1 &, 1, ! calc@# &]]
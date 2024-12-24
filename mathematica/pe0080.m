Clear["Global`*"];
RepeatedTiming[
 ans = Total[Total@Take[#, 100] &@First@
       RealDigits@N[Sqrt@#, 110] & /@ Range@99];
 ans -= Total@Range@9]
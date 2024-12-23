Clear["Global`*"];
RepeatedTiming[
 f[n_] := f[n] = PolygonalNumber[5, n];
 invf[n_] := invf[n] = (1 + Sqrt[1 + 24 n])/6;
 cond[i_, d_] := IntegerQ@invf[f@i + d] && IntegerQ@invf[2 f@i + d];
 ans = Catch[
   For[a = 2, True, a++,
    d = f@a;
    For[i = 1, i < a, i++,
     If[cond[i, d], Throw[{d, a, i}]]]]]]
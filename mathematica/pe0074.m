Clear["Global`*"];
RepeatedTiming[
 f[n_] := f[n] = Total[IntegerDigits[n]!];
 g[n_] := g[n] = Module[{lst = {}, x = n, cnt = 0},
    While[DuplicateFreeQ@lst,
     AppendTo[lst, f@x];
     x = f@x;
     cnt++;
     If[x < n, Return[cnt + g@x]]];
    cnt];
 ans = Length@Parallelize@Select[Range[10^6 - 1], g@# == 60 &]]
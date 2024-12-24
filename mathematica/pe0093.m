ClearAll["Global`*"];
RepeatedTiming[
 ops = {Plus, Subtract, Times, Divide};
 f[{x_, y_, z_, w_}] := Table[
   {r[p[x, y], q[z, w]],
    r[q[p[x, y], z], w],
    r[p[x, q[y, z]], w],
    r[x, q[y, p[z, w]]],
    r[x, q[p[y, z], w]]},
   {p, ops}, {q, ops}, {r, ops}];
 g[lst_] := Module[{tlst1, tlst2, tlst3},
   tlst1 = DeleteDuplicates@Flatten[f /@ Permutations@lst];
   tlst2 = Sort@Select[Select[tlst1, IntegerQ], # > 0 &];
   If[First@tlst2 != 1, Return@0];
   tlst3 = First@SplitBy[Differences@tlst2, # != 1 &];
   Length@tlst3 + 1];
 lst = Subsets[Range@9, {4}];
 ans = FromDigits@First@MaximalBy[lst, g] // Quiet]
Clear["Global`*"];
mat = Import["0081_matrix.txt", "CSV"];
RepeatedTiming[
 calc[lst_] := Module[{m, n, v},
   {m, n} = Dimensions@lst;
   Graph[Flatten[Join[{st -> v[1, 1]},
      Table[v[i, j] -> v[i, j + 1], {i, 1, m}, {j, 1, n - 1}],
      Table[v[i, j] -> v[i + 1, j], {i, 1, m - 1}, {j, 1, n}],
      {v[m, n] -> gl}]],
    EdgeWeight -> Flatten[Join[{mat[[1, 1]]},
       Table[mat[[i, j + 1]], {i, 1, m}, {j, 1, n - 1}],
       Table[mat[[i + 1, j]], {i, 1, m - 1}, {j, 1, n}], {0}]]]];
 ans = Floor@GraphDistance[calc@mat, st, gl]]
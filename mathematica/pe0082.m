Clear["Global`*"];
mat = Import["0082_matrix.txt", "Data"];
RepeatedTiming[
 calc[lst_] := Module[{m, n, v},
   {m, n} = Dimensions@lst;
   Graph[Flatten[Join[
      Table[st -> v[i, 1], {i, 1, m}],
      Table[v[i, j] -> v[i, j + 1], {i, 1, m}, {j, 1, n - 1}],
      Table[v[i, j] -> v[i - 1, j], {i, 2, m}, {j, 1, n}],
      Table[v[i, j] -> v[i + 1, j], {i, 1, m - 1}, {j, 1, n}],
      Table[v[i, n] -> gl, {i, 1, m}]]],
    EdgeWeight -> Flatten[Join[
       Table[mat[[i, 1]], {i, 1, m}],
       Table[mat[[i, j + 1]], {i, 1, m}, {j, 1, n - 1}],
       Table[mat[[i - 1, j]], {i, 2, m}, {j, 1, n}],
       Table[mat[[i + 1, j]], {i, 1, m - 1}, {j, 1, n}],
       ConstantArray[0, m]]]]];
 ans = Floor@GraphDistance[calc@mat, st, gl]]
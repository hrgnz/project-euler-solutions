Clear["Global`*"];
RepeatedTiming[
 (* サイコロを作る *)
 makeDice[lst_] := 
  If[IntersectingQ[lst, {6, 9}] && ! SubsetQ[lst, {6, 9}],
   Union[lst, {6, 9}], lst];
 dice = makeDice /@ Subsets[Range[0, 9], {6}];
 
 (* 平方数を表せるか *)
 cond[{dice1_, dice2_}] := Module[{nums},
   If[Length@Union[dice1, dice2] < 9, Return@False];
   nums = 
    FromDigits /@ 
     Union[Tuples[{dice1, dice2}], Tuples[{dice2, dice1}]];
   SubsetQ[nums, (Range@9)^2]];
 ans = Length@Select[Subsets[dice, {2}], cond]]
 
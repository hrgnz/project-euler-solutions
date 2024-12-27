ClearAll["Global`*"];
RepeatedTiming[
 n = 50;
 cond[{p_, q_}] := MemberQ[{0, p . p, q . q}, p . q];
 tpl = Subsets[Rest@Tuples[Range[0, n], 2], {2}];
 ans = Length[Select[tpl, cond]]]
 
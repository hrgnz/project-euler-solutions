Clear["Global`*"];
dat = First@Import["0098_words.txt", "CSV"];
RepeatedTiming[
 anagrams = Select[GatherBy[dat, Sort@Characters@# &], Length@# > 1 &];
 
 (* n文字のアナグラムに対応する平方数の最大値 *)
 calc[n_] := 
  Module[{words, wordpairs, makePattern, patterns, squares, 
    squarepairs},
   (* 文字列から置換パターンと文字の出現位置を抽出 *)
   words = Characters /@ Select[anagrams, StringLength@First@# == n &];
   wordpairs = 
    Flatten[{#, Reverse@#} & /@ 
      Flatten[Subsets[#, {2}] & /@ words, 1], 1];
   makePattern[pair_] := {FindPermutation @@ pair, 
     Values@PositionIndex@First@pair};
   patterns = DeleteDuplicates[makePattern /@ wordpairs];
   
   (* 文字列と同じパターンをもつ平方数の最大値を求める *)
   squares = 
    Map[IntegerDigits, (Range[Ceiling@Sqrt[10^(n - 1)], 
        Floor@Sqrt[10^n - 1]])^2];
   squarepairs = 
    Flatten[Subsets[#, {2}] & /@ 
      Select[GatherBy[squares, Sort@# &], Length@# > 1 &], 1];
   Max[FromDigits /@ 
     Flatten[Select[squarepairs, MemberQ[patterns, makePattern@#] &], 
      1]]];
 
 (* アナグラム文字列の長さ毎に計算 *)
 ans = Max[
   calc /@ DeleteDuplicates[StringLength /@ Flatten@anagrams]]]
   
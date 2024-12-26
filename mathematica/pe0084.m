Clear["Global`*"];
RepeatedTiming[
 n = 10^5;
 faces = 4;
 visited = ConstantArray[0, 40];
 cur = 0;
 cntDouble = 0;
 Do[
  dice1 = RandomInteger[{1, faces}];
  dice2 = RandomInteger[{1, faces}];
  If[dice1 == dice2, cntDouble++, cntDouble = 0];
  (* ゾロ目 *)
  If[cntDouble == 3, cur = 10;
   cntDouble = 0; Continue,
   cur = Mod[cur + dice1 + dice2, 40, 1]];
  (* G2J *)
  If[cur == 30, cur = 10; cntDouble = 0];
  (* CC *)
  If[MemberQ[{2, 17, 33}, cur], r = RandomInteger[{1, 16}];
   Which[r == 1, cur = 40,
    r == 2, cur = 10; cntDouble = 0]];
  (* CH *)
  If[MemberQ[{7, 22, 36}, cur], r = RandomInteger[{1, 16}];
   Which[r == 1, cur = 40,
    r == 2, cur = 10; cntDouble = 0,
    r == 3, cur = 11,
    r == 4, cur = 24,
    r == 5, cur = 39,
    r == 6, cur = 5];
   Which[r == 7 && (cur == 7 || cur == 36), cur = 15,
    r == 7 && cur == 22, cur = 25];
   Which[r == 8 && (cur == 7 || cur == 36), cur = 12,
    r == 8 && cur == 22, cur = 28];
   Which[r == 9, cur = Mod[cur - 3, 40, 1]]];
  visited[[cur]]++, {i, n}];
 res = Mod[#, 40] & /@ Take[Reverse@Ordering@visited, 3];
 ans = StringJoin[IntegerString[#, 10, 2] & /@ res]]
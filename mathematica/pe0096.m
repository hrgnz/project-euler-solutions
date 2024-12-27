ClearAll["Global`*"];
dat = Partition[ReadList["p096_sudoku.txt", Byte,
     RecordLists -> True], 9, 10, -10] - First@ToCharacterCode["0"];
solver[lst_] := Flatten@ResourceFunction["SudokuSolve"][lst][[1]]; 
calc[lst_] := FromDigits@Take[solver@lst, 3];
RepeatedTiming[
 ans = Total[calc /@ dat]]
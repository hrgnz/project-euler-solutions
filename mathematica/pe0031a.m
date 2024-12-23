Clear["Global`*"];
RepeatedTiming[
 coins = {1, 2, 5, 10, 20, 50, 100, 200};
 ans = Length@IntegerPartitions[200, All, coins]]
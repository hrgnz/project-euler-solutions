Clear["Global`*"];
RepeatedTiming[
 ans = Total@IntegerDigits@Factorial@100]
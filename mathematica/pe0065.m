Clear["Global`*"];
RepeatedTiming[
 ans = Total@IntegerDigits@Numerator@
     FromContinuedFraction@ContinuedFraction[E, 100]]
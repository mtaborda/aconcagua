arithmetic operations - private
remainderMeasure: aMeasure

	| numerator denominator |
	numerator := aMeasure convertToBaseUnit.
	denominator := self convertToBaseUnit.
	^numerator baseUnit with: numerator amount \\ denominator amount
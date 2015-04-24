arithmetic operations - private
divideMeasure: aMeasure

	| numerator denominator |
	numerator := aMeasure convertToBaseUnit.
	denominator := self convertToBaseUnit.
	^numerator unit / denominator unit 
		with: numerator amount / denominator amount
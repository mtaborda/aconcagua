test subtract
testSubtractScaledDecimalWithMeasure

	self assert: ((10.01s2 - self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((10.01s2 - self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.01s2
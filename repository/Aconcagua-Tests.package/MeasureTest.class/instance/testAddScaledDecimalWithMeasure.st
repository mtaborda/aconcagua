test add
testAddScaledDecimalWithMeasure

	self assert: ((10.01s2 + self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10.01s2 + self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.01s2.	
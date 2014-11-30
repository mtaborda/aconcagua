test add
testAddScaledDecimalWithMeasure

	self assert: ((10.01s2 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10.01s2 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: ((10.01s2 + (self tenMeters + self tenPesos) ) atSameBaseUnitAs: NullUnit new) = 10.01s2.		
test converting
testConvertNothing

	self assert: (self zeroMeters convertTo: self meter) = self zeroMeters.
	self assert: ((Measure amount: 0 unit: self centimeter) convertTo: self meter) = self zeroMeters		
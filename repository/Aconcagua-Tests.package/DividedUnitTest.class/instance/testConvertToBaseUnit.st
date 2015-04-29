test converting
testConvertToBaseUnit

	| measure |
	
	measure := Measure amount: 10 unit: meterOverSecond.
	self assert: (meterOverSecond convertToBaseUnit: measure) == measure
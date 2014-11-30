test converting
testConvertToBaseUnit

	| measure |
	
	measure := Measure amount: 10 unit: meterBySecond.
	self assert: (meterBySecond convertToBaseUnit: measure) == measure.
	
	

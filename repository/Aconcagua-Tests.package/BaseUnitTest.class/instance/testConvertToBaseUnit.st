test converting
testConvertToBaseUnit

	| unit measure |
	
	unit := BaseUnit named: 'peso'.
	measure := Measure amount: 10 unit: unit.
	self assert: (unit convertToBaseUnit: measure) == measure
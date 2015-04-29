test converting
testConvertToBaseUnit

	| unit measure |
	
	unit :=  NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:celsius | celsius + (5463/20)] 
		reciprocalConversionBlock: [ :kelvins | kelvins - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	measure := Measure amount: 0 unit: unit.
	self assert: (unit convertToBaseUnit: measure) amount = (5463/20).
	self assert: (unit convertToBaseUnit: measure) unit = kelvin
	
	

test accessing
testNullMeasure

	| unit |
	
	unit := NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: unit nullMeasure amount = 0.
	self assert: unit nullMeasure unit = kelvin.

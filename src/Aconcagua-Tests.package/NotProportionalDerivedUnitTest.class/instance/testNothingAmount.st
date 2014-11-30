test accessing
testNothingAmount

	| unit |
	
	unit := NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: unit nothingAmount = (-5463/20)

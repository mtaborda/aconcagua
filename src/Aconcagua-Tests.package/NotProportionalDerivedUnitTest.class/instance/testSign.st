test accessing
testSign

	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius') sign = NotProportionalDerivedUnit defaultSign.
	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius' 
		sign: '¦Ç¬¨¦Ç¬ù') sign = '¦Ç¬¨¦Ç¬ù'.
	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		nameForOne: 'celcius'
		nameForMany: 'celcius'
		sign: '¦Ç¬¨¦Ç¬ù') sign = '¦Ç¬¨¦Ç¬ù'
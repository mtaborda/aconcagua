test accessing
testNameForMany

	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius') nameForMany = 'celciuss'.
	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius' 
		sign: '¦Ç¬¨¦Ç¬ù') nameForMany = 'celciuss'.
	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		nameForOne: 'celcius'
		nameForMany: 'celcius'
		sign: '¦Ç¬¨¦Ç¬ù') nameForMany = 'celcius'
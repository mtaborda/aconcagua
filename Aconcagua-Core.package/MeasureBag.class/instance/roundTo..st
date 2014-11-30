arithmetic operations
roundTo: aNumber
	
	^self newBagDoingOnEachMeasure: [:aMeasure | aMeasure roundTo: aNumber ]
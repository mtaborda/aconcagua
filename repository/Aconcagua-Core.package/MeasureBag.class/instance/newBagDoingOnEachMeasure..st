arithmetic operations - private
newBagDoingOnEachMeasure: aBlock

	| newMeasures |
	newMeasures := measures collect: aBlock.
	^self class measures: newMeasures
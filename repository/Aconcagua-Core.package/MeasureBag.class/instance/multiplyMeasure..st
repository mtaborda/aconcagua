arithmetic operations - private
multiplyMeasure: aMeasure

	aMeasure isNothing ifTrue: [^aMeasure].
	^self newBagDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag * aMeasure]
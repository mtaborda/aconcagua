arithmetic operations - private
remainderByMeasure: aMeasure 
	^self 
		newBagDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag \\ aMeasure]
arithmetic operations - private
moduloByMeasure: aMeasure

	^self newBagDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag // aMeasure]
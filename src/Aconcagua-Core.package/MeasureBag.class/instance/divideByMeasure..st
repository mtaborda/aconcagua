arithmetic operations - private
divideByMeasure: aMeasure

	^self newBagDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag / aMeasure]
*Aconcagua-Core-ArithmeticModel
createBagWithMeasure: aMeasure

	^self isNothing 
		ifTrue: [aMeasure]
		ifFalse: [aMeasure createBagWithNumber: self]
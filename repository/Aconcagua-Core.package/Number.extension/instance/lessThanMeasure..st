*Aconcagua-Core-ArithmeticModel
lessThanMeasure: aMeasure

	^self isNothing 
		ifTrue: [aMeasure > aMeasure unit nullMeasure]
		ifFalse: [(aMeasure convertTo: self baseUnit) amount > self]
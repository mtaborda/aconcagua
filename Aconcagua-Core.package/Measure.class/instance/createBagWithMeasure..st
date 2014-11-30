bag creation - private
createBagWithMeasure: aMeasure

	^self isNothing
		ifTrue: [aMeasure]
		ifFalse: 
			[MeasureBag measures: (OrderedCollection with: self with: aMeasure)]
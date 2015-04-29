bag creation - private
createBagWithNumber: aNumber

	^self isNothing
		ifTrue: [aNumber]
		ifFalse: [MeasureBag measures: (OrderedCollection with: self with: aNumber)]
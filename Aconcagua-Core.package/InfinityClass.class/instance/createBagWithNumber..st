bag creation - private
createBagWithNumber: aNumber

	^MeasureBag measures: (OrderedCollection with: self with: aNumber)
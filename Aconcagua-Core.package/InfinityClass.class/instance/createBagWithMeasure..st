bag creation - private
createBagWithMeasure: aMeasure

	^MeasureBag measures: (OrderedCollection with: self with: aMeasure)
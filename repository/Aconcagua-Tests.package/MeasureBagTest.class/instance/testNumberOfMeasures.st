test accessing
testNumberOfMeasures

	| measureBag |
	
	measureBag := MeasureBag with: self tenPesos with: self twentyDollars.
	
	self assert: measureBag numberOfMeasures = 2.
	self assert: measureBag numberOfMeasures = measureBag measures size
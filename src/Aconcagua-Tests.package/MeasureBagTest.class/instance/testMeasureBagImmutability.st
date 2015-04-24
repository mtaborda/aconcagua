test instance creation
testMeasureBagImmutability

	| measureBag measures |
	
	measureBag := MeasureBag with: self tenPesos with: self twentyDollars.
	measures := measureBag measures.
	measures add: self tenEuros.
	
	self assert: measureBag numberOfMeasures = 2.
	self assert: (measureBag atSameBaseUnitAs: self peso) = self tenPesos.
	self assert: (measureBag atSameBaseUnitAs: self dollar) = self twentyDollars
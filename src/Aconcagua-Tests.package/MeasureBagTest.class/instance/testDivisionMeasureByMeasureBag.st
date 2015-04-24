test division
testDivisionMeasureByMeasureBag

	self assert: (self tenPesos / (self tenPesos + self tenDollars)) = (MeasureBagFraction numerator: self tenPesos denominator: (self tenPesos + self tenDollars))


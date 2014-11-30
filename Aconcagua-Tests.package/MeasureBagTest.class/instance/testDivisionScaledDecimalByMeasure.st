test division
testDivisionScaledDecimalByMeasure

	self assert: (23.76s2 / (self tenPesos + self tenDollars)) = (MeasureBagFraction numerator: 23.76s2 denominator: (self tenPesos + self tenDollars))


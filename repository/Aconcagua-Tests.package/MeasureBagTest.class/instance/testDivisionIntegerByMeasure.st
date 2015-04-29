test division
testDivisionIntegerByMeasure

	self assert: (1 / (self tenPesos + self tenDollars)) = (MeasureBagFraction numerator: 1 denominator: (self tenPesos + self tenDollars))


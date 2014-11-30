test multiplication
testSubtractMeasureByMeasureBag

	self assert: (self tenMeters - (self tenPesos + self tenDollars)) = (self tenMeters - self tenPesos - self tenDollars)


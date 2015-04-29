test multiplication
testMultiplyMeasureByMeasureBag

	self assert: (self tenPesos * (self tenPesos + self tenDollars)) = ((self tenPesos * self tenPesos) + (self tenPesos * self tenDollars))
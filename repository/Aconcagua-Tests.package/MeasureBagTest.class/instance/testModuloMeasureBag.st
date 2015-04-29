test integer division
testModuloMeasureBag

	self should: [ (self tenPesos + self tenDollars) // (self tenPesos + self tenDollars) ] raise: InvalidOperationException


test integer remainder
testRemainderMeasureBag

	self should: [ (self tenPesos + self tenDollars) \\ (self tenPesos + self tenDollars) ] raise: InvalidOperationException


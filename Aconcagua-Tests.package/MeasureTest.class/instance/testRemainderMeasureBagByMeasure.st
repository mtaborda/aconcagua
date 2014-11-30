test integer remainder
testRemainderMeasureBagByMeasure

	self should: [(self tenPesos + self tenDollars) \\ self tenPesos ] raise: InvalidOperationException


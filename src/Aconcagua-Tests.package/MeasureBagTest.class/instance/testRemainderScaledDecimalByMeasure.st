test integer remainder
testRemainderScaledDecimalByMeasure

	self should: [23.76s2 \\ ( self tenPesos + self tenMeters )  ] raise: InvalidOperationException


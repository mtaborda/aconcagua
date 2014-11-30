*Aconcagua-Core-ArithmeticModel
fromMinusInfinity

	^ArithmeticObjectInterval
		from: MinusInfinity
		to: self
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
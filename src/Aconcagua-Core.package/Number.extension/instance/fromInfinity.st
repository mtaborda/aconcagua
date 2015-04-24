*Aconcagua-Core-ArithmeticModel
fromInfinity

	^ArithmeticObjectInterval
		from: Infinity
		to: self
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
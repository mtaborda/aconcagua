*Aconcagua-Core-ArithmeticModel
toInfinity

	^ArithmeticObjectInterval
		from: self
		to: Infinity
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
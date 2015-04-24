*Aconcagua-Core-ArithmeticModel
multiplyMinusInfinity: aMinusInfinity

	^self > 0 ifTrue: [aMinusInfinity] ifFalse: [aMinusInfinity negated]
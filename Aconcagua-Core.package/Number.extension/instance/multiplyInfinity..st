*Aconcagua-Core-ArithmeticModel
multiplyInfinity: anInfinity

	^self > 0 ifTrue: [anInfinity] ifFalse: [anInfinity negated]
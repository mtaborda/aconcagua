test arithmetic operations
testMultiplyByNumber

	self assert: (meterOverSecond * 5) = (meterOverSecond with: 5).
	self assert: (meterOverSecond * 5) numerator = (meter with: 5).
	self assert: (meterOverSecond * 5) denominator = (second with: 1).
	
	self assert: (meterOverSecond * 5.5) = (meterOverSecond with: 5.5).
	self assert: (meterOverSecond * 5.5) numerator = (meter with: 5.5).
	self assert: (meterOverSecond * 5.5) denominator = (second with: 1)
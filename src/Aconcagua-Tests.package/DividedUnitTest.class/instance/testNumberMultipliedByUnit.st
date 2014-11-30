test arithmetic operations
testNumberMultipliedByUnit

	self assert: (5 * meterOverSecond) = (meterOverSecond with: 5).
	self assert: (5 * meterOverSecond) numerator = (meter with: 5).
	self assert: (5 * meterOverSecond) denominator = (second with: 1).
	
	self assert: (5.5 * meterOverSecond) = (meterOverSecond with: 5.5).
	self assert: (5.5 * meterOverSecond) numerator = (meter with: 5.5).
	self assert: (5.5 * meterOverSecond) denominator = (second with: 1)
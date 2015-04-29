test arithmetic operations
testNumberMultipliedByUnit

	self assert: (5 * meterBySecond) = (meterBySecond with: 5).
	self assert: (5 * meterBySecond) numerator = (meterBySecond with: 5).
	self assert: (5 * meterBySecond) denominator = 1.
	
	self assert: (5.5 * meterBySecond) = (meterBySecond with: 5.5).
	self assert: (5.5 * meterBySecond) numerator = (meterBySecond with: 5.5).
	self assert: (5.5 * meterBySecond) denominator = 1
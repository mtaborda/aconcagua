test arithmetic operations
testNumberDividedByUnit

	self assert: (5 / meterBySecond) = (5 / (meterBySecond with: 1)).
	self assert: (5 / meterBySecond) numerator = 5.
	self assert: (5 / meterBySecond) denominator = (meterBySecond with: 1).
	
	self assert: (5.5 / meterBySecond) = (5.5 / (meterBySecond with: 1)).
	self assert: (5.5 / meterBySecond) numerator = 5.5.
	self assert: (5.5 / meterBySecond) denominator = (meterBySecond with: 1)
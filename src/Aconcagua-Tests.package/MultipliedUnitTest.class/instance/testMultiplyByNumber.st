test arithmetic operations
testMultiplyByNumber

	self assert: (meterBySecond * 5) = (meterBySecond with: 5).
	self assert: (meterBySecond * 5) numerator = (meterBySecond with: 5).
	self assert: (meterBySecond * 5) denominator = 1.
	
	self assert: (meterBySecond * 5.5) = (meterBySecond with: 5.5).
	self assert: (meterBySecond * 5.5) numerator = (meterBySecond with: 5.5).
	self assert: (meterBySecond * 5.5) denominator = 1
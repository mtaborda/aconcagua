test arithmetic operations
testNumberMultipliedByUnitTwice

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.

	self assert: (5 * kelvin * meterBySecond) = (kelvin * meterBySecond with: 5).
	self assert: (5 * kelvin * meterBySecond) numerator = (kelvin * meterBySecond with: 5).
	self assert: (5 * kelvin * meterBySecond) denominator = 1.
	
	self assert: (5.5 * kelvin * meterBySecond) = (kelvin * meterBySecond with: 5.5).
	self assert: (5.5 * kelvin * meterBySecond) numerator = (kelvin * meterBySecond with: 5.5).
	self assert: (5.5 * kelvin * meterBySecond) denominator = 1
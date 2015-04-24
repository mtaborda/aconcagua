test arithmetic operations
testNumberMultipliedByUnitTwice

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: (5 * kelvin * meterOverSecond) = (kelvin * meterOverSecond with: 5).
	self assert: (5 * kelvin * meterOverSecond) numerator = (kelvin * meter with: 5).
	self assert: (5 * kelvin * meterOverSecond) denominator = (second with: 1).
	
	self assert: (5.5 * kelvin * meterOverSecond) = (kelvin * meterOverSecond with: 5.5).
	self assert: (5.5 * kelvin * meterOverSecond) numerator = (kelvin * meter with: 5.5).
	self assert: (5.5 * kelvin * meterOverSecond) denominator = (second with: 1)
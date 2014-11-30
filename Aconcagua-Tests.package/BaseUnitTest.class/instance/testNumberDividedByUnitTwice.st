test arithmetic operations
testNumberDividedByUnitTwice

	| kelvin meter |
	
	kelvin := BaseUnit named: 'kelvin'.
	meter := BaseUnit named: 'meter'.
	
	self assert: (5 / kelvin / meter) = (Measure amount: 5 unit: NullUnit new / (kelvin * meter)).
	self assert: (5 / kelvin / meter) numerator = 5.
	self assert: (5 / kelvin / meter) denominator = (kelvin * meter with: 1).
	
	self assert: (5.5 / kelvin / meter) = (5.5 / (kelvin * meter with: 1)).
	self assert: (5.5 / kelvin / meter ) numerator = 5.5.
	self assert: (5.5 / kelvin / meter) denominator = (kelvin * meter with: 1)
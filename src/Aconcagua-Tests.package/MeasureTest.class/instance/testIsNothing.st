test testing
testIsNothing

	self assert: self zeroMeters isNothing.
	self assert: self zeroCentimeters isNothing.
	
	self assert: (Measure amount: 0 unit: self kelvin) isNothing.
	self assert: (Measure amount: (-5463/20) unit: self celsius) isNothing.
	
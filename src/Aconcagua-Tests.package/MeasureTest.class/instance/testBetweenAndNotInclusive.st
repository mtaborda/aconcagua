test magnitude protocol
testBetweenAndNotInclusive

	self assert: (self tenMeters between: self oneMeter andNotInclusive: (Measure amount: 11 unit: self meter)).
	self assert: (self tenMeters between: self tenMeters andNotInclusive: (Measure amount: 11 unit: self meter)).
	self deny: (self tenMeters between: self oneMeter andNotInclusive: self tenMeters).


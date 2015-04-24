test magnitude protocol
testBetweenAnd

	self assert: (self tenMeters between: self oneMeter and: (Measure amount: 11 unit: self meter)).
	self assert: (self tenMeters between: self oneMeter and: self tenMeters).
	self assert: (self tenMeters between: self tenMeters and: self tenMeters).
	self assert: (self tenMeters between: self oneCentimeter and: self oneKilometer).


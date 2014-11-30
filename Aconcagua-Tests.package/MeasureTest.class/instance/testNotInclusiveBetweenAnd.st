test magnitude protocol
testNotInclusiveBetweenAnd

	self assert: (self tenMeters notInclusiveBetween: self oneMeter and: (Measure amount: 11 unit: self meter)).
	self assert: (self tenMeters notInclusiveBetween: self oneMeter and: self tenMeters).
	self deny: (self tenMeters notInclusiveBetween: self tenMeters and: (Measure amount: 11 unit: self meter)).


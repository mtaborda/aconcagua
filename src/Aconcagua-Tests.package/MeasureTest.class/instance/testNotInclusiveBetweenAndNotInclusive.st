test magnitude protocol
testNotInclusiveBetweenAndNotInclusive

	self assert: (self tenMeters notInclusiveBetween: self oneMeter andNotInclusive: (Measure amount: 11 unit: self meter)).
	self deny: (self tenMeters notInclusiveBetween: self tenMeters andNotInclusive: (Measure amount: 11 unit: self meter)).
	self deny: (self tenMeters notInclusiveBetween: self oneMeter andNotInclusive: self tenMeters).


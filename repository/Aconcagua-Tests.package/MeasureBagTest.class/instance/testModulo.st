test integer division
testModulo

	self assert: ((self tenPesos + self twentyDollars) // 8) = (self onePeso + self twoDollars).
	self assert:
		((self tenPesos + self twentyDollars) // -11) = (self onePeso negated - self twoDollars).
	self assert:
		((self tenPesos + self twentyDollars) // 3) = (
			(Measure amount: (10 // 3) unit: self peso) +
				(Measure amount: (20 // 3) unit: self dollar))
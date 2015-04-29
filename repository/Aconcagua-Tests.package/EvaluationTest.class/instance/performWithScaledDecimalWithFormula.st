generic tests
performWithScaledDecimalWithFormula

	self assert: (27.02s2 perform: messageName with: formulaOfTenPesos) value = 
		(27.02s2 value perform: messageName with: formulaOfTenPesos value)
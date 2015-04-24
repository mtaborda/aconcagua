generic tests
performWithFormulaWithScaledDecimal

	self assert: (formulaOfTenPesos perform: messageName with: 1.02s2) value = 
		(formulaOfTenPesos value perform: messageName with: 1.02s2 value)
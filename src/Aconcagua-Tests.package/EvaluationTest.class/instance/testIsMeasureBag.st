testing
testIsMeasureBag

	self deny: formulaOfTenPesos isMeasureBag.
	self assert: (DummyEvaluation of: (peso with: 1) + (dollar with: 1)) isMeasureBag
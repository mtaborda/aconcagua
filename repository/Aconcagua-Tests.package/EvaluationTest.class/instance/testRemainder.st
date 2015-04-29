testing
testRemainder

	| testsToFail |
	
	testsToFail := #(
		#performWithFormulaWithMeasureBag
		#performWithMeasureBagWithFormula		
		).	
	self shouldFail: testsToFail shouldPassRestFor: #\\
test comparing
testEqualWithDifferentBagSizeIsNothing

	self assert: (MeasureBag with: self zeroPesos with: self zeroDollars) =
		(MeasureBag measures: (Array with: self zeroPesos))
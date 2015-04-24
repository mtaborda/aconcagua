test comparing
testEqualWithDifferentBagSizeButRepresentSameEntity

	self assert: (MeasureBag with: self onePeso with: self zeroDollars) =
		(MeasureBag measures: (Array with: self onePeso))
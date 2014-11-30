test comparing
testEqualNumber

	self assert: (MeasureBag with: self zeroPesos with: 1) = 1.
	self assert: 1 = (MeasureBag with: self zeroPesos with: 1)
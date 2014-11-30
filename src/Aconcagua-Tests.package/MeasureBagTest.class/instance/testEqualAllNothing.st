test comparing
testEqualAllNothing

	self assert: (MeasureBag with: self zeroPesos with: self zeroDollars) = (MeasureBag with: self zeroPesos with: self zeroDollars).
	self assert: (MeasureBag with: self zeroPesos with: self zeroDollars) = self zeroPesos.
	self assert: (MeasureBag with: self zeroPesos with: self zeroDollars) = self zeroDollars	
test comparing
testEqualOneNothing

	self assert: (MeasureBag with: self zeroPesos with: self tenDollars) = (MeasureBag with: self zeroPesos with: self tenDollars).
	self assert: (MeasureBag with: self zeroPesos with: self tenDollars) = (MeasureBag with: self tenDollars with: self zeroPesos).
	self assert: (MeasureBag with: self zeroPesos with: self tenDollars) = self tenDollars.
	self assert: (MeasureBag with: self tenDollars with: self zeroPesos) = self tenDollars
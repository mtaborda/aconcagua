test comparing
testHashOneNothing

	self assert: (MeasureBag with: self zeroPesos with: self tenDollars) hash = (MeasureBag with: self zeroPesos with: self tenDollars) hash.
	self assert: (MeasureBag with: self zeroPesos with: self tenDollars) hash = (MeasureBag with: self tenDollars with: self zeroPesos) hash.
	self assert: (MeasureBag with: self zeroPesos with: self tenDollars) hash = self tenDollars hash.
	self assert: (MeasureBag with: self tenDollars with: self zeroPesos ) hash = self tenDollars hash
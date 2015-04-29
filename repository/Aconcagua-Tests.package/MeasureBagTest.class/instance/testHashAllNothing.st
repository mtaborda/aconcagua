test comparing
testHashAllNothing

	self assert: (MeasureBag with: self zeroPesos with: self zeroDollars) hash = (MeasureBag with: self zeroPesos with: self zeroDollars) hash.
	self assert: (MeasureBag with: self zeroPesos with: self zeroDollars) hash = self zeroPesos hash.
	self assert: (MeasureBag with: self zeroPesos with: self zeroDollars) hash = self zeroDollars hash
test comparing
testNotEqual

	self deny: (MeasureBag with: self zeroPesos with: 1) = 'hello'.
	self deny: 'hello' = (MeasureBag with: self zeroPesos with: 1).

	self deny: (MeasureBag with: self zeroPesos with: 1) = Object new.
	self deny: Object new = (MeasureBag with: self zeroPesos with: 1)
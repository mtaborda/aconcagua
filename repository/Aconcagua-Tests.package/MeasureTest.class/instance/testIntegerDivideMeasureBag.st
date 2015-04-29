test
testIntegerDivideMeasureBag

	self assert:
		(self fiveDollars moduloMeasureBag: self fiveDollars + self fivePesos) =
			(1 + (self onePeso / self oneDollar))
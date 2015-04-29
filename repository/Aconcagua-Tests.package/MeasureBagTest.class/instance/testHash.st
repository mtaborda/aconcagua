test comparing
testHash

	self assert: (MeasureBag with: self tenPesos with: self twentyDollars) hash = (MeasureBag with: self tenPesos with: self twentyDollars) hash.
	self assert: (MeasureBag with: self tenPesos with: self twentyDollars) hash = (MeasureBag with: self twentyDollars with: self tenPesos ) hash.
	self assert: (MeasureBag measures: (OrderedCollection with: self tenPesos with: self twentyDollars with: self tenEuros)) hash=
		(MeasureBag measures: (OrderedCollection with: self tenEuros with: self twentyDollars with: self tenPesos)) hash.
	
	self deny: (MeasureBag with: self tenPesos with: self twentyDollars) hash = (MeasureBag with: (self tenPesos+self onePeso) with: self twentyDollars) hash
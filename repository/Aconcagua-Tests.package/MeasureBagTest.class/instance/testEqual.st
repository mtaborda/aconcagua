test comparing
testEqual

	self assert: (MeasureBag with: self tenPesos with: self twentyDollars) = (MeasureBag with: self tenPesos with: self twentyDollars).
	self assert: (MeasureBag with: self tenPesos with: self twentyDollars) = (MeasureBag with: self twentyDollars with: self tenPesos ).
	self assert: (MeasureBag measures: (OrderedCollection with: self tenPesos with: self twentyDollars with: self tenEuros)) =
		(MeasureBag measures: (OrderedCollection with: self tenEuros with: self twentyDollars with: self tenPesos)).
	
	self deny: (MeasureBag with: self tenPesos with: self twentyDollars) = (MeasureBag with: (self tenPesos+self onePeso) with: self twentyDollars)
	
*Aconcagua-Core-ArithmeticModel
createBagWithNumber: aNumber

	Error signal: (
		'A MeasureBag should not be creates only with numbers: <1p> <2p>'
			expandMacrosWith: self
			with: aNumber)
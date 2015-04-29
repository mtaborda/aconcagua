test comparing
testEqualsMeasureBag

	| measureBag |

	measureBag := ((BaseUnit named: 'peso') with: 5) + ((BaseUnit named: 'dollar') with: 5).
	self assert: (MinusInfinity equalsMeasureBag: MinusInfinity).
	self deny: (MinusInfinity equalsMeasureBag: measureBag)
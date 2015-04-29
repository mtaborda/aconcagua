test comparing
testEqualsMeasureBag

	| measureBag |

	measureBag := ((BaseUnit named: 'peso') with: 5) + ((BaseUnit named: 'dollar') with: 5).
	self assert: (Infinity equalsMeasureBag: Infinity).
	self deny: (Infinity equalsMeasureBag: measureBag)
test comparing
testEqualsMeasure

	| measure |

	measure := (BaseUnit named: 'peso') with: 5.
	self assert: (MinusInfinity equalsMeasure: MinusInfinity).
	self deny: (MinusInfinity equalsMeasure: measure)
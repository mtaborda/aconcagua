test comparing
testEqualsMeasure

	| measure |

	measure := (BaseUnit named: 'peso') with: 5.
	self assert: (Infinity equalsMeasure: Infinity).
	self deny: (Infinity equalsMeasure: measure)
test accessing
testMeasures

	| measureBag |

	measureBag := MeasureBag with: self tenPesos with: self twentyDollars.

	self assert: measureBag measures size = 2.
	self assert: (measureBag measures includes: self tenPesos).
	self assert: (measureBag measures includes: self twentyDollars).
	self deny: (measureBag measures includes: 0)
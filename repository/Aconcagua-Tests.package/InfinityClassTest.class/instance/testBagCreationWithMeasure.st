test bag creation
testBagCreationWithMeasure

	| bag |

	bag := (10 * meter) + (Infinity * second).

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10 * meter).
	self assert: (bag measures includes: Infinity * second)
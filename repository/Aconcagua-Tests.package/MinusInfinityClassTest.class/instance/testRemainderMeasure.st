test arithmetic operations
testRemainderMeasure

	self
		should: [MinusInfinity remainderMeasure: 5 * meter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity']
Class {
	#name : #MinusInfinityClassTest,
	#superclass : #TestCase,
	#instVars : [
		'meter',
		'second'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #initialization }
MinusInfinityClassTest >> setUp [

	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testAdd [

	self assert: MinusInfinity + MinusInfinity = MinusInfinity.
	self assert: 9 + MinusInfinity = MinusInfinity.
	self assert: MinusInfinity + 9 = MinusInfinity.
	self
		should: [MinusInfinity + Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Sum operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [Infinity + MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Sum operation is indeterminate between Infinity and Minus Infinity']
]

{ #category : #'test accessing' }
MinusInfinityClassTest >> testAmount [

	self assert: MinusInfinity = MinusInfinity
]

{ #category : #'test bag creation' }
MinusInfinityClassTest >> testBagCreationWithMeasure [

	| bag |

	bag := (10 * meter) + (MinusInfinity * second).

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10 * meter).
	self assert: (bag measures includes: MinusInfinity * second)
]

{ #category : #'test bag creation' }
MinusInfinityClassTest >> testBagCreationWithNumber [

	| bag otherBag |

	bag := 10 + (MinusInfinity * second).
	otherBag := (MinusInfinity * meter) + 10.

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10).
	self assert: (bag measures includes: MinusInfinity * second).

	self assert: otherBag isMeasureBag.
	self assert: (otherBag measures includes: MinusInfinity * meter).
	self assert: (otherBag measures includes: 10)
]

{ #category : #'test accessing' }
MinusInfinityClassTest >> testBaseUnit [

	self assert: MinusInfinity baseUnit = NullUnit new
]

{ #category : #'test magnitude protocol' }
MinusInfinityClassTest >> testBetweenAnd [


	self assert: (MinusInfinity between: MinusInfinity and: 1).
	self assert: (MinusInfinity between: MinusInfinity and: MinusInfinity).
	self deny: (MinusInfinity between: 1 and: 10)
]

{ #category : #'test converting' }
MinusInfinityClassTest >> testConvertAmountToBaseUnit [

	self assert: MinusInfinity convertAmountToBaseUnit = 0
]

{ #category : #'test converting' }
MinusInfinityClassTest >> testConvertTo [

	| unit |

	unit := BaseUnit named: 'peso'.
	self
		should: [MinusInfinity convertTo: unit]
		raise: CanNotConvertMeasureException
		withExceptionDo: [:anException |
			self assert:
				anException description = 'It is not possible to convert Minus Infinity to peso']
]

{ #category : #'test converting' }
MinusInfinityClassTest >> testConvertToBaseUnit [

	self assert: MinusInfinity convertToBaseUnit = MinusInfinity
]

{ #category : #'test accessing' }
MinusInfinityClassTest >> testDenominator [

	self assert: MinusInfinity denominator = 1
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testDivide [

	self
		should: [MinusInfinity / MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and Minus Infinity'].
	self
		should: [MinusInfinity / Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [Infinity / MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and Minus Infinity'].
	self assert: 9 / MinusInfinity = 0.
	self
		should: [MinusInfinity / 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and 9']
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testDivideByUnit [

	self assert: (MinusInfinity divideByUnit: meter) = (0 * meter)
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testDivideMeasure [

	self assert: (MinusInfinity divideMeasure: meter * 5) = 0
]

{ #category : #'test comparing' }
MinusInfinityClassTest >> testEqualsMeasure [

	| measure |

	measure := (BaseUnit named: 'peso') with: 5.
	self assert: (MinusInfinity equalsMeasure: MinusInfinity).
	self deny: (MinusInfinity equalsMeasure: measure)
]

{ #category : #'test comparing' }
MinusInfinityClassTest >> testEqualsMeasureBag [

	| measureBag |

	measureBag := ((BaseUnit named: 'peso') with: 5) + ((BaseUnit named: 'dollar') with: 5).
	self assert: (MinusInfinity equalsMeasureBag: MinusInfinity).
	self deny: (MinusInfinity equalsMeasureBag: measureBag)
]

{ #category : #'test testing' }
MinusInfinityClassTest >> testIsMeasureBag [

	self deny: MinusInfinity isMeasureBag
]

{ #category : #'test testing' }
MinusInfinityClassTest >> testIsNothing [

	self deny: MinusInfinity isNothing
]

{ #category : #'test magnitude protocol' }
MinusInfinityClassTest >> testMax [

	self assert: (MinusInfinity max: 5) = 5.
	self assert: (5 max: MinusInfinity) = 5.
	self assert: (Infinity max: MinusInfinity) = Infinity.
	self assert: (MinusInfinity max: Infinity) = Infinity.
	self assert: (MinusInfinity max: MinusInfinity) = MinusInfinity
]

{ #category : #'test magnitude protocol' }
MinusInfinityClassTest >> testMin [

	self assert: (MinusInfinity min: 5) = MinusInfinity.
	self assert: (5 min: MinusInfinity) = MinusInfinity.
	self assert: (Infinity min: MinusInfinity) = MinusInfinity.
	self assert: (MinusInfinity min: Infinity) = MinusInfinity.
	self assert: (MinusInfinity min: MinusInfinity) = MinusInfinity
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testModulo [

	self
		should: [MinusInfinity // MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and Minus Infinity'].
	self
		should: [MinusInfinity // Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [Infinity // MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and Minus Infinity'].
	self assert: 9 // MinusInfinity = 0.
	self
		should: [MinusInfinity // 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and 9']
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testModuloMeasure [

	self assert: (MinusInfinity moduloMeasure: 5 * meter) = 0
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplication [

	self assert: MinusInfinity * MinusInfinity = Infinity.
	self assert: 9 * MinusInfinity = MinusInfinity.
	self assert: -9 * MinusInfinity = Infinity.
	self assert: MinusInfinity * 9 = MinusInfinity.
	self assert: MinusInfinity * -9 = Infinity.
	self assert: MinusInfinity * Infinity = MinusInfinity.
	self assert: Infinity * MinusInfinity = MinusInfinity.

	self
		should: [0 * MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity'].

	self
		should: [MinusInfinity * 0]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity']
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplyByUnit [

	self assert: (MinusInfinity multiplyByUnit: meter) = (MinusInfinity * meter)
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testMultiplyMeasure [

	self assert: (MinusInfinity multiplyMeasure: 5 * meter) = MinusInfinity
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testNegated [

	self assert: MinusInfinity negated = Infinity
]

{ #category : #'test testing' }
MinusInfinityClassTest >> testNegative [

	self deny: MinusInfinity negative
]

{ #category : #'test accessing' }
MinusInfinityClassTest >> testNumerator [

	self assert: MinusInfinity numerator = MinusInfinity
]

{ #category : #'test testing' }
MinusInfinityClassTest >> testPositive [

	self assert: MinusInfinity positive
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testRemainder [

	self
		should: [MinusInfinity \\ MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and Minus Infinity'].
	self
		should: [MinusInfinity \\ Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [Infinity \\ MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [MinusInfinity \\ 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and 9'].
	self
		should: [9 \\ MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity']
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testRemainderMeasure [

	self
		should: [MinusInfinity remainderMeasure: 5 * meter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity']
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testRoundTo [

	self assert: (MinusInfinity roundTo: 2) = MinusInfinity
]

{ #category : #'test testing' }
MinusInfinityClassTest >> testSameDomainAs [

	self assert: (MinusInfinity sameDomainAs: 1).
	self deny: (MinusInfinity sameDomainAs: ((BaseUnit named: 'peso') with: 1))
]

{ #category : #'test testing' }
MinusInfinityClassTest >> testSameUnitAs [

	self assert: (MinusInfinity sameUnitAs: 1).
	self deny: (MinusInfinity sameUnitAs: ((BaseUnit named: 'peso') with: 1))
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testSubtract [

	self
		should: [MinusInfinity - MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Minus Infinity and Minus Infinity'].
	self
		should: [MinusInfinity - Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [Infinity - MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Infinity and Minus Infinity'].
	self assert: 9 - MinusInfinity = Infinity.
	self assert: MinusInfinity - 9 = MinusInfinity
]

{ #category : #'test interval protocol' }
MinusInfinityClassTest >> testToBy [

	| interval |

	interval := MinusInfinity to: MinusInfinity by: 5.
	self
		assert: interval from = MinusInfinity;
		assert: interval to = MinusInfinity;
		assert: interval size = Infinity;
		assert: interval by = 5
]

{ #category : #'test interval protocol' }
MinusInfinityClassTest >> testToFromFixed [

	| interval |

	interval := 5 toMinusInfinity.
	self
		assert: interval from = 5;
		assert: interval to = MinusInfinity;
		assert: interval size = Infinity;
		assert: interval by = 1
]

{ #category : #'test interval protocol' }
MinusInfinityClassTest >> testToInfinity [

	| interval |

	interval := MinusInfinity to: MinusInfinity.
	self
		assert: interval from = MinusInfinity;
		assert: interval to = MinusInfinity;
		assert: interval size = Infinity;
		assert: interval by = 1
]

{ #category : #'test interval protocol' }
MinusInfinityClassTest >> testToToFixed [

	| interval |

	interval := MinusInfinity to: 5.
	self
		assert: interval from = MinusInfinity;
		assert: interval to = 5;
		assert: interval size = Infinity;
		assert: interval by = 1
]

{ #category : #'test arithmetic operations' }
MinusInfinityClassTest >> testTruncated [

	self assert: MinusInfinity truncated = MinusInfinity
]

{ #category : #'test accessing' }
MinusInfinityClassTest >> testUnit [

	self assert: MinusInfinity unit = NullUnit new
]

{ #category : #'test accessing' }
MinusInfinityClassTest >> testUnitNameOf [

	| unit |

	unit := BaseUnit named: 'meter'.
	self assert: (MinusInfinity unitNameOf: unit) = 'meters'
]

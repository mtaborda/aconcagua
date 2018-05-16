Class {
	#name : #InfinityClassTest,
	#superclass : #TestCase,
	#instVars : [
		'meter',
		'second'
	],
	#category : 'Aconcagua-Tests-MeasureModel'
}

{ #category : #initialization }
InfinityClassTest >> setUp [

	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testAdd [

	self assert: Infinity + Infinity = Infinity.
	self assert: 9 + Infinity = Infinity.
	self assert: Infinity + 9 = Infinity.
	self
		should: [Infinity + MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Sum operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [MinusInfinity + Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Sum operation is indeterminate between Minus Infinity and Infinity']
]

{ #category : #'test accessing' }
InfinityClassTest >> testAmount [

	self assert: Infinity = Infinity
]

{ #category : #'test bag creation' }
InfinityClassTest >> testBagCreationWithMeasure [

	| bag |

	bag := (10 * meter) + (Infinity * second).

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10 * meter).
	self assert: (bag measures includes: Infinity * second)
]

{ #category : #'test bag creation' }
InfinityClassTest >> testBagCreationWithNumber [

	| bag otherBag |

	bag := 10 + (Infinity * second).
	otherBag := (Infinity * meter) + 10.

	self assert: bag isMeasureBag.
	self assert: (bag measures includes: 10).
	self assert: (bag measures includes: Infinity * second).

	self assert: otherBag isMeasureBag.
	self assert: (otherBag measures includes: Infinity * meter).
	self assert: (otherBag measures includes: 10)
]

{ #category : #'test accessing' }
InfinityClassTest >> testBaseUnit [

	self assert: Infinity baseUnit = NullUnit new
]

{ #category : #'test magnitude protocol' }
InfinityClassTest >> testBetweenAnd [

	self assert: (Infinity between: 1 and: Infinity).
	self deny: (Infinity between: 1 and: 10)
]

{ #category : #'test converting' }
InfinityClassTest >> testConvertAmountToBaseUnit [

	self assert: Infinity convertAmountToBaseUnit = 0
]

{ #category : #'test converting' }
InfinityClassTest >> testConvertTo [

	| unit |

	unit := BaseUnit named: 'peso'.
	self
		should: [Infinity convertTo: unit]
		raise: CanNotConvertMeasureException
		withExceptionDo: [:anException |
			self assert: anException description = 'It is not possible to convert Infinity to peso']
]

{ #category : #'test converting' }
InfinityClassTest >> testConvertToBaseUnit [

	self assert: Infinity convertToBaseUnit = Infinity
]

{ #category : #'test accessing' }
InfinityClassTest >> testDenominator [

	self assert: Infinity denominator = 1
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testDivide [

	self
		should: [Infinity / Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and Infinity'].
	self
		should: [Infinity / MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [MinusInfinity / Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and Infinity'].
	self assert: 9 / Infinity = 0.
	self
		should: [Infinity / 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and 9']
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testDivideByUnit [

	self assert: (Infinity divideByUnit: meter) = (0 * meter)
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testDivideMeasure [

	self assert: (Infinity divideMeasure: meter * 5) = 0
]

{ #category : #'test comparing' }
InfinityClassTest >> testEqualsMeasure [

	| measure |

	measure := (BaseUnit named: 'peso') with: 5.
	self assert: (Infinity equalsMeasure: Infinity).
	self deny: (Infinity equalsMeasure: measure)
]

{ #category : #'test comparing' }
InfinityClassTest >> testEqualsMeasureBag [

	| measureBag |

	measureBag := ((BaseUnit named: 'peso') with: 5) + ((BaseUnit named: 'dollar') with: 5).
	self assert: (Infinity equalsMeasureBag: Infinity).
	self deny: (Infinity equalsMeasureBag: measureBag)
]

{ #category : #'test testing' }
InfinityClassTest >> testIsMeasureBag [

	self deny: Infinity isMeasureBag
]

{ #category : #'test testing' }
InfinityClassTest >> testIsNothing [

	self deny: Infinity isNothing
]

{ #category : #'test magnitude protocol' }
InfinityClassTest >> testMax [

	self assert: (Infinity max: 5) = Infinity.
	self assert: (5 max: Infinity) = Infinity.
	self assert: (Infinity max: MinusInfinity) = Infinity.
	self assert: (MinusInfinity max: Infinity) = Infinity.
	self assert: (Infinity max: Infinity) = Infinity
]

{ #category : #'test magnitude protocol' }
InfinityClassTest >> testMin [

	self assert: (Infinity min: 5) = 5.
	self assert: (5 min: Infinity) = 5.
	self assert: (Infinity min: MinusInfinity) = MinusInfinity.
	self assert: (MinusInfinity min: Infinity) = MinusInfinity.
	self assert: (Infinity min: Infinity) = Infinity
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testModulo [

	self
		should: [Infinity // Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and Infinity'].
	self
		should: [Infinity // MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [MinusInfinity // Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and Infinity'].

	self assert: 9 // Infinity = 0.

	self
		should: [Infinity // 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and 9']
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testModuloMeasure [

	self assert: (Infinity moduloMeasure: 5 * meter) = 0
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testMultiplication [

	self assert: Infinity * Infinity = Infinity.
	self assert: 9 * Infinity = Infinity.
	self assert: -9 * Infinity = MinusInfinity.
	self assert: Infinity * 9 = Infinity.
	self assert: Infinity * -9 = MinusInfinity.
	self assert: Infinity * MinusInfinity = MinusInfinity.
	self assert: MinusInfinity * Infinity = MinusInfinity.

	self
		should: [0 * Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity'].

	self
		should: [Infinity * 0]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity']
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testMultiplyByUnit [

	self assert: (Infinity multiplyByUnit: meter) = (Infinity * meter)
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testMultiplyMeasure [

	self assert: (Infinity multiplyMeasure: 5 * meter) = Infinity
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testNegated [

	self assert: Infinity negated = MinusInfinity
]

{ #category : #'test testing' }
InfinityClassTest >> testNegative [

	self deny: Infinity negative
]

{ #category : #'test accessing' }
InfinityClassTest >> testNumerator [

	self assert: Infinity numerator = Infinity
]

{ #category : #'test testing' }
InfinityClassTest >> testPositive [

	self assert: Infinity positive
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testRemainder [

	self
		should: [Infinity \\ Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and Infinity'].
	self
		should: [Infinity \\ MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [MinusInfinity \\ Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and Infinity'].
	self
		should: [Infinity \\ 9]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and 9'].
	self
		should: [9 \\ Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity']
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testRemainderMeasure [

	self
		should: [Infinity remainderMeasure: 5 * meter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity']
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testRoundTo [

	self assert: (Infinity roundTo: 2) = Infinity
]

{ #category : #'test testing' }
InfinityClassTest >> testSameDomainAs [

	self assert: (Infinity sameDomainAs: 1).
	self deny: (Infinity sameDomainAs: ((BaseUnit named: 'peso') with: 1))
]

{ #category : #'test testing' }
InfinityClassTest >> testSameUnitAs [

	self assert: (Infinity sameUnitAs: 1).
	self deny: (Infinity sameUnitAs: ((BaseUnit named: 'peso') with: 1))
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testSubtract [

	self
		should: [Infinity - Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Infinity and Infinity'].
	self
		should: [Infinity - MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Infinity and Minus Infinity'].
	self
		should: [MinusInfinity - Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Subtract operation is indeterminate between Minus Infinity and Infinity'].
	self assert: 9 - Infinity = MinusInfinity.
	self assert: Infinity - 9 = Infinity
]

{ #category : #'test interval protocol' }
InfinityClassTest >> testToBy [

	| interval |

	interval := Infinity to: Infinity by: 5.
	self
		assert: interval from = Infinity;
		assert: interval to = Infinity;
		assert: interval size = Infinity;
		assert: interval by = 5
]

{ #category : #'test interval protocol' }
InfinityClassTest >> testToFromFixed [

	| interval |

	interval := 5 toInfinity.
	self
		assert: interval from = 5;
		assert: interval to = Infinity;
		assert: interval size = Infinity;
		assert: interval by = 1
]

{ #category : #'test interval protocol' }
InfinityClassTest >> testToInfinity [

	| interval |

	interval := Infinity to: Infinity.
	self
		assert: interval from = Infinity;
		assert: interval to = Infinity;
		assert: interval size = Infinity;
		assert: interval by = 1
]

{ #category : #'test interval protocol' }
InfinityClassTest >> testToToFixed [

	| interval |

	interval := Infinity to: 5.
	self
		assert: interval from = Infinity;
		assert: interval to = 5;
		assert: interval size = Infinity;
		assert: interval by = 1
]

{ #category : #'test arithmetic operations' }
InfinityClassTest >> testTruncated [

	self assert: Infinity truncated = Infinity
]

{ #category : #'test accessing' }
InfinityClassTest >> testUnit [

	self assert: Infinity unit = NullUnit new
]

{ #category : #'test accessing' }
InfinityClassTest >> testUnitNameOf [

	| unit |

	unit := BaseUnit named: 'meter'.
	self assert: (Infinity unitNameOf: unit) = 'meters'
]

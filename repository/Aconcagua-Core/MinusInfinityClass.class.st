Class {
	#name : #MinusInfinityClass,
	#superclass : #ArithmeticObject,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #initialization }
MinusInfinityClass class >> initialize [

	self initializeUniqueInstance.
	Smalltalk at: #MinusInfinity put: uniqueInstance
]

{ #category : #initialization }
MinusInfinityClass class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
MinusInfinityClass class >> new [

	^uniqueInstance
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> * aMeasure [

	aMeasure isNothing
		ifTrue: [self signalIndeterminateOperation: 'Multiplication' leftOperand: aMeasure].
	^aMeasure multiplyMinusInfinity: self
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> + aMeasure [

	^aMeasure addMinusInfinity: self
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> - aMeasure [

	^aMeasure subtractMinusInfinity: self
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> / aMeasure [

	self signalIndeterminateOperation: 'Division' rightOperand: aMeasure
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> // aMeasure [

	self signalIndeterminateOperation: 'Modulo' rightOperand: aMeasure
]

{ #category : #'magnitude protocol' }
MinusInfinityClass >> < aMagnitude [

	^true
]

{ #category : #'magnitude protocol' }
MinusInfinityClass >> <= aMagnitude [

	^true
]

{ #category : #'magnitude protocol' }
MinusInfinityClass >> > aMagnitude [

	^false
]

{ #category : #'magnitude protocol' }
MinusInfinityClass >> >= aMagnitude [

	^self = aMagnitude
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> \\ aMeasure [

	self signalIndeterminateOperation: 'Remainder' rightOperand: aMeasure
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> addInfinity: anInfinity [

	self signalIndeterminateOperation: 'Sum' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> addMeasure: aMeasure [

	^self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> addMinusInfinity: anInfinity [

	^self
]

{ #category : #accessing }
MinusInfinityClass >> amount [

	^self
]

{ #category : #accessing }
MinusInfinityClass >> baseUnit [

	^NullUnit new
]

{ #category : #'magnitude protocol' }
MinusInfinityClass >> between: min and: max [

	^(self >= min) and: [self <= max]
]

{ #category : #'magnitude protocol - private' }
MinusInfinityClass >> compareGreaterThan: aNumber [

	^false
]

{ #category : #converting }
MinusInfinityClass >> convertAmountToBaseUnit [

	^self unit convertAmountToBaseUnit: self
]

{ #category : #'converting - private' }
MinusInfinityClass >> convertInSameDomainTo: aTargetUnit [

	^aTargetUnit convertFromBaseUnit: (self unit convertToBaseUnit: self)
]

{ #category : #converting }
MinusInfinityClass >> convertTo: aTargetUnit [

	^(self unit sameDomainAs: aTargetUnit)
		ifTrue: [self convertInSameDomainTo: aTargetUnit]
		ifFalse: [CanNotConvertMeasureException signalSourceMeasure: self targetUnit: aTargetUnit]
]

{ #category : #'converting - private' }
MinusInfinityClass >> convertTo: aTargetUnit using: aMeasureConverter [
	"NOT TO USE. Use the message convert:to:  of MeasureConverter.
	This message is here by a question of double-dispatch.
	If this message is used, the exceptions will not be correctly handleds."

	^aMeasureConverter convertMeasure: self to: aTargetUnit
]

{ #category : #converting }
MinusInfinityClass >> convertToBaseUnit [

	^self convertTo: self baseUnit
]

{ #category : #'bag creation - private' }
MinusInfinityClass >> createBagWith: aMeasure [

	^aMeasure createBagWithMeasure: self
]

{ #category : #'bag creation - private' }
MinusInfinityClass >> createBagWithMeasure: aMeasure [

	^MeasureBag measures: (OrderedCollection with: self with: aMeasure)
]

{ #category : #'bag creation - private' }
MinusInfinityClass >> createBagWithNumber: aNumber [

	^MeasureBag measures: (OrderedCollection with: self with: aNumber)
]

{ #category : #accessing }
MinusInfinityClass >> denominator [

	^1
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> divFrom: aNumber [

	^0
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> divideByUnit: aUnit [

	^aUnit with: 1 / self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> divideInfinity: anInfinity [

	self signalIndeterminateOperation: 'Division' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> divideMeasure: aMeasure [

	^0
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> divideMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Division' leftOperand: aMinusInfinity
]

{ #category : #comparing }
MinusInfinityClass >> equalsMeasure: aMeasure [

	^self = aMeasure
]

{ #category : #comparing }
MinusInfinityClass >> equalsMeasureBag: aMeasureBag [

	^self = aMeasureBag
]

{ #category : #'magnitude protocol - private' }
MinusInfinityClass >> greaterThanMeasure: aMeasure [

	^true
]

{ #category : #testing }
MinusInfinityClass >> isFixed [

	^false
]

{ #category : #testing }
MinusInfinityClass >> isMeasureBag [

	^false
]

{ #category : #testing }
MinusInfinityClass >> isNothing [

	^false
]

{ #category : #'magnitude protocol - private' }
MinusInfinityClass >> lessThanMeasure: aMeasure [

	^false
]

{ #category : #'magnitude protocol' }
MinusInfinityClass >> max: aMagnitude [

	^aMagnitude
]

{ #category : #'magnitude protocol' }
MinusInfinityClass >> min: aMagnitude [

	^self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> moduloInfinity: anInfinity [

	self signalIndeterminateOperation: 'Modulo' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> moduloMeasure: aMeasure [

	^0
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> moduloMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Modulo' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> multiplyByUnit: aUnit [

	^aUnit with: self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> multiplyInfinity: anInfinity [

	^self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> multiplyMeasure: aMeasure [

	^self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> multiplyMinusInfinity: aMinusInfinity [

	^aMinusInfinity negated
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> negated [

	^Infinity
]

{ #category : #testing }
MinusInfinityClass >> negative [

	^false
]

{ #category : #accessing }
MinusInfinityClass >> numerator [

	 ^self
]

{ #category : #testing }
MinusInfinityClass >> positive [

	^true
]

{ #category : #printing }
MinusInfinityClass >> printOn: aStream [

	aStream nextPutAll: 'Minus Infinity'
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> quoFrom: aNumber [

	^aNumber / self
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> remFrom: aNumber [

	^aNumber - (self * (self quoFrom: aNumber))
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> remainderInfinity: anInfinity [

	self signalIndeterminateOperation: 'Remainder' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> remainderMeasure: aMeasure [

	^aMeasure - (self * (self quoFrom: aMeasure))
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> remainderMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Remainder' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> roundTo: aNumber [

	^self
]

{ #category : #testing }
MinusInfinityClass >> sameDomainAs: aMeasure [ 
	
	^self unit sameDomainAs: aMeasure unit
]

{ #category : #testing }
MinusInfinityClass >> sameUnitAs: aMeasure [

	^self unit = aMeasure unit
]

{ #category : #exceptions }
MinusInfinityClass >> signalIndeterminateOperation: anOperationString leftOperand: aLeftOperand [

	IndeterminateOperationException
		signalOperation: anOperationString
		leftOperand: aLeftOperand
		rightOperand: self
]

{ #category : #exceptions }
MinusInfinityClass >> signalIndeterminateOperation: anOperationString rightOperand: aRightOperand [

	IndeterminateOperationException
		signalOperation: anOperationString
		leftOperand: self
		rightOperand: aRightOperand
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> subtractFrom: aNumber [

	^self negated
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> subtractInfinity: anInfinity [

	self signalIndeterminateOperation: 'Subtract' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
MinusInfinityClass >> subtractMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Subtract' leftOperand: aMinusInfinity
]

{ #category : #'interval protocol' }
MinusInfinityClass >> to: stop [

	^self to: stop by: (self unit with: 1)
]

{ #category : #'interval protocol' }
MinusInfinityClass >> to: stop by: step [

	^ArithmeticObjectInterval
		from: self
		to: stop
		by: step
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'arithmetic operations' }
MinusInfinityClass >> truncated [

	^self
]

{ #category : #accessing }
MinusInfinityClass >> unit [

	^self baseUnit
]

{ #category : #accessing }
MinusInfinityClass >> unitNameOf: aUnit [

	^aUnit nameForMany
]

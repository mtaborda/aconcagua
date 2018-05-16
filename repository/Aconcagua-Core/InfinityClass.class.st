Class {
	#name : #InfinityClass,
	#superclass : #ArithmeticObject,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #initialization }
InfinityClass class >> initialize [

	self initializeUniqueInstance.
	Smalltalk at: #Infinity put: uniqueInstance
]

{ #category : #initialization }
InfinityClass class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
InfinityClass class >> new [

	^uniqueInstance
]

{ #category : #'arithmetic operations' }
InfinityClass >> * aMeasure [

	aMeasure isNothing
		ifTrue: [self signalIndeterminateOperation: 'Multiplication' leftOperand: aMeasure].
	^aMeasure multiplyInfinity: self
]

{ #category : #'arithmetic operations' }
InfinityClass >> + aMeasure [

	^aMeasure addInfinity: self
]

{ #category : #'arithmetic operations' }
InfinityClass >> - aMeasure [

	^aMeasure subtractInfinity: self
]

{ #category : #'arithmetic operations' }
InfinityClass >> / aMeasure [

	self signalIndeterminateOperation: 'Division' rightOperand: aMeasure
]

{ #category : #'arithmetic operations' }
InfinityClass >> // aMeasure [

	self signalIndeterminateOperation: 'Modulo' rightOperand: aMeasure
]

{ #category : #'magnitude protocol' }
InfinityClass >> < aMagnitude [

	^false
]

{ #category : #'magnitude protocol' }
InfinityClass >> <= aMagnitude [

	^self = aMagnitude
]

{ #category : #'magnitude protocol' }
InfinityClass >> > aMagnitude [

	^(self = aMagnitude) not
]

{ #category : #'magnitude protocol' }
InfinityClass >> >= aMagnitude [

	^true
]

{ #category : #'arithmetic operations' }
InfinityClass >> \\ aMeasure [

	self signalIndeterminateOperation: 'Remainder' rightOperand: aMeasure
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> addInfinity: anInfinity [

	^self
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> addMeasure: aMeasure [

	^self
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> addMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Sum' leftOperand: aMinusInfinity
]

{ #category : #accessing }
InfinityClass >> amount [

	^self
]

{ #category : #accessing }
InfinityClass >> baseUnit [

	^NullUnit new
]

{ #category : #'magnitude protocol' }
InfinityClass >> between: min and: max [

	^(self >= min) and: [self <= max]
]

{ #category : #'magnitude protocol - private' }
InfinityClass >> compareGreaterThan: aNumber [

	^true
]

{ #category : #converting }
InfinityClass >> convertAmountToBaseUnit [

	^self unit convertAmountToBaseUnit: self
]

{ #category : #'converting - private' }
InfinityClass >> convertInSameDomainTo: aTargetUnit [

	^aTargetUnit convertFromBaseUnit: (self unit convertToBaseUnit: self)
]

{ #category : #converting }
InfinityClass >> convertTo: aTargetUnit [

	^(self unit sameDomainAs: aTargetUnit)
		ifTrue: [self convertInSameDomainTo: aTargetUnit]
		ifFalse: [CanNotConvertMeasureException signalSourceMeasure: self targetUnit: aTargetUnit]
]

{ #category : #'converting - private' }
InfinityClass >> convertTo: aTargetUnit using: aMeasureConverter [
	"NOT TO USE. Use the message convert:to:  of MeasureConverter.
	This message is here by a question of double-dispatch.
	If this message is used, the exceptions will not be correctly handleds."

	^aMeasureConverter convertMeasure: self to: aTargetUnit
]

{ #category : #converting }
InfinityClass >> convertToBaseUnit [

	^self convertTo: self baseUnit
]

{ #category : #'bag creation - private' }
InfinityClass >> createBagWith: aMeasure [

	^aMeasure createBagWithMeasure: self
]

{ #category : #'bag creation - private' }
InfinityClass >> createBagWithMeasure: aMeasure [

	^MeasureBag measures: (OrderedCollection with: self with: aMeasure)
]

{ #category : #'bag creation - private' }
InfinityClass >> createBagWithNumber: aNumber [

	^MeasureBag measures: (OrderedCollection with: self with: aNumber)
]

{ #category : #accessing }
InfinityClass >> denominator [

	^1
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> divFrom: aNumber [

	^0
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> divideByUnit: aUnit [

	^aUnit with: 1 / self
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> divideInfinity: anInfinity [

	self signalIndeterminateOperation: 'Division' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> divideMeasure: aMeasure [

	^0
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> divideMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Division' leftOperand: aMinusInfinity
]

{ #category : #comparing }
InfinityClass >> equalsMeasure: aMeasure [

	^self = aMeasure
]

{ #category : #comparing }
InfinityClass >> equalsMeasureBag: aMeasureBag [

	^self = aMeasureBag
]

{ #category : #'magnitude protocol - private' }
InfinityClass >> greaterThanMeasure: aMeasure [

	^true
]

{ #category : #testing }
InfinityClass >> isFixed [

	^false
]

{ #category : #testing }
InfinityClass >> isMeasureBag [

	^false
]

{ #category : #testing }
InfinityClass >> isNothing [

	^false
]

{ #category : #'magnitude protocol - private' }
InfinityClass >> lessThanMeasure: aMeasure [

	^false
]

{ #category : #'magnitude protocol' }
InfinityClass >> max: aMagnitude [

	^self
]

{ #category : #'magnitude protocol' }
InfinityClass >> min: aMagnitude [

	^aMagnitude
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> moduloInfinity: anInfinity [

	self signalIndeterminateOperation: 'Modulo' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> moduloMeasure: aMeasure [

	^0
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> moduloMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Modulo' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> multiplyByUnit: aUnit [

	^aUnit with: self
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> multiplyInfinity: anInfinity [

	^self
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> multiplyMeasure: aMeasure [

	^self
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> multiplyMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'arithmetic operations' }
InfinityClass >> negated [

	^MinusInfinity
]

{ #category : #testing }
InfinityClass >> negative [

	^false
]

{ #category : #accessing }
InfinityClass >> numerator [

	 ^self
]

{ #category : #testing }
InfinityClass >> positive [

	^true
]

{ #category : #printing }
InfinityClass >> printOn: aStream [

	aStream nextPutAll: 'Infinity'
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> quoFrom: aNumber [

	^aNumber / self
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> remFrom: aNumber [

	^aNumber - (self * (self quoFrom: aNumber))
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> remainderInfinity: anInfinity [

	self signalIndeterminateOperation: 'Remainder' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> remainderMeasure: aMeasure [

	^aMeasure - (self * (self quoFrom: aMeasure))
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> remainderMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Remainder' leftOperand: aMinusInfinity
]

{ #category : #'arithmetic operations' }
InfinityClass >> roundTo: aNumber [

	^self
]

{ #category : #testing }
InfinityClass >> sameDomainAs: aMeasure [ 
	
	^self unit sameDomainAs: aMeasure unit
]

{ #category : #testing }
InfinityClass >> sameUnitAs: aMeasure [

	^self unit = aMeasure unit
]

{ #category : #exceptions }
InfinityClass >> signalIndeterminateOperation: anOperationString leftOperand: aLeftOperand [

	IndeterminateOperationException
		signalOperation: anOperationString
		leftOperand: aLeftOperand
		rightOperand: self
]

{ #category : #exceptions }
InfinityClass >> signalIndeterminateOperation: anOperationString rightOperand: aRightOperand [

	IndeterminateOperationException
		signalOperation: anOperationString
		leftOperand: self
		rightOperand: aRightOperand
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> subtractFrom: aNumber [

	^self negated
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> subtractInfinity: anInfinity [

	self signalIndeterminateOperation: 'Subtract' leftOperand: anInfinity
]

{ #category : #'arithmetic operations - private' }
InfinityClass >> subtractMinusInfinity: aMinusInfinity [

	self signalIndeterminateOperation: 'Subtract' leftOperand: aMinusInfinity
]

{ #category : #'interval protocol' }
InfinityClass >> to: stop [

	^self to: stop by: (self unit with: 1)
]

{ #category : #'interval protocol' }
InfinityClass >> to: stop by: step [

	^ArithmeticObjectInterval
		from: self
		to: stop
		by: step
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'arithmetic operations' }
InfinityClass >> truncated [

	^self
]

{ #category : #accessing }
InfinityClass >> unit [

	^self baseUnit
]

{ #category : #accessing }
InfinityClass >> unitNameOf: aUnit [

	^aUnit nameForMany
]

Extension { #name : #Number }

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> addInfinity: anInfinity [

	^anInfinity
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> addMeasure: aMeasure [

	^MeasureBag with: aMeasure with: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> addMeasureBag: aMeasureBag [

	^aMeasureBag addMeasure: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> addMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> amount [

	^self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> baseUnit [

	^NullUnit new
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> compareGreaterThan: aNumber [

	^aNumber < self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> convertAmountToBaseUnit [

	^self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> convertTo: aTargetUnit [ 
	"A number only can be converted in a number... therefore, if the unit to which it is wanted to convert
	is the same to the one of the numbers returns self, else returns an error."
	
	^aTargetUnit = self baseUnit
		ifTrue: [ self ]
		ifFalse: [ 
			CanNotConvertMeasureException
				signalSourceMeasure: self 
				targetUnit: aTargetUnit ]
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> convertToBaseUnit [

	^self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> createBagWith: aMeasure [

	^aMeasure createBagWithNumber: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> createBagWithMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure]
		ifFalse: [aMeasure createBagWithNumber: self]
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> createBagWithNumber: aNumber [

	Error signal: (
		'A MeasureBag should not be creates only with numbers: <1p> <2p>'
			expandMacrosWith: self
			with: aNumber)
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> denominator [

	^1
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> divideByUnit: aUnit [

	^aUnit with: 1 / self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> divideInfinity: anInfinity [

	^0
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> divideMeasure: aMeasure [

	^Measure amount: aMeasure amount / self unit: aMeasure unit
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> divideMeasureBag: aMeasureBag [

	^aMeasureBag divideByMeasure: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> divideMinusInfinity: aMinusInfinity [

	^0
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> equalsMeasure: aMeasure [

	^self isNothing and: [aMeasure isNothing]
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> equalsMeasureBag: aMeasureBag [

	^aMeasureBag equalsMeasure: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> fromInfinity [

	^ArithmeticObjectInterval
		from: Infinity
		to: self
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> fromMinusInfinity [

	^ArithmeticObjectInterval
		from: MinusInfinity
		to: self
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> greaterThanMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure < aMeasure unit nullMeasure]
		ifFalse: [(aMeasure convertTo: self baseUnit) amount < self]
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> isFixed [

	^true
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> isMeasureBag [

	^false
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> isNothing [

	^self = 0
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> lessThanMeasure: aMeasure [

	^self isNothing 
		ifTrue: [aMeasure > aMeasure unit nullMeasure]
		ifFalse: [(aMeasure convertTo: self baseUnit) amount > self]
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> moduloInfinity: anInfinity [

	^0
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> moduloMeasure: aMeasure [

	^Measure amount: aMeasure amount // self unit: aMeasure unit
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> moduloMeasureBag: aMeasureBag [

	^aMeasureBag moduloByMeasure: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> moduloMinusInfinity: aMInusInfinity [

	^0
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> multiplyByUnit: aUnit [

	^aUnit with: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> multiplyInfinity: anInfinity [

	^self > 0 ifTrue: [anInfinity] ifFalse: [anInfinity negated]
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> multiplyMeasure: aMeasure [

	^Measure amount: aMeasure amount * self unit: aMeasure unit
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> multiplyMeasureBag: aMeasureBag [

	^aMeasureBag multiplyMeasure: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> multiplyMinusInfinity: aMinusInfinity [

	^self > 0 ifTrue: [aMinusInfinity] ifFalse: [aMinusInfinity negated]
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> numerator [

	^self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> remainderInfinity: anInfinity [

	^0
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> remainderMeasure: aMeasure [

	^Measure amount: aMeasure amount \\ self unit: aMeasure unit
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> remainderMeasureBag: aMeasureBag [

	^aMeasureBag remainderByMeasure: self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> remainderMinusInfinity: aMinusInfinity [

	^0
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> sameDomainAs: aMeasure [

	^self unit sameDomainAs: aMeasure unit
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> subtractFrom: aNumber [

	^aNumber - self
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> subtractInfinity: anInfinity [

	^anInfinity
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> subtractMinusInfinity: aMinusInfinity [

	^aMinusInfinity
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> toInfinity [

	^ArithmeticObjectInterval
		from: self
		to: Infinity
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> toMinusInfinity [

	^ArithmeticObjectInterval
		from: self
		to: MinusInfinity
		by: 1
		intervalStrategy: InfinityIntervalStrategy new
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> unit [

	^self baseUnit
]

{ #category : #'*Aconcagua-Core-ArithmeticModel' }
Number >> unitNameOf: aUnit [

	^self abs = 1 ifTrue: [aUnit nameForOne] ifFalse: [aUnit nameForMany]
]

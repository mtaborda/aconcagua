Class {
	#name : #MeasureBagFraction,
	#superclass : #Fraction,
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'arithmetic operations' }
MeasureBagFraction >> = anObject [

	^self class = anObject class ifTrue:[ (numerator * anObject denominator) = (denominator * anObject numerator)  ]
	ifFalse:[super = anObject 		]
]

{ #category : #'arithmetic operations' }
MeasureBagFraction >> isFraction [

	^false
]

{ #category : #private }
MeasureBagFraction >> numerator: aNumerator denominator: aDenominator [

	self setNumerator: aNumerator denominator: aDenominator
]

{ #category : #printing }
MeasureBagFraction >> printOn: aStream base: base [

	aStream nextPut: $(.
	numerator printOn: aStream.
	aStream nextPut: $/.
	denominator printOn: aStream.
	aStream nextPut: $)
]

{ #category : #private }
MeasureBagFraction >> setNumerator: aNumerator denominator: aDenominator [

	aDenominator = 0
		ifTrue: [^(ZeroDivide dividend: aNumerator) signal]
		ifFalse: 
			[numerator := aNumerator.
			denominator := aDenominator]
]

{ #category : #'arithmetic operations' }
MeasureBagFraction >> truncated [

	InvalidUnaryOperationException signalOperationName: 'truncated' operand: self
]

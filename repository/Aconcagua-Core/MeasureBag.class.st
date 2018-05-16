Class {
	#name : #MeasureBag,
	#superclass : #MeasureBehavior,
	#instVars : [
		'measures'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation - private' }
MeasureBag class >> measures: aCollection [ 
	"NOTE: THIS METHOD IS PRIVATE. IT ASSUMES THE COLLECTION HAS NO ZERO MEASURES AND
	MEASURES WITH DIFFERENT UNITS. DO NOT USE IT TO CREATE A MEASUREBAG, USE +, -, ETC"

	^self new initializeMeasures: (aCollection 
				collect: [:measure | measure convertToBaseUnit])
]

{ #category : #'instance creation - private' }
MeasureBag class >> with: aMeasure with: anotherMeasure [
	"This message is not due to never use. A MeasureBag is created sending the messages #+ or #-.
	If the two measures are of the same domain, directly it gives back a canonized measure to the base unit.
	If they are of different domains, adds the measures canonized.
	This comparison is here and not in Measure so that they are not possible to be created incorrect bag.
	
	DEFINITION: A MeasureBag always has its measures canonized."
	
	^(aMeasure sameDomainAs: anotherMeasure)
		ifTrue: [aMeasure addSameDomainMeasure: anotherMeasure]
		ifFalse: [aMeasure createBagWith: anotherMeasure]
]

{ #category : #'arithmetic operations' }
MeasureBag >> * aMeasure [

	^aMeasure multiplyMeasureBag: self

]

{ #category : #'arithmetic operations' }
MeasureBag >> + aMeasure [

	^aMeasure addMeasureBag: self
]

{ #category : #'arithmetic operations' }
MeasureBag >> / aMeasure [ 

	^aMeasure divideMeasureBag: self
]

{ #category : #'arithmetic operations' }
MeasureBag >> // aMeasure [

	^aMeasure moduloMeasureBag: self
]

{ #category : #comparing }
MeasureBag >> = anObject [

	^anObject equalsMeasureBag: self
		
]

{ #category : #'arithmetic operations' }
MeasureBag >> \\ aMeasure [ 

	^aMeasure remainderMeasureBag: self 

]

{ #category : #'arithmetic operations - private' }
MeasureBag >> addMeasure: aMeasureToAdd [

	| newMeasures sameBaseUnitMeasure nonNullMeasures |
	sameBaseUnitMeasure := self atSameBaseUnitAs: aMeasureToAdd unit.
	newMeasures := measures reject: [:aMeasure | aMeasure baseUnit = sameBaseUnitMeasure baseUnit].
	newMeasures add: sameBaseUnitMeasure + aMeasureToAdd.
	nonNullMeasures := newMeasures reject: [:measure | measure isNothing].
	^nonNullMeasures size = 1 
		ifTrue: [nonNullMeasures first]
		ifFalse: [self class measures: nonNullMeasures]
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> addMeasureBag: aMeasureBag [

	| measuresByUnit nonNullMeasures |
	measuresByUnit := Dictionary new.
	measures do: [:aMeasure | measuresByUnit at: aMeasure baseUnit put: aMeasure].
	aMeasureBag measures do: [:aMeasure | | measureToAdd |
		measureToAdd := measuresByUnit at: aMeasure baseUnit ifAbsent: [0].
		measuresByUnit at: aMeasure baseUnit put: measureToAdd + aMeasure].
	nonNullMeasures := measuresByUnit values reject: [:measure | measure isNothing].
	^nonNullMeasures isEmpty
		ifTrue: [0]
		ifFalse: 
			[nonNullMeasures size = 1 
				ifTrue: [nonNullMeasures first]
				ifFalse: [self class measures: nonNullMeasures]]
]

{ #category : #accessing }
MeasureBag >> amount [
	
	Error signal: 'Amount of a MeasureBag is not defined'
]

{ #category : #accessing }
MeasureBag >> atBaseUnit: aBaseUnit ifNone: aBlock [

	^measures detect: [ :aMeasure | aMeasure baseUnit=aBaseUnit ] ifNone: aBlock
	
]

{ #category : #accessing }
MeasureBag >> atSameBaseUnitAs: aUnit [

	^self atBaseUnit: aUnit baseUnit ifNone: [0]
]

{ #category : #converting }
MeasureBag >> convertAmountToBaseUnit [
	"In fact, always one is going away to raise an exception since amount is not defined for a MeasureBag,
	but it was implemented thus so that the semantics is clear and not to repeat the code that generates the exception"

	^self unit convertAmountToBaseUnit: self amount
]

{ #category : #'converting - private' }
MeasureBag >> convertTo: aTargetUnit using: aMeasureConverter [
	"NOT TO USE. Use the message convert:to:  of MeasureConverter.
	This message is here by a question of double-dispatch.
	If this message is used, the exceptions will not be correctly handleds."
	
	^aMeasureConverter convertMeasureBag: self to: aTargetUnit
]

{ #category : #accessing }
MeasureBag >> denominator [

	^1
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> divFrom: aNumber [

	aNumber isNothing ifTrue: [^aNumber].
	"This is necesary because enters an infinity loop when sends #truncate to a Fraction which
	denominator is a MeasureBag"
	^MeasureBagFraction numerator: aNumber denominator: self
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> divideByMeasure: aMeasure [

	^self newBagDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag / aMeasure]
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> divideMeasure: aMeasure [

	^MeasureBagFraction numerator: aMeasure denominator: self
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> divideMeasureBag: aMeasureBag [

	^measures inject: 0 into: [:resultMeasure :aMeasureInBag | resultMeasure + (aMeasureBag / aMeasureInBag)]
]

{ #category : #comparing }
MeasureBag >> equalsMeasure: aMeasure [

	^measures allSatisfy: [:aMeasureInBag | 
		(aMeasureInBag sameDomainAs: aMeasure) 
			ifTrue: [aMeasureInBag = aMeasure]
			ifFalse: [aMeasureInBag isNothing]]
]

{ #category : #comparing }
MeasureBag >> equalsMeasureBag: aMeasureBag [

	^(self - aMeasureBag) isNothing
]

{ #category : #accessing }
MeasureBag >> hash [

	^measures inject: 0 into: [ :hash :measure | hash bitXor: measure hash ].

		
		
]

{ #category : #initialization }
MeasureBag >> initializeMeasures: aCollection [

	measures := aCollection
]

{ #category : #testing }
MeasureBag >> isFixed [

	^measures allSatisfy: [ :aMeasure | aMeasure isFixed]
	
	
]

{ #category : #testing }
MeasureBag >> isMeasureBag [

	^true
]

{ #category : #testing }
MeasureBag >> isNothing [

	^measures allSatisfy: [ :aMeasure | aMeasure isNothing].
	
	
]

{ #category : #accessing }
MeasureBag >> measures [
	"Return a copy because aMeasureBag inmutable"
	
	^measures copy
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> moduloByMeasure: aMeasure [

	^self newBagDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag // aMeasure]
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> moduloMeasure: aMeasure [

	InvalidBinaryOperationException 
		signalOperationName: 'modulo'
		leftOperand: aMeasure
		rightOperand: self
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> moduloMeasureBag: aMeasureBag [

	InvalidBinaryOperationException 
		signalOperationName: 'modulo'
		leftOperand: aMeasureBag
		rightOperand: self
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> multiplyMeasure: aMeasure [

	aMeasure isNothing ifTrue: [^aMeasure].
	^self newBagDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag * aMeasure]
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> multiplyMeasureBag: aMeasureBag [

	^measures inject: 0 into: [:resultMeasure :aMeasureInBag | resultMeasure + (aMeasureBag * aMeasureInBag)]
]

{ #category : #'arithmetic operations' }
MeasureBag >> negated [
	
	^self newBagDoingOnEachMeasure: [:aMeasure | aMeasure negated]
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> newBagDoingOnEachMeasure: aBlock [

	| newMeasures |
	newMeasures := measures collect: aBlock.
	^self class measures: newMeasures
]

{ #category : #accessing }
MeasureBag >> numberOfMeasures [
	
	^measures size
]

{ #category : #accessing }
MeasureBag >> numerator [

	^self
]

{ #category : #printing }
MeasureBag >> printOn: aStream [

	measures do: [:aMeasure | aMeasure printOn: aStream]
		separatedBy: [aStream nextPut: $+]
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> quoFrom: aNumber [

	InvalidBinaryOperationException signalOperationName: 'quotient' leftOperand: aNumber rightOperand: self
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> remFrom: aNumber [

	InvalidBinaryOperationException signalOperationName: 'rest' leftOperand: aNumber rightOperand: self
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> remainderByMeasure: aMeasure [ 
	^self 
		newBagDoingOnEachMeasure: [:aMeasureInBag | aMeasureInBag \\ aMeasure]
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> remainderMeasure: aMeasure [

	InvalidBinaryOperationException 
		signalOperationName: 'remainder'
		leftOperand: aMeasure
		rightOperand: self
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> remainderMeasureBag: aMeasureBag [

	InvalidBinaryOperationException 
		signalOperationName: 'remainder'
		leftOperand: aMeasureBag
		rightOperand: self
]

{ #category : #'arithmetic operations' }
MeasureBag >> roundTo: aNumber [
	
	^self newBagDoingOnEachMeasure: [:aMeasure | aMeasure roundTo: aNumber ]
]

{ #category : #'arithmetic operations - private' }
MeasureBag >> subtractFrom: aNumber [

	^self negated + aNumber
]

{ #category : #'arithmetic operations' }
MeasureBag >> truncated [
	
	^self newBagDoingOnEachMeasure: [:aMeasure | aMeasure truncated ]
]

{ #category : #accessing }
MeasureBag >> unit [
	
	Error signal: 'Unit of a MeasureBag is not defined'
]

{ #category : #accessing }
MeasureBag >> unitNameOf: aUnit [

	Error signal: 'Unit of a MeasureBag is not defined'
]

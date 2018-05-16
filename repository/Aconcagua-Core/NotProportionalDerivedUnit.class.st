Class {
	#name : #NotProportionalDerivedUnit,
	#superclass : #DerivedUnit,
	#instVars : [
		'nameForOne',
		'nameForMany',
		'sign',
		'baseUnit',
		'conversionBlock',
		'reciprocalConversionBlock'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
NotProportionalDerivedUnit class >> baseUnit: aUnit conversionBlock: aBlock reciprocalConversionBlock: anotherBlock nameForOne: aString nameForMany: anotherString sign: aSignString [ 

	^self new 
		initializeBaseUnit: aUnit
		conversionBlock: aBlock
		reciprocalConversionBlock: anotherBlock
		nameForOne: aString
		nameForMany: anotherString
		sign: aSignString
]

{ #category : #'instance creation' }
NotProportionalDerivedUnit class >> baseUnit: aUnit conversionBlock: aBlock reciprocalConversionBlock: anotherBlock named: aString [

	^self 
		baseUnit: aUnit
		conversionBlock: aBlock
		reciprocalConversionBlock: anotherBlock
		nameForOne: aString
		nameForMany: (self nameForManyFrom: aString)
		sign: self defaultSign
]

{ #category : #'instance creation' }
NotProportionalDerivedUnit class >> baseUnit: aUnit conversionBlock: aBlock reciprocalConversionBlock: anotherBlock named: aString sign: aSignString [

	^self 
		baseUnit: aUnit
		conversionBlock: aBlock
		reciprocalConversionBlock: anotherBlock
		nameForOne: aString
		nameForMany: (self nameForManyFrom: aString)
		sign: aSignString
]

{ #category : #accessing }
NotProportionalDerivedUnit >> baseUnit [

	^baseUnit
]

{ #category : #'converting - private' }
NotProportionalDerivedUnit >> convertAmountFromBaseUnit: aNumber [

	^reciprocalConversionBlock value: aNumber
]

{ #category : #converting }
NotProportionalDerivedUnit >> convertAmountToBaseUnit: aNumber [

	^conversionBlock value: aNumber
]

{ #category : #initialization }
NotProportionalDerivedUnit >> initializeBaseUnit: aUnit conversionBlock: aBlock reciprocalConversionBlock: anotherBlock nameForOne: aString nameForMany: anotherString sign: aSignString [

	baseUnit := aUnit.
	conversionBlock := aBlock.
	reciprocalConversionBlock := anotherBlock.
	nameForOne := aString.
	nameForMany := anotherString.
	sign := aSignString
]

{ #category : #accessing }
NotProportionalDerivedUnit >> nameForMany [

	^nameForMany
]

{ #category : #accessing }
NotProportionalDerivedUnit >> nameForOne [

	^nameForOne
]

{ #category : #accessing }
NotProportionalDerivedUnit >> sign [

	^sign
]

Class {
	#name : #ProportionalDerivedUnit,
	#superclass : #DerivedUnit,
	#instVars : [
		'nameForOne',
		'nameForMany',
		'sign',
		'baseUnit',
		'conversionFactor'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
ProportionalDerivedUnit class >> baseUnit: aUnit conversionFactor: aNumber nameForOne: aString nameForMany: anotherString sign: aSignString [

	^self new 
		initializeBaseUnit: aUnit
		conversionFactor: aNumber
		nameForOne: aString
		nameForMany: anotherString
		sign: aSignString
]

{ #category : #'instance creation' }
ProportionalDerivedUnit class >> baseUnit: aUnit conversionFactor: aNumber named: aString [

	^self 
		baseUnit: aUnit
		conversionFactor: aNumber
		nameForOne: aString
		nameForMany: (self nameForManyFrom: aString)
		sign: self defaultSign
]

{ #category : #'instance creation' }
ProportionalDerivedUnit class >> baseUnit: aUnit conversionFactor: aNumber named: aString sign: aSignString [

	^self 
		baseUnit: aUnit
		conversionFactor: aNumber
		nameForOne: aString
		nameForMany: (self nameForManyFrom: aString)
		sign: aSignString
]

{ #category : #accessing }
ProportionalDerivedUnit >> baseUnit [

	^baseUnit
]

{ #category : #accessing }
ProportionalDerivedUnit >> conversionFactor [
	
	^conversionFactor
]

{ #category : #'converting - private' }
ProportionalDerivedUnit >> convertAmountFromBaseUnit: aNumber [

	^aNumber / conversionFactor
]

{ #category : #converting }
ProportionalDerivedUnit >> convertAmountToBaseUnit: aNumber [

	^aNumber * conversionFactor
]

{ #category : #initialization }
ProportionalDerivedUnit >> initializeBaseUnit: aUnit conversionFactor: aNumber nameForOne: aString nameForMany: anotherString sign: aSignString [

	baseUnit := aUnit.
	conversionFactor := aNumber.
	nameForOne := aString.
	nameForMany := anotherString.
	sign := aSignString
]

{ #category : #accessing }
ProportionalDerivedUnit >> nameForMany [

	^nameForMany
]

{ #category : #accessing }
ProportionalDerivedUnit >> nameForOne [

	^nameForOne
]

{ #category : #accessing }
ProportionalDerivedUnit >> sign [

	^sign
]

Class {
	#name : #BaseUnit,
	#superclass : #SimpleUnit,
	#instVars : [
		'nameForOne',
		'nameForMany',
		'sign'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
BaseUnit class >> nameForOne: aString nameForMany: anotherString [

	^self new initializeNameFomOne: aString nameForMany: anotherString sign: self defaultSign
]

{ #category : #'instance creation' }
BaseUnit class >> nameForOne: aString nameForMany: anotherString sign: aSignString [

	^self new initializeNameFomOne: aString nameForMany: anotherString sign: aSignString
]

{ #category : #'instance creation' }
BaseUnit class >> named: aString [ 

	^self 
		nameForOne: aString
		nameForMany: (self nameForManyFrom: aString)
		sign: self defaultSign.

]

{ #category : #'instance creation' }
BaseUnit class >> named: aString sign: aSignString [

	^self 
		nameForOne: aString
		nameForMany: (self nameForManyFrom: aString)
		sign: aSignString

]

{ #category : #accessing }
BaseUnit >> baseUnit [
	
	^self
]

{ #category : #converting }
BaseUnit >> convertAmountToBaseUnit: aNumber [

	^aNumber

]

{ #category : #'converting - private' }
BaseUnit >> convertFromBaseUnit: aMeasure [ 
	
	^aMeasure
]

{ #category : #'converting - private' }
BaseUnit >> convertToBaseUnit: aMeasure [ 
	
	^aMeasure
]

{ #category : #initialization }
BaseUnit >> initializeNameFomOne: aString nameForMany: anotherString sign: aSignString [

	nameForOne := aString.
	nameForMany := anotherString.
	sign := aSignString.
]

{ #category : #accessing }
BaseUnit >> nameForMany [

	^nameForMany
]

{ #category : #accessing }
BaseUnit >> nameForOne [

	^nameForOne
]

{ #category : #accessing }
BaseUnit >> nothingAmount [

	^0
]

{ #category : #accessing }
BaseUnit >> sign [

	^sign
]

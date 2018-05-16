Class {
	#name : #DividedUnit,
	#superclass : #CompoundUnit,
	#instVars : [
		'numerator',
		'denominator'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation - private' }
DividedUnit class >> dividedUnit: aDividedUnit dividedUnit: anotherDividedUnit [

	^(aDividedUnit numerator * anotherDividedUnit denominator) / (aDividedUnit denominator * anotherDividedUnit numerator)

]

{ #category : #'instance creation - private' }
DividedUnit class >> dividedUnit: aDividedUnit multipliedUnit: aMultipliedUnit [

	^(aDividedUnit numerator) / (aDividedUnit denominator * aMultipliedUnit)

]

{ #category : #'instance creation - private' }
DividedUnit class >> dividedUnit: aDividedUnit simpleUnit: aUnit [

	^(aDividedUnit numerator) / (aDividedUnit denominator * aUnit)

]

{ #category : #'instance creation - private' }
DividedUnit class >> multipliedUnit: aMultipliedUnit dividedUnit: aDividedUnit [

	^(aMultipliedUnit * aDividedUnit denominator) / (aDividedUnit numerator)

]

{ #category : #'instance creation - private' }
DividedUnit class >> multipliedUnit: aMultipliedUnit multipliedUnit: anotherMultipliedUnit [

	| numeratorFactors denominatorFactors numerator denominator |

	numeratorFactors := aMultipliedUnit factors.
	denominatorFactors := OrderedCollection new.

	anotherMultipliedUnit factors
		do: [:aUnit | numeratorFactors remove: aUnit ifAbsent: [denominatorFactors add: aUnit]].

	numerator := MultipliedUnit factors: numeratorFactors.
	denominator := MultipliedUnit factors: denominatorFactors.

	^denominator = NullUnit new
		ifTrue: [numerator]
		ifFalse: [self new initializeNumerator: numerator denominator: denominator]
]

{ #category : #'instance creation - private' }
DividedUnit class >> multipliedUnit: aMultipliedUnit simpleUnit: aUnit [

	| numeratorFactors |
	
	numeratorFactors := aMultipliedUnit factors.
	numeratorFactors remove: aUnit ifAbsent: [ ^self new initializeNumerator: aMultipliedUnit denominator: aUnit ].
	
	^MultipliedUnit factors: numeratorFactors


]

{ #category : #'instance creation - private' }
DividedUnit class >> nullUnit: aNullUnit dividedUnit: aDividedUnit [ 
	
	^self new initializeNumerator: aDividedUnit denominator denominator: aDividedUnit numerator.
]

{ #category : #'instance creation - private' }
DividedUnit class >> nullUnit: aNullUnit multipliedUnit: aMultipliedUnit [ 
	
	^self new initializeNumerator: aNullUnit denominator: aMultipliedUnit
]

{ #category : #'instance creation - private' }
DividedUnit class >> nullUnit: aNullUnit simpleUnit: aSimpleUnit [ 

	^self new initializeNumerator: aNullUnit denominator: aSimpleUnit
	
]

{ #category : #'instance creation - private' }
DividedUnit class >> simpleUnit: aUnit dividedUnit: aDividedUnit [

	^(aUnit * aDividedUnit denominator) / (aDividedUnit numerator)

]

{ #category : #'instance creation - private' }
DividedUnit class >> simpleUnit: aUnit multipliedUnit: aMultipliedUnit [

	| denominatorFactors |
	
	denominatorFactors := aMultipliedUnit factors.
	denominatorFactors remove: aUnit ifAbsent: [ ^self new initializeNumerator: aUnit denominator: aMultipliedUnit ].
	
	"It never can be left NullUnit on NullUnit because aMultipliedUnit has like minimum 2 units"
	^self new initializeNumerator: NullUnit new denominator: (MultipliedUnit factors: denominatorFactors)
]

{ #category : #'instance creation - private' }
DividedUnit class >> simpleUnit: aUnit simpleUnit: anotherUnit [

	^aUnit=anotherUnit
		ifTrue: [ NullUnit new ]
		ifFalse: [ self new initializeNumerator: aUnit denominator: anotherUnit ]
]

{ #category : #comparing }
DividedUnit >> = anObject [

	^self class = anObject class 
		and: [ numerator = anObject numerator 
		and: [ denominator = anObject denominator ]]
]

{ #category : #accessing }
DividedUnit >> denominator [

	^denominator
]

{ #category : #'mathematic operations' }
DividedUnit >> divFrom: aNumber [

	^aNumber * self reciprocal
]

{ #category : #'mathematic operations' }
DividedUnit >> divideByUnit: aUnit [

	^aUnit divideDividedUnit: self
]

{ #category : #'mathematic operations - private' }
DividedUnit >> divideDividedUnit: aDividedUnit [

	^self class dividedUnit: self dividedUnit: aDividedUnit
]

{ #category : #'mathematic operations - private' }
DividedUnit >> divideMultipliedUnit: aMultipliedUnit [

	^self class dividedUnit: self multipliedUnit: aMultipliedUnit
]

{ #category : #'mathematic operations - private' }
DividedUnit >> divideNullUnit: aNullUnit [ 
	
	^self class nullUnit: aNullUnit dividedUnit: self
]

{ #category : #'mathematic operations - private' }
DividedUnit >> divideSimpleUnit: aUnit [

	^self class dividedUnit: self simpleUnit: aUnit
]

{ #category : #accessing }
DividedUnit >> hash [

	^numerator hash bitXor: denominator hash
]

{ #category : #initialization }
DividedUnit >> initializeNumerator: aUnit denominator: anotherUnit [

	numerator := aUnit.
	denominator := anotherUnit
]

{ #category : #'mathematic operations' }
DividedUnit >> multiplyByUnit: aUnit [

	^aUnit multiplyDividedUnit: self
]

{ #category : #'mathematic operations - private' }
DividedUnit >> multiplyDividedUnit: aDividedUnit [

	^MultipliedUnit dividedUnit: aDividedUnit dividedUnit: self
]

{ #category : #'mathematic operations - private' }
DividedUnit >> multiplyMultipliedUnit: aMultipliedUnit [

	^MultipliedUnit multipliedUnit: aMultipliedUnit dividedUnit: self
]

{ #category : #'mathematic operations - private' }
DividedUnit >> multiplySimpleUnit: aUnit [

	^MultipliedUnit simpleUnit: aUnit dividedUnit: self
]

{ #category : #accessing }
DividedUnit >> nameForMany [

	^numerator nameForMany asString , '/' 
		, denominator nameForMany asString
]

{ #category : #accessing }
DividedUnit >> nameForOne [

	^numerator name asString , '/' , denominator name asString
]

{ #category : #accessing }
DividedUnit >> numerator [

	^numerator
]

{ #category : #accessing }
DividedUnit >> sign [

	^numerator sign, '/', denominator sign
]

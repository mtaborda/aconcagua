Class {
	#name : #MultipliedUnit,
	#superclass : #CompoundUnit,
	#instVars : [
		'factors'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation - private' }
MultipliedUnit class >> dividedUnit: aDividedUnit dividedUnit: anotherDividedUnit [

	^(aDividedUnit numerator * anotherDividedUnit numerator) / (aDividedUnit denominator * anotherDividedUnit denominator)
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> dividedUnit: aDividedUnit multipliedUnit: aMultipliedUnit [

	^self multipliedUnit: aMultipliedUnit dividedUnit: aDividedUnit
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> dividedUnit: aDividedUnit simpleUnit: aUnit [

	^self simpleUnit: aUnit dividedUnit: aDividedUnit
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> factors: aCollection [

	aCollection isEmpty ifTrue: [ ^NullUnit new ].
	aCollection size=1 ifTrue: [ ^aCollection first ].
	^self new initializeFactors: aCollection
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> multipliedUnit: aMultipliedUnit dividedUnit: aDividedUnit [

	^(aMultipliedUnit * aDividedUnit numerator) / (aDividedUnit denominator)
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> multipliedUnit: aMultipliedUnit multipliedUnit: anotherMultipliedUnit [

	| factors |
	
	factors := aMultipliedUnit factors.
	factors addAll: anotherMultipliedUnit factors.
	
	^self new initializeFactors: factors.
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> multipliedUnit: aMultipliedUnit simpleUnit: aUnit [

	^self simpleUnit: aUnit multipliedUnit: aMultipliedUnit
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> simpleUnit: aUnit dividedUnit: aDividedUnit [

	^(aUnit * aDividedUnit numerator) / (aDividedUnit denominator)
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> simpleUnit: aUnit multipliedUnit: aMultipliedUnit [

	| factors |
	
	factors := aMultipliedUnit factors.
	factors add: aUnit.
	
	^self new initializeFactors: factors
]

{ #category : #'instance creation - private' }
MultipliedUnit class >> simpleUnit: aUnit simpleUnit: anotherUnit [

	^self new initializeFactors: (OrderedCollection with: aUnit with: anotherUnit)
]

{ #category : #comparing }
MultipliedUnit >> = anObject [

	^self class = anObject class and: [ self hasSameFactorsAs: anObject ]
]

{ #category : #'mathematic operations' }
MultipliedUnit >> divFrom: aNumber [

	^(DividedUnit nullUnit: aNumber unit multipliedUnit: self) with: aNumber
]

{ #category : #'mathematic operations' }
MultipliedUnit >> divideByUnit: aUnit [

	^aUnit divideMultipliedUnit: self
]

{ #category : #'mathematic operations - private' }
MultipliedUnit >> divideDividedUnit: aDividedUnit [

	^DividedUnit multipliedUnit: self dividedUnit: aDividedUnit
]

{ #category : #'mathematic operations - private' }
MultipliedUnit >> divideMultipliedUnit: aMultipliedUnit [

	^DividedUnit multipliedUnit: self multipliedUnit: aMultipliedUnit
]

{ #category : #'mathematic operations - private' }
MultipliedUnit >> divideNullUnit: aNullUnit [ 
	
	^DividedUnit nullUnit: aNullUnit multipliedUnit: self
]

{ #category : #'mathematic operations - private' }
MultipliedUnit >> divideSimpleUnit: aUnit [

	^DividedUnit multipliedUnit: self simpleUnit: aUnit
]

{ #category : #accessing }
MultipliedUnit >> factors [
	
	^factors copy
]

{ #category : #accessing }
MultipliedUnit >> factorsSize [

	^factors size
]

{ #category : #'accessing - private' }
MultipliedUnit >> factorsToStreamDoing: aBlock [

	| stream |

	stream := WriteStream on: String new.
	factors do: [:aUnit |
		stream nextPutAll: (aBlock value: aUnit).
		stream nextPut: $.].
	stream skip: -1.
	^stream contents
]

{ #category : #testing }
MultipliedUnit >> hasSameFactorsAs: aMultipliedUnit [
	
	| factorsIntersection |
	
	factorsIntersection := aMultipliedUnit factors.
	factors do: [:aUnit | factorsIntersection remove: aUnit ifAbsent: [ ^false ] ].
	
	^factorsIntersection isEmpty

		
]

{ #category : #accessing }
MultipliedUnit >> hash [

	^factors inject: 0 into: [ :aHash :aUnit | aHash bitXor: aUnit hash ]
]

{ #category : #initialization }
MultipliedUnit >> initializeFactors: aCollection [

	factors := aCollection
]

{ #category : #'mathematic operations' }
MultipliedUnit >> multiplyByUnit: aUnit [

	^aUnit multiplyMultipliedUnit: self
]

{ #category : #'mathematic operations - private' }
MultipliedUnit >> multiplyDividedUnit: aDividedUnit [

	^self class dividedUnit: aDividedUnit multipliedUnit: self
]

{ #category : #'mathematic operations - private' }
MultipliedUnit >> multiplyMultipliedUnit: aMultipliedUnit [

	^self class multipliedUnit: aMultipliedUnit multipliedUnit: self
]

{ #category : #'mathematic operations - private' }
MultipliedUnit >> multiplySimpleUnit: aUnit [

	^self class simpleUnit: aUnit multipliedUnit: self
]

{ #category : #accessing }
MultipliedUnit >> nameForMany [

	^self factorsToStreamDoing: [:aUnit | aUnit nameForMany asString]
]

{ #category : #accessing }
MultipliedUnit >> nameForOne [

	^self factorsToStreamDoing: [:aUnit | aUnit nameForOne asString]
]

{ #category : #accessing }
MultipliedUnit >> sign [

	^self factorsToStreamDoing: [ :aUnit | aUnit sign ]
]

Class {
	#name : #CircularReadStream,
	#superclass : #Object,
	#instVars : [
		'collection',
		'position',
		'unit'
	],
	#category : #'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
CircularReadStream class >> on: aCollection moving: aUnit [

	^self on: aCollection moving: aUnit startingCircleAtIndex: 1
]

{ #category : #'instance creation' }
CircularReadStream class >> on: aCollection moving: aUnit startingCircleAt: anObject [

	^self on: aCollection moving: aUnit startingCircleAtIndex: (aCollection indexOf: anObject)
]

{ #category : #'instance creation' }
CircularReadStream class >> on: aCollection moving: aUnit startingCircleAtIndex: anIndex [

	^self new initializeOn: aCollection moving: aUnit startingCircleAtIndex: anIndex
]

{ #category : #'enumerating - private' }
CircularReadStream >> advancePositions: aMeasure [

	| amount |
	
	amount := (aMeasure convertTo: unit) floor amount.
	position := ((position - 1 + amount) \\ collection size) + 1
]

{ #category : #testing }
CircularReadStream >> atBegin [

	^position = 1
]

{ #category : #testing }
CircularReadStream >> atEnd [

	^position = collection size
]

{ #category : #accessing }
CircularReadStream >> current [

	^collection at: position
]

{ #category : #querying }
CircularReadStream >> distanceFrom: anObject [

	^self distanceFrom: anObject toObjectPosition: position
]

{ #category : #querying }
CircularReadStream >> distanceFrom: anObject to: anotherObject [

	^self distanceFrom: anObject toObjectPosition: (collection indexOf: anotherObject)
]

{ #category : #querying }
CircularReadStream >> distanceFrom: anObject toObjectPosition: aToObjectPosition [

	| fromObjectPosition steps |

	fromObjectPosition := collection indexOf: anObject.
	steps := aToObjectPosition >= fromObjectPosition 
		ifTrue: [aToObjectPosition - fromObjectPosition]
		ifFalse: [collection size - fromObjectPosition + aToObjectPosition].
	^unit with: steps
]

{ #category : #querying }
CircularReadStream >> distanceTo: anObject [

	^self distanceTo: anObject from: self current
]

{ #category : #querying }
CircularReadStream >> distanceTo: anObject from: anotherObject [

	^self distanceFrom: anotherObject to: anObject
]

{ #category : #accessing }
CircularReadStream >> first [

	^collection first
]

{ #category : #'conditional protocol' }
CircularReadStream >> ifAtBeginDo: aBlock else: anotherBlock [

	^self atBegin
		ifTrue: aBlock
		ifFalse: anotherBlock
]

{ #category : #'conditional protocol' }
CircularReadStream >> ifAtEndDo: aBlock else: anotherBlock [

	^self atEnd
		ifTrue: aBlock
		ifFalse: anotherBlock
]

{ #category : #initialization }
CircularReadStream >> initializeOn: aCollection moving: aUnit startingCircleAtIndex: anIndex [

	collection := (aCollection copyFrom: anIndex to: aCollection size), (aCollection copyFrom: 1 to: anIndex - 1).
	unit := aUnit.
	self upToBegin
]

{ #category : #'collection protocol' }
CircularReadStream >> inject: aMeasure into: aBlock [

	^collection inject: aMeasure into: aBlock
]

{ #category : #testing }
CircularReadStream >> isPrevious: anObject to: anotherObject [

	^(collection indexOf: anObject) < (collection indexOf: anotherObject)
]

{ #category : #accessing }
CircularReadStream >> last [

	^collection last
]

{ #category : #enumerating }
CircularReadStream >> next [

	^self next: (unit with: 1)
]

{ #category : #enumerating }
CircularReadStream >> next: aMeasure [

	self advancePositions: aMeasure.
	^self current
]

{ #category : #enumerating }
CircularReadStream >> previous [

	^self previous: (unit with: 1)
]

{ #category : #enumerating }
CircularReadStream >> previous: aMeasure [

	^self next: aMeasure negated
]

{ #category : #querying }
CircularReadStream >> relativeDistanceFrom: anObject to: anotherObject [

	^(collection indexOf: anObject) > (collection indexOf: anotherObject)
		ifTrue: [(self distanceFrom: anotherObject to: anObject) negated]
		ifFalse: [self distanceFrom: anObject to: anotherObject]

]

{ #category : #positioning }
CircularReadStream >> upTo: anObject [

	position := collection indexOf: anObject
]

{ #category : #positioning }
CircularReadStream >> upToBegin [

	position := 1
]

{ #category : #positioning }
CircularReadStream >> upToEnd [

	position := collection size
]

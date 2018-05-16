Class {
	#name : #IntervalAwareMagnitude,
	#superclass : #Magnitude,
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #comparing }
IntervalAwareMagnitude >> = anObject [

	^self == anObject
]

{ #category : #'magnitude protocol' }
IntervalAwareMagnitude >> between: min andNotInclusive: max [

	 ^min <= self and: [self < max]
]

{ #category : #'interval protocol - private' }
IntervalAwareMagnitude >> defaultIntervalIncrement [

	self subclassResponsibility
]

{ #category : #comparing }
IntervalAwareMagnitude >> hash [

	^self identityHash
]

{ #category : #'interval protocol - private' }
IntervalAwareMagnitude >> intervalStrategy [

	self subclassResponsibility
]

{ #category : #'magnitude protocol' }
IntervalAwareMagnitude >> notInclusiveBetween: min and: max [

	 ^min < self and: [self <= max]
]

{ #category : #'magnitude protocol' }
IntervalAwareMagnitude >> notInclusiveBetween: min andNotInclusive: max [

	 ^min < self and: [self < max]
]

{ #category : #'interval protocol' }
IntervalAwareMagnitude >> to: aMagnitude [

	^self to: aMagnitude by: self defaultIntervalIncrement
]

{ #category : #'interval protocol' }
IntervalAwareMagnitude >> to: aMagnitude by: anIncrement [

	^ArithmeticObjectInterval from: self to: aMagnitude by: anIncrement intervalStrategy: self intervalStrategy
]

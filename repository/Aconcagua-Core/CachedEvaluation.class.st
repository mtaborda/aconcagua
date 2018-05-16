Class {
	#name : #CachedEvaluation,
	#superclass : #Evaluation,
	#instVars : [
		'cachedValue',
		'evaluation'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
CachedEvaluation class >> for: anEvaluation [

	^self new initializeFor: anEvaluation
]

{ #category : #evaluating }
CachedEvaluation >> computeValue [

	^evaluation value
]

{ #category : #initialization }
CachedEvaluation >> initializeCachedValue [

	cachedValue := self computeValue
]

{ #category : #initialization }
CachedEvaluation >> initializeFor: anEvaluation [

	evaluation := anEvaluation
]

{ #category : #printing }
CachedEvaluation >> printOn: aStream [

	aStream nextPutAll: 'Cache for: '.
	evaluation printOn: aStream
]

{ #category : #evaluating }
CachedEvaluation >> value [

	cachedValue isNil ifTrue: [self initializeCachedValue].
	^cachedValue
]

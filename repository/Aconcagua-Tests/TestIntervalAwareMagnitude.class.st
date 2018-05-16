Class {
	#name : #TestIntervalAwareMagnitude,
	#superclass : #IntervalAwareMagnitude,
	#instVars : [
		'number'
	],
	#category : 'Aconcagua-Tests-ArithmeticModel'
}

{ #category : #'instance creation' }
TestIntervalAwareMagnitude class >> with: aNumber [

	^self new initializeWith: aNumber
]

{ #category : #'magnitude protocol' }
TestIntervalAwareMagnitude >> < aTestIntervalAwareMagnitude [

	^number < aTestIntervalAwareMagnitude number
]

{ #category : #comparing }
TestIntervalAwareMagnitude >> = aTestIntervalAwareMagnitude [

	^self class = aTestIntervalAwareMagnitude class and: [ number = aTestIntervalAwareMagnitude number ]
]

{ #category : #'interval protocol - private' }
TestIntervalAwareMagnitude >> defaultIntervalIncrement [

	^self class with: 1
]

{ #category : #comparing }
TestIntervalAwareMagnitude >> hash [

	^self class hash bitXor: number hash
]

{ #category : #initialization }
TestIntervalAwareMagnitude >> initializeWith: aNumber [

	number := aNumber
]

{ #category : #'interval protocol - private' }
TestIntervalAwareMagnitude >> intervalStrategy [

	^TestIntervalStrategy new
]

{ #category : #accessing }
TestIntervalAwareMagnitude >> number [

	^number
]

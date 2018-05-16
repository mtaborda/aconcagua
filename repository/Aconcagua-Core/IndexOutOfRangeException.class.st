Class {
	#name : #IndexOutOfRangeException,
	#superclass : #Error,
	#instVars : [
		'index',
		'collection'
	],
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #'instance creating' }
IndexOutOfRangeException class >> index: anIndex collection: aCollection [
	
	^self new initializeIndex: anIndex collection: aCollection
	
	
]

{ #category : #signaling }
IndexOutOfRangeException class >> signalIndex: anIndex collection: aCollection [
	
	(self index: anIndex collection: aCollection) signal
]

{ #category : #accessing }
IndexOutOfRangeException >> collection [

	^collection
]

{ #category : #accessing }
IndexOutOfRangeException >> description [

	^index isNil 
		ifTrue: [ 'Index out of range for <1p>' expandMacrosWith: collection ]
		ifFalse: [ 'Index <1p> out of range for <2p>' expandMacrosWith: index with: collection ]
]

{ #category : #accessing }
IndexOutOfRangeException >> index [

	^index
]

{ #category : #initialization }
IndexOutOfRangeException >> initializeIndex: anIndex collection: aCollection [

	index := anIndex.	
	collection := aCollection
]

Class {
	#name : #UndefinedArithmeticObjectValueException,
	#superclass : #Error,
	#instVars : [
		'arithmeticObject'
	],
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #'instance creation' }
UndefinedArithmeticObjectValueException class >> arithmeticObject: anArithmeticObject [

	^self new initializeArithmeticObject: anArithmeticObject
]

{ #category : #signaling }
UndefinedArithmeticObjectValueException class >> signalArithmeticObject: anArithmeticObject [

	(self arithmeticObject: anArithmeticObject) signal
]

{ #category : #accessing }
UndefinedArithmeticObjectValueException >> arithmeticObject [

	^arithmeticObject
]

{ #category : #accessing }
UndefinedArithmeticObjectValueException >> description [

	^'Undefined value of arithmetical operation: "<1p>"' expandMacrosWith: arithmeticObject
]

{ #category : #initialization }
UndefinedArithmeticObjectValueException >> initializeArithmeticObject: anArithmeticObject [

	arithmeticObject := anArithmeticObject.
]

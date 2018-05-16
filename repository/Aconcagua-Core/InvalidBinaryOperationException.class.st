Class {
	#name : #InvalidBinaryOperationException,
	#superclass : #InvalidOperationException,
	#instVars : [
		'operationName',
		'leftOperand',
		'rightOperand'
	],
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #'instance creation' }
InvalidBinaryOperationException class >> operationName: anOperationName leftOperand: aLeftOperand rightOperand: aRightOperand [

	^self new initializeOperationName: anOperationName leftOperand: aLeftOperand rightOperand: aRightOperand
]

{ #category : #signaling }
InvalidBinaryOperationException class >> signalOperationName: anOperationName leftOperand: aLeftOperand rightOperand: aRightOperand [

	(self operationName: anOperationName leftOperand: aLeftOperand rightOperand: aRightOperand) signal
]

{ #category : #accessing }
InvalidBinaryOperationException >> description [

	^'Attempt to make the operation <1s> between <2p> and <3p> which is invalid'
		expandMacrosWith: operationName
		with: leftOperand
		with: rightOperand
]

{ #category : #initialization }
InvalidBinaryOperationException >> initializeOperationName: anOperationName leftOperand: aLeftOperand rightOperand: aRightOperand [

	operationName := anOperationName.
	leftOperand := aLeftOperand.
	rightOperand := aRightOperand.
]

{ #category : #accessing }
InvalidBinaryOperationException >> leftOperand [

	^leftOperand
]

{ #category : #accessing }
InvalidBinaryOperationException >> operationName [

	^operationName
]

{ #category : #accessing }
InvalidBinaryOperationException >> rightOperand [

	^rightOperand
]

Class {
	#name : #InvalidUnaryOperationException,
	#superclass : #InvalidOperationException,
	#instVars : [
		'operationName',
		'operand'
	],
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #'instance creation' }
InvalidUnaryOperationException class >> operationName: anOperationName operand: anOperand [

	^self new initializeOperationName: anOperationName operand: anOperand
]

{ #category : #signaling }
InvalidUnaryOperationException class >> signalOperationName: anOperationName operand: anOperand [

	(self operationName: anOperationName operand: anOperand) signal
]

{ #category : #accessing }
InvalidUnaryOperationException >> description [

	^'Attempt to make the operation  <1s> with <2p> which is invalid'
		expandMacrosWith: operationName
		with: operand
]

{ #category : #initialization }
InvalidUnaryOperationException >> initializeOperationName: anOperationName operand: anOperand [

	operationName := anOperationName.
	operand := anOperand.
]

{ #category : #accessing }
InvalidUnaryOperationException >> operand [

	^operand
]

{ #category : #accessing }
InvalidUnaryOperationException >> operationName [

	^operationName
]

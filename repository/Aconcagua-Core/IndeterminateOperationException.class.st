Class {
	#name : #IndeterminateOperationException,
	#superclass : #Error,
	#instVars : [
		'operation',
		'leftOperand',
		'rightOperand'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
IndeterminateOperationException class >> operation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand [

	^self new initializeOperation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand
]

{ #category : #signaling }
IndeterminateOperationException class >> signalOperation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand [

	(self operation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand) signal
]

{ #category : #accessing }
IndeterminateOperationException >> description [

	^'The <1s> operation is indeterminate between <2p> and <3p>'
		expandMacrosWith: operation
		with: leftOperand
		with: rightOperand
]

{ #category : #initialization }
IndeterminateOperationException >> initializeOperation: anOperation leftOperand: aLeftOperand rightOperand: aRightOperand [

	operation := anOperation.
	leftOperand := aLeftOperand.
	rightOperand := aRightOperand
]

Class {
	#name : #CanNotConvertMeasureException,
	#superclass : #InvalidOperationException,
	#instVars : [
		'targetUnit',
		'sourceMeasure'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #signaling }
CanNotConvertMeasureException class >> signalSourceMeasure: aSourceMeasure targetUnit: aTargetUnit [

	^(self sourceMeasure: aSourceMeasure targetUnit: aTargetUnit) signal
]

{ #category : #'instance creation' }
CanNotConvertMeasureException class >> sourceMeasure: aSourceMeasure targetUnit: aTargetUnit [

	^self new initializeWith: aSourceMeasure targetUnit: aTargetUnit
]

{ #category : #accessing }
CanNotConvertMeasureException >> description [

	^'It is not possible to convert <1p> to <2p>'
		expandMacrosWith: sourceMeasure
		with: targetUnit
]

{ #category : #initialization }
CanNotConvertMeasureException >> initializeWith: aSourceMeasure targetUnit: aTargetUnit [ 

	sourceMeasure := aSourceMeasure.
	targetUnit := aTargetUnit
]

{ #category : #'priv handling' }
CanNotConvertMeasureException >> isResumable [

	^true
]

{ #category : #accessing }
CanNotConvertMeasureException >> operationName [

	^'convertTo:'
]

{ #category : #accessing }
CanNotConvertMeasureException >> sourceMeasure [

	^sourceMeasure
]

{ #category : #accessing }
CanNotConvertMeasureException >> targetUnit [

	^targetUnit
]

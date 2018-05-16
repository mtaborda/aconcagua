Class {
	#name : #DummyEvaluation,
	#superclass : #Evaluation,
	#instVars : [
		'measure'
	],
	#category : 'Aconcagua-Tests-MeasureModel'
}

{ #category : #'instance creation' }
DummyEvaluation class >> of: aMeasure [

	^self new initializeMeasure: aMeasure
]

{ #category : #initialization }
DummyEvaluation >> initializeMeasure: aMeasure [

	measure := aMeasure
]

{ #category : #evaluating }
DummyEvaluation >> value [

	^measure
]

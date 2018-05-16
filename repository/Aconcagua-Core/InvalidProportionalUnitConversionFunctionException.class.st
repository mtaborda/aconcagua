Class {
	#name : #InvalidProportionalUnitConversionFunctionException,
	#superclass : #Error,
	#instVars : [
		'sourceMeasure',
		'equivalentMeasure'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #signaling }
InvalidProportionalUnitConversionFunctionException class >> signalSourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure [

	(self sourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure) signal
]

{ #category : #'instance creation' }
InvalidProportionalUnitConversionFunctionException class >> sourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure [

	^self new initializeSourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure
]

{ #category : #accessing }
InvalidProportionalUnitConversionFunctionException >> description [

	^'The proportional relation between <1p> and <2p> it is not valid because <1p> it represents nothing or are of the same dominion'
		expandMacrosWith: sourceMeasure
		with: equivalentMeasure
]

{ #category : #accessing }
InvalidProportionalUnitConversionFunctionException >> equivalentMeasure [

	^equivalentMeasure
]

{ #category : #initialization }
InvalidProportionalUnitConversionFunctionException >> initializeSourceMeasure: aSourceMeasure equivalentMeasure: aEquivalentMeasure [

	sourceMeasure := aSourceMeasure.
	equivalentMeasure := aEquivalentMeasure
]

{ #category : #accessing }
InvalidProportionalUnitConversionFunctionException >> sourceMeasure [

	^sourceMeasure
]

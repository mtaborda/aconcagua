Class {
	#name : #ProportionalUnitConversionFunction,
	#superclass : #UnitConversionFunctionInterface,
	#instVars : [
		'sourceMeasure',
		'equivalentMeasure',
		'proportionalMeasure'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
ProportionalUnitConversionFunction class >> assertCreationPreconditions: aSourceMeasure equivalentMeasure: aEquivalentMeasure [

	(aSourceMeasure isNothing 
		or: [aSourceMeasure sameDomainAs: aEquivalentMeasure]) 
			ifTrue: 
				[InvalidProportionalUnitConversionFunctionException 
					signalSourceMeasure: aSourceMeasure
					equivalentMeasure: aEquivalentMeasure]
]

{ #category : #'instance creation' }
ProportionalUnitConversionFunction class >> measure: aSourceMeasure isProportionalTo: aEquivalentMeasure [

	self assertCreationPreconditions: aSourceMeasure
		equivalentMeasure: aEquivalentMeasure.
	^self new initializeMeasure: aSourceMeasure
		isEquivalentTo: aEquivalentMeasure
]

{ #category : #comparing }
ProportionalUnitConversionFunction >> = anotherProportionalUnitConvertionFunction [

	^self class=anotherProportionalUnitConvertionFunction class and: 
		[ sourceMeasure=anotherProportionalUnitConvertionFunction sourceMeasure and: 
		[ equivalentMeasure=anotherProportionalUnitConvertionFunction equivalentMeasure ] ]
]

{ #category : #accessing }
ProportionalUnitConversionFunction >> equivalentMeasure [

	^equivalentMeasure
]

{ #category : #accessing }
ProportionalUnitConversionFunction >> hash [

	^sourceMeasure hash bitXor: equivalentMeasure hash.

]

{ #category : #initialization }
ProportionalUnitConversionFunction >> initializeMeasure: aSourceMeasure isEquivalentTo: aEquivalentMeasure [

	sourceMeasure := aSourceMeasure.
	equivalentMeasure := aEquivalentMeasure.
	proportionalMeasure := aEquivalentMeasure / aSourceMeasure
]

{ #category : #printing }
ProportionalUnitConversionFunction >> printOn: aStream [

	equivalentMeasure printOn: aStream.
	aStream nextPutAll: ' / '.
	sourceMeasure printOn: aStream.
	aStream nextPutAll: '* valueToConvert'
]

{ #category : #accessing }
ProportionalUnitConversionFunction >> proportionalMeasure [ 

	^proportionalMeasure

]

{ #category : #accessing }
ProportionalUnitConversionFunction >> sourceMeasure [ 

	^sourceMeasure

]

{ #category : #evaluating }
ProportionalUnitConversionFunction >> value: aMeasure [

	^proportionalMeasure * aMeasure
]

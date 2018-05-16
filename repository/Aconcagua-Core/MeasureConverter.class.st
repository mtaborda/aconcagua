Class {
	#name : #MeasureConverter,
	#superclass : #Object,
	#instVars : [
		'graphPathFinder'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
MeasureConverter class >> defaultGraphPathFinder [

	^GraphPathFinder
]

{ #category : #'instance creation' }
MeasureConverter class >> on: aConvertionTable [ 

	^self with: (self defaultGraphPathFinder on: (aConvertionTable graph))
]

{ #category : #'instance creation' }
MeasureConverter class >> with: aGraphPathFinder [

	^self new initializeWith: aGraphPathFinder
]

{ #category : #testing }
MeasureConverter >> canConvert: aSourceMeasure to: aTargetUnit [

	[self findPathAndConvert: aSourceMeasure to: aTargetUnit]
		on: GraphPathNotFoundException
		do: [:ex | ^ex return: false].
	^true
]

{ #category : #converting }
MeasureConverter >> convert: aSourceMeasure to: aTargetUnit [

	^[aSourceMeasure convertTo: aTargetUnit using: self]
		on: GraphPathNotFoundException
		do: [:aSignal |
			CanNotConvertMeasureException
				signalSourceMeasure: aSourceMeasure
				targetUnit: aTargetUnit]
]

{ #category : #'converting - private' }
MeasureConverter >> convert: aSourceMeasure to: aTargetUnit using: aPath [ 

	| convertedMeasure |
	
	convertedMeasure := aPath edges
		inject: aSourceMeasure 
		into: [ :aMeasure :aUnitConvertionRule | aUnitConvertionRule value: aMeasure ].

	^convertedMeasure
]

{ #category : #'converting - private' }
MeasureConverter >> convertMeasure: aSourceMeasure to: aTargetUnit [

	| targetMeasure |
	targetMeasure := (aSourceMeasure unit sameDomainAs: aTargetUnit) 
		ifTrue: [aSourceMeasure convertTo: aTargetUnit]
		ifFalse: [self findPathAndConvert: aSourceMeasure to: aTargetUnit].
	^targetMeasure
]

{ #category : #'converting - private' }
MeasureConverter >> convertMeasureBag: aSourceMeasureBag to: aTargetUnit [

	| targetMeasure |
	targetMeasure := aSourceMeasureBag measures 
				inject: 0
				into: 
					[:convertedMeasure :measureToConvert | 
					convertedMeasure 
						+ (self convert: measureToConvert to: aTargetUnit)].
	^targetMeasure
]

{ #category : #'converting - private' }
MeasureConverter >> findPathAndConvert: aSourceMeasure to: aTargetUnit [ 

	| convertionPath |

	convertionPath := self pathFrom: aSourceMeasure unit to: aTargetUnit.
	^self 
		convert: aSourceMeasure
		to: aTargetUnit
		using: convertionPath
]

{ #category : #accessing }
MeasureConverter >> graphPathFinder [
	
	^graphPathFinder
]

{ #category : #initialization }
MeasureConverter >> initializeWith: aGraphPathFinder [ 

	graphPathFinder := aGraphPathFinder
]

{ #category : #'converting - private' }
MeasureConverter >> pathFrom: aSourceUnit to: aTargetUnit [

	| path |
	
	path := self graphPathFinder pathFrom: aSourceUnit to: aTargetUnit.
	
	^path.
	
	
]

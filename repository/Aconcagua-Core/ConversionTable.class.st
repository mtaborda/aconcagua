Class {
	#name : #ConversionTable,
	#superclass : #Object,
	#instVars : [
		'graph',
		'unitConversionRules'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
ConversionTable class >> new [

	^super new initialize
]

{ #category : #'table setup' }
ConversionTable >> addUnitConversionRule: aUnitConvertionRule [

	self 
		removeUnitConversionRuleFrom: aUnitConvertionRule sourceUnit
		to: aUnitConvertionRule targetUnit
		ifAbsent: [].
	unitConversionRules add: aUnitConvertionRule.
	self invalidateGraph
]

{ #category : #'graph management' }
ConversionTable >> createGraph [ 

	graph := Graph edges: self createGraphEdges
	
		
]

{ #category : #'graph management' }
ConversionTable >> createGraphEdges [

	| edges |
	
	edges := unitConversionRules collect: [ :aConvertionRule | self createUnitConversionRuleToEdgeAdapterFor: aConvertionRule ].
	^edges
	
		
]

{ #category : #'table setup - private' }
ConversionTable >> createProportionalUnitConversionFunctionWithSource: sourceMeasure andTarget: targetMeasure [

	^ProportionalUnitConversionFunction measure: sourceMeasure isProportionalTo: targetMeasure
]

{ #category : #'table setup - private' }
ConversionTable >> createUnitConversionRuleFrom: aSourceUnit to: aTargetUnit using: anEvaluation [

	^UnitConversionRule 
		from: aSourceUnit baseUnit
		to: aTargetUnit baseUnit
		use: anEvaluation
]

{ #category : #'graph management' }
ConversionTable >> createUnitConversionRuleToEdgeAdapterFor: aUnitConvertionRule [

	^UnitConversionRuleToEdgeAdapter for: aUnitConvertionRule
]

{ #category : #'table setup' }
ConversionTable >> from: aSourceUnit to: aTargetUnit use: aUnitConvertionFunction [

	| unitConvertionRule |
	unitConvertionRule := self createUnitConversionRuleFrom: aSourceUnit to: aTargetUnit using: aUnitConvertionFunction. 
	self addUnitConversionRule: unitConvertionRule.

]

{ #category : #'graph management' }
ConversionTable >> graph [

	graph isNil ifTrue: [ self createGraph ].
	^graph
]

{ #category : #initialization }
ConversionTable >> initialize [

	unitConversionRules := OrderedCollection new.
	self invalidateGraph
]

{ #category : #'graph management' }
ConversionTable >> invalidateGraph [

	graph := nil
]

{ #category : #'table setup' }
ConversionTable >> measure: aSourceMeasure convertsTo: aTargetMeasure [

	| unitConvertionFunction |
	unitConvertionFunction := self 
		createProportionalUnitConversionFunctionWithSource: aSourceMeasure
		andTarget: aTargetMeasure.
	self 
		from: aSourceMeasure unit
		to: aTargetMeasure unit
		use: unitConvertionFunction
]

{ #category : #'table setup' }
ConversionTable >> measure: aSourceMeasure isEquivalentTo: aTargetMeasure [

	self measure: aSourceMeasure convertsTo: aTargetMeasure.
	self measure: aTargetMeasure convertsTo: aSourceMeasure
]

{ #category : #'table setup' }
ConversionTable >> removeUnitConversionRuleFrom: aSourceUnit to: aTargetUnit [

	^self 
		removeUnitConversionRuleFrom: aSourceUnit
		to: aTargetUnit
		ifAbsent: [self signalNoUnitConversionRuleFrom: aSourceUnit to: aTargetUnit]
]

{ #category : #'table setup' }
ConversionTable >> removeUnitConversionRuleFrom: aSourceUnit to: aTargetUnit ifAbsent: aBlock [

	| currentConvertionRule |
	currentConvertionRule := self 
		unitConversionRuleFrom: aSourceUnit
		to: aTargetUnit
		ifNone: [^aBlock value].
	unitConversionRules remove: currentConvertionRule.
	self invalidateGraph
]

{ #category : #exceptions }
ConversionTable >> signalNoUnitConversionRuleFrom: aSourceUnit to: aTargetUnit [

	NoUnitConversionRuleException signalWithSourceUnit: aSourceUnit targetUnit: aTargetUnit
]

{ #category : #accessing }
ConversionTable >> unitConversionRuleFrom: aSourceUnit to: aTargetUnit [

	^self 
		unitConversionRuleFrom: aSourceUnit
		to: aTargetUnit
		ifNone: [self signalNoUnitConversionRuleFrom: aSourceUnit to: aTargetUnit]
]

{ #category : #accessing }
ConversionTable >> unitConversionRuleFrom: aSourceUnit to: aTargetUnit ifNone: aBlock [

	^unitConversionRules 
		detect: [:aUnitConvertionRule | aUnitConvertionRule convertsFrom: aSourceUnit to: aTargetUnit]
		ifNone: aBlock
]

{ #category : #accessing }
ConversionTable >> unitConversionRules [

	^unitConversionRules copy
]

Class {
	#name : #UnitConversionRule,
	#superclass : #UnitConversionRuleInterface,
	#instVars : [
		'sourceUnit',
		'targetUnit',
		'function'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
UnitConversionRule class >> from: aSourceUnit to: aTargetUnit use: aFunction [

	^self new initializeFrom: aSourceUnit to: aTargetUnit using: aFunction
]

{ #category : #comparing }
UnitConversionRule >> = anotherConvertionRule [

	^self class=anotherConvertionRule class and: 
		[ (self convertsSameDomainsAs: anotherConvertionRule) and:
		[ function=anotherConvertionRule function ] ].
]

{ #category : #accessing }
UnitConversionRule >> function [

	^function
]

{ #category : #accessing }
UnitConversionRule >> hash [

	^sourceUnit hash bitXor: targetUnit hash.
]

{ #category : #initialization }
UnitConversionRule >> initializeFrom: aSourceUnit to: aTargetUnit using: aFunction [

	sourceUnit := aSourceUnit.
	targetUnit := aTargetUnit.
	function := aFunction
]

{ #category : #printing }
UnitConversionRule >> printOn: aStream [

	sourceUnit printOn: aStream.
	aStream nextPutAll: ' -> '.
	targetUnit printOn: aStream.
	aStream nextPutAll: ': '.
	function printOn: aStream
]

{ #category : #accessing }
UnitConversionRule >> sourceUnit [

	^sourceUnit
]

{ #category : #accessing }
UnitConversionRule >> targetUnit [

	^targetUnit
]

{ #category : #converting }
UnitConversionRule >> value: aMeasure [

	^function value: aMeasure
]

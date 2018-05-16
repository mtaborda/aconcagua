Class {
	#name : #UnitConversionRuleToEdgeAdapter,
	#superclass : #UnitConversionRuleInterface,
	#instVars : [
		'unitConversionRule'
	],
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'instance creation' }
UnitConversionRuleToEdgeAdapter class >> for: aConvertionRule [

	^self new initializeWith: aConvertionRule
]

{ #category : #comparing }
UnitConversionRuleToEdgeAdapter >> = anotherConvertionRuleToEdgeAdapter [

	^self class=anotherConvertionRuleToEdgeAdapter class and: 
		[ unitConversionRule=anotherConvertionRuleToEdgeAdapter unitConversionRule ]
	
]

{ #category : #'edge protocol' }
UnitConversionRuleToEdgeAdapter >> convergesTo: aUnit [

	^unitConversionRule targetUnit sameDomainAs: aUnit
	
]

{ #category : #'edge protocol' }
UnitConversionRuleToEdgeAdapter >> convergesToSelf [

	^unitConversionRule sourceUnit sameDomainAs: unitConversionRule targetUnit
	
]

{ #category : #accessing }
UnitConversionRuleToEdgeAdapter >> function [

	^unitConversionRule function
]

{ #category : #'edge protocol' }
UnitConversionRuleToEdgeAdapter >> goesFrom: aSourceUnit to: aTargetUnit [

	^unitConversionRule convertsFrom: aSourceUnit to: aTargetUnit
	
]

{ #category : #'edge protocol' }
UnitConversionRuleToEdgeAdapter >> hash [

	^unitConversionRule hash
	
]

{ #category : #initialization }
UnitConversionRuleToEdgeAdapter >> initializeWith: aConvertionRule [

	unitConversionRule := aConvertionRule
]

{ #category : #printing }
UnitConversionRuleToEdgeAdapter >> printOn: aStream [

	unitConversionRule printOn: aStream
]

{ #category : #'edge protocol' }
UnitConversionRuleToEdgeAdapter >> source [

	^unitConversionRule sourceUnit
]

{ #category : #accessing }
UnitConversionRuleToEdgeAdapter >> sourceUnit [

	^unitConversionRule sourceUnit
]

{ #category : #'edge protocol' }
UnitConversionRuleToEdgeAdapter >> startsOn: aUnit [

	^unitConversionRule sourceUnit sameDomainAs: aUnit
]

{ #category : #'edge protocol' }
UnitConversionRuleToEdgeAdapter >> target [

	^unitConversionRule targetUnit
]

{ #category : #accessing }
UnitConversionRuleToEdgeAdapter >> targetUnit [

	^unitConversionRule targetUnit
]

{ #category : #accessing }
UnitConversionRuleToEdgeAdapter >> unitConversionRule [

	^unitConversionRule
]

{ #category : #converting }
UnitConversionRuleToEdgeAdapter >> value: aMeasure [

	^unitConversionRule value: aMeasure
]

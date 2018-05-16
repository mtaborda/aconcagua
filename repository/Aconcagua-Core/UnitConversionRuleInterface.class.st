Class {
	#name : #UnitConversionRuleInterface,
	#superclass : #Object,
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #converting }
UnitConversionRuleInterface >> convertsFrom: aSourceUnit to: aTargetUnit [

	^(self sourceUnit sameDomainAs: aSourceUnit) and: [ self targetUnit sameDomainAs: aTargetUnit ]
]

{ #category : #converting }
UnitConversionRuleInterface >> convertsSameDomainsAs: aUnitConvertionRule [

	^self convertsFrom: aUnitConvertionRule sourceUnit to: aUnitConvertionRule targetUnit
]

{ #category : #accessing }
UnitConversionRuleInterface >> function [

	self subclassResponsibility
]

{ #category : #accessing }
UnitConversionRuleInterface >> sourceUnit [

	self subclassResponsibility
]

{ #category : #accessing }
UnitConversionRuleInterface >> targetUnit [

	self subclassResponsibility
]

{ #category : #converting }
UnitConversionRuleInterface >> value: aMeasure [

	self subclassResponsibility
]

Class {
	#name : #UnitConversionRuleTest,
	#superclass : #TestCase,
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #testing }
UnitConversionRuleTest >> testAccessing [

	| rule |
	
	rule := UnitConversionRule from: 1 to: 2 use: [ :aValue | aValue ].
	
	self assert: rule sourceUnit = 1.
	self assert: rule targetUnit = 2.
	self assert: (rule function value: 10) = 10.
	self assert: ('1 -> 2: [*:aValue | aValue*]' match: rule printString)

]

{ #category : #testing }
UnitConversionRuleTest >> testConvert [

	| block |
	
	block := [:aValue | aValue * 10].
	self assert: ((UnitConversionRule from: 1 to: 2 use: block) value: 10) = 100
]

{ #category : #testing }
UnitConversionRuleTest >> testEqual [

	| rule block |
	
	block := [:aValue | aValue ].
	rule := UnitConversionRule from: 1 to: 2 use: block.
	
	self assert: rule = (UnitConversionRule from: 1 to: 2 use: block)
]

{ #category : #testing }
UnitConversionRuleTest >> testHash [

	| block |
	
	block := [:aValue | aValue ].
	self assert: (UnitConversionRule from: 1 to: 2 use: block) hash = (UnitConversionRule from: 1 to: 2 use: block) hash
]

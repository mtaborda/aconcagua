Class {
	#name : #UnitConversionRuleToEdgeAdapterTest,
	#superclass : #TestCase,
	#instVars : [
		'peso',
		'dollar'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #initialization }
UnitConversionRuleToEdgeAdapterTest >> setUp [

	peso := BaseUnit named: 'peso'.
	dollar := BaseUnit named: 'dollar'
]

{ #category : #testing }
UnitConversionRuleToEdgeAdapterTest >> testAccessing [

	| adapter block rule |
	
	block := [ :value | value ].
	rule := UnitConversionRule from: peso to: dollar use: block.
	adapter := UnitConversionRuleToEdgeAdapter for: rule.
	
	self assert: adapter sourceUnit = peso.
	self assert: adapter targetUnit = dollar.
	self assert: adapter function == block.
	self assert: adapter unitConversionRule == rule.
	self assert: ('peso -> dollar: [*:value | value*]' match: adapter printString)
]

{ #category : #testing }
UnitConversionRuleToEdgeAdapterTest >> testEdgeProtocol [

	| adapter block rule |
	
	block := [:value | value ].
	rule := UnitConversionRule from: peso to: dollar use: block.
	adapter := UnitConversionRuleToEdgeAdapter for: rule.
	
	self assert: (EdgeInterface selectors allSatisfy: [ :aSelector | adapter respondsTo: aSelector ]).

]

{ #category : #testing }
UnitConversionRuleToEdgeAdapterTest >> testEdgeProtocolBehavior [

	| adapter block rule |
	
	block := [:value | value ].
	rule := UnitConversionRule from: peso to: dollar use: block.
	adapter := UnitConversionRuleToEdgeAdapter for: rule.
	
	self assert: adapter source = peso.
	self assert: adapter target = dollar.
	self assert: (adapter convergesTo: dollar).
	self assert: (adapter startsOn: peso).
	self assert: (adapter goesFrom: peso to: dollar).
	self deny: adapter convergesToSelf
]

{ #category : #testing }
UnitConversionRuleToEdgeAdapterTest >> testEqual [

	| adapter block rule |
	
	block := [:value | value ].
	rule := UnitConversionRule from: peso to: dollar use: block.
	adapter := UnitConversionRuleToEdgeAdapter for: rule.
	self assert: adapter = (UnitConversionRuleToEdgeAdapter for: rule)
]

{ #category : #testing }
UnitConversionRuleToEdgeAdapterTest >> testHash [

	| block rule |
	
	block := [:value | value ].
	rule := UnitConversionRule from: peso to: dollar use: block.

	self assert: (UnitConversionRuleToEdgeAdapter for: rule) hash = (UnitConversionRuleToEdgeAdapter for: rule) hash
]

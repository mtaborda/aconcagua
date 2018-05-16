Class {
	#name : #ProportionalUnitConversionFunctionTest,
	#superclass : #TestCase,
	#instVars : [
		'peso',
		'dollar',
		'onePeso',
		'tenDollars'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #initialization }
ProportionalUnitConversionFunctionTest >> setUp [

	peso := BaseUnit named: 'peso'.
	dollar := BaseUnit named: 'dollar'.	
	onePeso := peso with: 1.
	tenDollars := dollar with: 10
]

{ #category : #testing }
ProportionalUnitConversionFunctionTest >> testAccessing [

	| function |
	
	function := ProportionalUnitConversionFunction measure: onePeso isProportionalTo: tenDollars.
	self assert: function sourceMeasure = onePeso.
	self assert: function equivalentMeasure = tenDollars.
	self assert: function proportionalMeasure = (tenDollars/onePeso).
	self assert: function printString = '10 dollars / 1 peso* valueToConvert'
]

{ #category : #testing }
ProportionalUnitConversionFunctionTest >> testEqual [

	| function |
	
	function := ProportionalUnitConversionFunction measure: onePeso isProportionalTo: tenDollars.
	self assert: function = (ProportionalUnitConversionFunction measure: onePeso isProportionalTo: tenDollars).
	self deny: function = (ProportionalUnitConversionFunction measure: tenDollars isProportionalTo: onePeso)
]

{ #category : #testing }
ProportionalUnitConversionFunctionTest >> testHash [

	self assert: (ProportionalUnitConversionFunction measure: onePeso isProportionalTo: tenDollars) hash =
		(ProportionalUnitConversionFunction measure: onePeso isProportionalTo: tenDollars) hash
]

{ #category : #testing }
ProportionalUnitConversionFunctionTest >> testInvalidValues [

	| cent |
	
	self 
		should: [ ProportionalUnitConversionFunction measure: (peso with:0) isProportionalTo: tenDollars ] 
		raise: InvalidProportionalUnitConversionFunctionException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = (peso with: 0).
			self assert: anException equivalentMeasure = tenDollars.
			self assert: anException description notNil ].
		
	cent := ProportionalDerivedUnit baseUnit: peso conversionFactor: 1/100 named: 'cent'.
	self 
		should: [ ProportionalUnitConversionFunction measure: onePeso isProportionalTo: (cent with: 100) ] 
		raise: InvalidProportionalUnitConversionFunctionException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = onePeso.
			self assert: anException equivalentMeasure = (cent with: 100).
			self assert: anException description notNil ]
]

{ #category : #testing }
ProportionalUnitConversionFunctionTest >> testValidValues [

	| function |
	
	function := ProportionalUnitConversionFunction measure: onePeso isProportionalTo: tenDollars.
	self assert: (function value: (peso with: 3)) = (dollar with: 30).
	self assert: (function value: onePeso) = tenDollars.

	function := ProportionalUnitConversionFunction measure: tenDollars isProportionalTo: onePeso.
	self assert: (function value:tenDollars) = onePeso.
	self assert: (function value:(dollar with: 1)) = (onePeso/10)
	
]

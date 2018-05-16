Class {
	#name : #ConversionTableTest,
	#superclass : #TestCase,
	#instVars : [
		'units'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #resources }
ConversionTableTest class >> resources [

	^Array with: UnitsTestResource
]

{ #category : #'accessing monetary units' }
ConversionTableTest >> cents [

	^units centavo
]

{ #category : #'accessing monetary units' }
ConversionTableTest >> dollar [

	^units dollar
]

{ #category : #'accessing monetary measurements' }
ConversionTableTest >> oneDollar [
	
	^self dollar with: 1
]

{ #category : #'accessing monetary measurements' }
ConversionTableTest >> oneHundredCents [

	^self cents with: 100
]

{ #category : #'accessing monetary measurements' }
ConversionTableTest >> onePeso [

	^self peso with: 1
]

{ #category : #'accessing monetary units' }
ConversionTableTest >> peso [

	^units peso
]

{ #category : #initialization }
ConversionTableTest >> setUp [

	units := UnitsTestResource current

]

{ #category : #'accessing monetary measurements' }
ConversionTableTest >> tenDollars [
	
	^self dollar with: 10
]

{ #category : #'testing accessing' }
ConversionTableTest >> testAccessing [

	| table rule |
	
	table := ConversionTable new.
	table measure: self onePeso convertsTo: self tenDollars.

	rule := table unitConversionRuleFrom: self peso to: self dollar.
	self assert: rule sourceUnit = self peso.
	self assert: rule targetUnit = self dollar.
	self assert: rule function = (ProportionalUnitConversionFunction measure: self onePeso isProportionalTo: self tenDollars).
	
	self 
		should: [ table unitConversionRuleFrom: self dollar to: self peso]
		raise: NoUnitConversionRuleException.
		
]

{ #category : #'testing accessing' }
ConversionTableTest >> testAccessingImmutability [

	| table rules |
	
	table := ConversionTable new.
	table measure: self onePeso convertsTo: self tenDollars.
	rules := table unitConversionRules.
	rules add: 1.
	self assert: table unitConversionRules size = 1
]

{ #category : #'testing table setup' }
ConversionTableTest >> testAddUnitConversionRule [
	"This test verifies that if two rules of conversion for the same measures are added, it is left the last one. 
	That is the behavior defined for the table."	

	| table convertionBlock |

	table := ConversionTable new.
	table addUnitConversionRule: 	(UnitConversionRule 
		from: self peso 
		to: self dollar 
		use: [ :aValue | aValue ]).
	convertionBlock := [ :aValue | aValue * self tenDollars / self onePeso ].
	table addUnitConversionRule: 	(UnitConversionRule 
		from: self peso
		to: self dollar
		use: convertionBlock).

	self assert: table unitConversionRules size = 1.
	self assert: ((table unitConversionRuleFrom: self peso to: self dollar) value: self onePeso) = self tenDollars
]

{ #category : #'testing table setup' }
ConversionTableTest >> testBreakEquivalence [

	| table |

	table := ConversionTable new.
	table measure: self onePeso isEquivalentTo: self tenDollars.
	table from: self peso to: self dollar use: [:aValue | aValue * self oneDollar / self onePeso ].
	
	self assert: ((table unitConversionRuleFrom: self peso to: self dollar) value: self onePeso) = self oneDollar.
	self assert: ((table unitConversionRuleFrom: self dollar to: self peso) value: self oneDollar) = (self onePeso/10)
]

{ #category : #'testing table setup' }
ConversionTableTest >> testConvertsTo [

	| table |
	
	table := ConversionTable new.
	table measure: self onePeso convertsTo: self tenDollars.
	
	self assert: table unitConversionRules size = 1.
	self assert: (table unitConversionRules includes: 
		(UnitConversionRule 
			from: self peso
			to: self dollar 
			use: (ProportionalUnitConversionFunction measure: self onePeso isProportionalTo: self tenDollars))).
			
	self deny: (table unitConversionRules includes: 
		(UnitConversionRule 
			from: self dollar
			to: self peso
			use: (ProportionalUnitConversionFunction measure:  self tenDollars isProportionalTo: self onePeso)))
]

{ #category : #'testing table setup' }
ConversionTableTest >> testDerivedUnitIsEquivalentTo [

	| table quarter fortyQuarters |
	
	quarter := units quarter.
	fortyQuarters := quarter with: 40.
	
	table := ConversionTable new.
	table measure: self oneHundredCents isEquivalentTo: self tenDollars.
	
	self assert: table unitConversionRules size = 2.
	self shouldnt: [ table unitConversionRuleFrom: self peso to: self dollar ] raise: NoUnitConversionRuleException.
	self shouldnt: [ table unitConversionRuleFrom: self dollar to: self peso ] raise: NoUnitConversionRuleException.
	self shouldnt: [ table unitConversionRuleFrom: self cents to: self dollar ] raise: NoUnitConversionRuleException.
	self shouldnt: [ table unitConversionRuleFrom: self dollar to: self cents ] raise: NoUnitConversionRuleException.
	self shouldnt: [ table unitConversionRuleFrom: self cents to: quarter ] raise: NoUnitConversionRuleException.
	self shouldnt: [ table unitConversionRuleFrom: quarter to: self cents ] raise: NoUnitConversionRuleException.
	
	self assert: ((table unitConversionRuleFrom: self peso to: self dollar) value: self onePeso) = self tenDollars.
	self assert: ((table unitConversionRuleFrom: self peso to: self dollar) value: self oneHundredCents) = self tenDollars.

	self assert: ((table unitConversionRuleFrom: self cents to: self dollar) value: self onePeso) = self tenDollars.
	self assert: ((table unitConversionRuleFrom: self cents to: self dollar) value: self oneHundredCents) = self tenDollars.

	self assert: ((table unitConversionRuleFrom: self dollar to: self peso) value: self tenDollars) = self onePeso.
	self assert: ((table unitConversionRuleFrom: self dollar to: self cents) value: self tenDollars) = self oneHundredCents.

	self assert: ((table unitConversionRuleFrom: quarter to: self peso) value: fortyQuarters) = self onePeso.
	self assert: ((table unitConversionRuleFrom: quarter to: self cents ) value: fortyQuarters) = self oneHundredCents
]

{ #category : #'testing table setup' }
ConversionTableTest >> testFromToUse [

	| table convertionBlock |
	
	table := ConversionTable new.
	convertionBlock := [ :aValue | aValue * self tenDollars / self onePeso ].
	table from: self peso to: self dollar use: convertionBlock.
	
	self assert: table unitConversionRules size = 1.
	self assert: (table unitConversionRules includes: 
		(UnitConversionRule 
			from: self peso
			to: self dollar
			use: convertionBlock))
]

{ #category : #'testing graph' }
ConversionTableTest >> testGraph [

	| table graph |
	
	table := ConversionTable new.
	table measure: self onePeso convertsTo: self tenDollars.
	graph := table graph.
	
	self assert: graph nodes size = 2.
	self assert: (graph nodes includes: self peso).
	self assert: (graph nodes includes: self dollar).
	
	self assert: graph edges size = 1.
	self assert: (graph edgesConvergingTo: self dollar) size = 1.
	self assert: (graph edgesConvergingTo: self dollar) first source = self peso.
	self assert: (graph edgesStartingOn: self peso) size = 1.
	self assert: (graph edgesStartingOn: self peso) first target = self dollar
]

{ #category : #'testing graph' }
ConversionTableTest >> testGraphChange [

	| table graph |
	
	table := ConversionTable new.
	table measure: self onePeso convertsTo: self tenDollars.
	graph := table graph.
	self assert: graph edges size = 1.

	table measure: self tenDollars convertsTo: self onePeso.
	self assert: table graph edges size = 2.
	self deny: table graph == graph
]

{ #category : #'testing table setup' }
ConversionTableTest >> testIsEquivalentTo [

	| table |
	
	table := ConversionTable new.
	table measure: self onePeso isEquivalentTo: self tenDollars.
	
	self assert: table unitConversionRules size = 2.
	self assert: (table unitConversionRules includes: 
		(UnitConversionRule 
			from: self peso 
			to: self dollar
			use: (ProportionalUnitConversionFunction measure: self onePeso isProportionalTo: self tenDollars))).
			
	self assert: (table unitConversionRules includes: 
		(UnitConversionRule 
			from: self dollar
			to: self peso
			use: (ProportionalUnitConversionFunction measure: self tenDollars isProportionalTo: self onePeso)))
]

{ #category : #'testing exceptions' }
ConversionTableTest >> testNoUnitConversionRule [

	| table |
	
	table := ConversionTable new.
	table measure: self onePeso convertsTo: self tenDollars.

	self 
		should: [table unitConversionRuleFrom: self dollar to: self peso ]
		raise: NoUnitConversionRuleException
		withExceptionDo: [ :anException |
			self assert: anException sourceUnit = self dollar.
			self assert: anException targetUnit = self peso.
			self assert: anException description notNil ]
]

{ #category : #'testing table setup' }
ConversionTableTest >> testRemove [

	| table |
	
	table := ConversionTable new.

	table measure: self onePeso convertsTo: self tenDollars.
	table removeUnitConversionRuleFrom: self peso to: self dollar.
	self assert: table unitConversionRules isEmpty.

	table measure: self onePeso convertsTo: self tenDollars.
	self 
		should: [ table removeUnitConversionRuleFrom: self dollar to: self peso]
		raise: NoUnitConversionRuleException
		withExceptionDo: [ :anException |
			self assert: anException sourceUnit = self dollar.
			self assert: anException targetUnit = self peso.
			self assert: anException description notNil ]
]

{ #category : #'testing table setup' }
ConversionTableTest >> testUnitConversionRuleUniqueness [

	| table |

	table := ConversionTable new.
	table from: self peso to: self dollar use: [:aValue | aValue * self oneDollar / self onePeso ].
	self assert: ((table unitConversionRuleFrom: self peso to: self dollar) value: self onePeso) = self oneDollar.

	table measure: self onePeso isEquivalentTo: self tenDollars.
	self assert: ((table unitConversionRuleFrom: self peso to: self dollar) value: self onePeso) = self tenDollars.
	self assert: ((table unitConversionRuleFrom: self dollar to: self peso) value: self oneDollar) = (self onePeso/10).
	
	table := ConversionTable new.
	table measure: self onePeso convertsTo: self oneDollar.
	self assert: ((table unitConversionRuleFrom: self peso to: self dollar) value: self onePeso) = self oneDollar.

	table measure: self onePeso isEquivalentTo: self tenDollars.
	self assert: ((table unitConversionRuleFrom: self peso to: self dollar) value: self onePeso) = self tenDollars.
	self assert: ((table unitConversionRuleFrom: self dollar to: self peso) value: self oneDollar) = (self onePeso/10)
]

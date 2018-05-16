Class {
	#name : #MeasureConverterTest,
	#superclass : #TestCase,
	#instVars : [
		'units',
		'moneyConverter'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #resources }
MeasureConverterTest class >> resources [

	^Array with: UnitsTestResource
]

{ #category : #initialization }
MeasureConverterTest >> createUnits [

	^UnitsTestResource current
]

{ #category : #'accessing monetary units' }
MeasureConverterTest >> dollar [

	^units dollar
]

{ #category : #'accessing monetary units' }
MeasureConverterTest >> euro [
	
	^units euro
]

{ #category : #initialization }
MeasureConverterTest >> initializeMoneyConverter [

	moneyConverter := MeasureConverter on: self moneyConversionTable
]

{ #category : #initialization }
MeasureConverterTest >> initializeUnitRegistry [

	units := self createUnits
]

{ #category : #initialization }
MeasureConverterTest >> moneyConversionTable [

	| table |
	
	table := ConversionTable new.
	table measure: self threePesos isEquivalentTo: self oneDollar.
	table measure: self oneEuro isEquivalentTo: self onePointThreeDollars.
	
	^table
]

{ #category : #'accessing monetary measurements' }
MeasureConverterTest >> oneDollar [
	
	^Measure amount: 1 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
MeasureConverterTest >> oneEuro [
	
	^Measure amount: 1 unit: self euro
]

{ #category : #'accessing monetary measurements' }
MeasureConverterTest >> onePeso [
	
	^Measure amount: 1 unit: self peso
]

{ #category : #'accessing monetary measurements' }
MeasureConverterTest >> onePointThreeDollars [
	
	^Measure amount: (13/10) unit: self dollar

]

{ #category : #'accessing monetary units' }
MeasureConverterTest >> peso [

	^units peso
]

{ #category : #initialization }
MeasureConverterTest >> setUp [

	self initializeUnitRegistry.
	self initializeMoneyConverter
]

{ #category : #test }
MeasureConverterTest >> testCanConvertTo [

	self assert: (moneyConverter canConvert: self onePeso to: self dollar)
]

{ #category : #test }
MeasureConverterTest >> testConvertToUsing [

	self assert: (moneyConverter findPathAndConvert: self onePeso to: self onePeso) = self onePeso.
	self assert: (moneyConverter findPathAndConvert: self threePesos to: self onePeso) = self threePesos
]

{ #category : #testing }
MeasureConverterTest >> testDefaultGraphPathFinder [

	self assert: MeasureConverter defaultGraphPathFinder = GraphPathFinder
]

{ #category : #testing }
MeasureConverterTest >> testDirectSearching [

	self assert: (moneyConverter convert: self onePeso to: self dollar) = (self dollar with: 1/3).
	self assert: (moneyConverter convert: self oneEuro to: self dollar) = (self dollar with: 13/10)
]

{ #category : #testing }
MeasureConverterTest >> testIndirectSearching [

	self assert: (moneyConverter convert: self onePeso to: self euro) = (self euro with: 10/39).
	self assert: (moneyConverter convert: self oneEuro to: self peso) = (self peso with: 39/10)
]

{ #category : #testing }
MeasureConverterTest >> testInvalidConversion [

	| patacon |
	
	patacon := BaseUnit named: 'patacon'.
	
	self 
		should: [ moneyConverter convert: self onePeso to: patacon ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = self onePeso.
			self assert: anException targetUnit = patacon.
			self assert: anException description notNil]
]

{ #category : #testing }
MeasureConverterTest >> testMeasureBagConversion [

	self assert: (moneyConverter convert: (self threePesos + self oneDollar) to: self dollar) = (self oneDollar * 2).
	self assert: (moneyConverter convert: (self threePesos + self oneDollar) to: self peso) = (self threePesos * 2).
	self assert: (moneyConverter convert: (self threePesos + self oneDollar + self oneEuro) to: self dollar) = ((self oneDollar * 2) + (self oneDollar * (13/10)))
]

{ #category : #testing }
MeasureConverterTest >> testSameDomainConversion [

	| cents |
	
	cents := ProportionalDerivedUnit baseUnit: self peso conversionFactor: 1/100 named: 'cent'.
	
	self assert: (moneyConverter convert: self onePeso to: self peso) = self onePeso.
	self assert: (moneyConverter convert: self onePeso to: cents) = (cents with: 100)
]

{ #category : #'accessing monetary measurements' }
MeasureConverterTest >> threePesos [

	^Measure amount: 3 unit: self peso
]

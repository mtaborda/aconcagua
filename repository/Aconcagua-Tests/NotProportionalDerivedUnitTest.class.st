Class {
	#name : #NotProportionalDerivedUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'kelvin'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #initialization }
NotProportionalDerivedUnitTest >> setUp [

	kelvin := BaseUnit named: 'kelvin'
]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testBaseUnit [

	| unit |
	
	unit := NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: unit baseUnit = kelvin
]

{ #category : #'test converting' }
NotProportionalDerivedUnitTest >> testConvertAmountToBaseUnit [

	| unit |
	
	unit :=  NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:celsius | celsius + (5463/20)] 
		reciprocalConversionBlock: [ :kelvins | kelvins - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: (unit convertAmountToBaseUnit: 0) = (5463/20).
	self assert: (unit convertAmountToBaseUnit: 100) = (7463/20)
]

{ #category : #'test converting' }
NotProportionalDerivedUnitTest >> testConvertToBaseUnit [

	| unit measure |
	
	unit :=  NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:celsius | celsius + (5463/20)] 
		reciprocalConversionBlock: [ :kelvins | kelvins - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	measure := Measure amount: 0 unit: unit.
	self assert: (unit convertToBaseUnit: measure) amount = (5463/20).
	self assert: (unit convertToBaseUnit: measure) unit = kelvin
	
	

]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testDenominator [

	| unit |
	
	unit := NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: unit denominator = NullUnit new
]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testName [

	self assert: ( NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius') name = 'celcius'
]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testNameForMany [

	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius') nameForMany = 'celciuss'.
	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius' 
		sign: '¦Ç¬¨¦Ç¬ù') nameForMany = 'celciuss'.
	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		nameForOne: 'celcius'
		nameForMany: 'celcius'
		sign: '¦Ç¬¨¦Ç¬ù') nameForMany = 'celcius'
]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testNameForOne [

	self assert: ( NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius') nameForOne = 'celcius'
]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testNothingAmount [

	| unit |
	
	unit := NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: unit nothingAmount = (-5463/20)

]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testNullMeasure [

	| unit |
	
	unit := NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: unit nullMeasure amount = 0.
	self assert: unit nullMeasure unit = kelvin.

]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testNumerator [

	| unit |
	
	unit := NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: unit numerator = unit
]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testReciprocal [

	| unit |
	
	unit := NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
		
	self assert: unit reciprocal = (NullUnit new / unit)

]

{ #category : #'test querying' }
NotProportionalDerivedUnitTest >> testSameDomainAs [

	| unit metro |
	
	unit :=  NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:celsius | celsius + (5463/20)] 
		reciprocalConversionBlock: [ :kelvins | kelvins - (5463/20) ]
		named: 'celsius' 
		sign: '¦Ç¬¨¦Ç¬ù'.
	self assert: (unit sameDomainAs: kelvin).

	metro := BaseUnit named: 'metro'.
	self deny: (unit sameDomainAs: metro).
	self deny: (unit sameDomainAs: (ProportionalDerivedUnit baseUnit: metro conversionFactor: 1/100 named: 'centimetro')).
	self deny: (unit sameDomainAs: (
		NotProportionalDerivedUnit 
			baseUnit: metro 
			conversionBlock:  [:celsius | ] 
			reciprocalConversionBlock: [ :kelvins | ]
			named: 'xxx' 
			sign: '¦Ç¬¨¦Ç¬ù'))
]

{ #category : #'test accessing' }
NotProportionalDerivedUnitTest >> testSign [

	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius') sign = NotProportionalDerivedUnit defaultSign.
	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: 'celcius' 
		sign: '¦Ç¬¨¦Ç¬ù') sign = '¦Ç¬¨¦Ç¬ù'.
	self assert: (NotProportionalDerivedUnit 
		baseUnit: kelvin 
		conversionBlock:  [:kelvins | kelvins + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		nameForOne: 'celcius'
		nameForMany: 'celcius'
		sign: '¦Ç¬¨¦Ç¬ù') sign = '¦Ç¬¨¦Ç¬ù'
]

Class {
	#name : #UnitsTestResource,
	#superclass : #TestResource,
	#instVars : [
		'units'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #initialization }
UnitsTestResource >> addUnit: aUnit [

	units at: aUnit name put: aUnit.

]

{ #category : #'temperature units - accessing' }
UnitsTestResource >> celsius [

	^units at: self celsiusName
]

{ #category : #'temperature units - naming' }
UnitsTestResource >> celsiusName [

	^'gradoCentigrado'
]

{ #category : #'monetary units - accessing' }
UnitsTestResource >> centavo [

	^units at: self centavoName
]

{ #category : #'monetary units - naming' }
UnitsTestResource >> centavoName [

	^'centavo'
]

{ #category : #'meter units - accessing' }
UnitsTestResource >> centimeter [

	^units at: self centimeterName
]

{ #category : #'meter units - naming' }
UnitsTestResource >> centimeterName [

	^'centimeter'
]

{ #category : #'temperature units - creating' }
UnitsTestResource >> createCelsius [

	^NotProportionalDerivedUnit 
		baseUnit: self kelvin 
		conversionBlock:  [:kelvin | kelvin + (5463/20)] 
		reciprocalConversionBlock: [ :celsius | celsius - (5463/20) ]
		named: self celsiusName 
		sign: '¦Ç¬¨¦Ç¬ù'
]

{ #category : #'monetary units - creating' }
UnitsTestResource >> createCentavo [

	^ProportionalDerivedUnit baseUnit: self peso conversionFactor: 1/100 named: self centavoName sign: '$ centavo'
]

{ #category : #'meter units - creating' }
UnitsTestResource >> createCentimeter [

	^ProportionalDerivedUnit 
		baseUnit: self meter 
		conversionFactor: 1/ 100
		named: self centimeterName 
		sign: 'cm'
]

{ #category : #'meter units - creating' }
UnitsTestResource >> createDecameter [

	^ProportionalDerivedUnit 
		baseUnit: self meter 
		conversionFactor: 10
		named: self decameterName 
		sign: 'dcm'
]

{ #category : #'meter units - creating' }
UnitsTestResource >> createDecimeter [

	^ProportionalDerivedUnit 
		baseUnit: self meter 
		conversionFactor: 1/10 
		named: self decimeterName 
		sign: 'dm'
]

{ #category : #'monetary units - creating' }
UnitsTestResource >> createDollar [

	^BaseUnit named: self dollarName sign: 'u$s'
]

{ #category : #'monetary units - creating' }
UnitsTestResource >> createEuro [

	^BaseUnit named: self euroName sign: '¦Ç¬¨¦É¬Ñ'
]

{ #category : #'monetary units - creating' }
UnitsTestResource >> createEuroCent [

	^ProportionalDerivedUnit baseUnit: self euro conversionFactor: 1/ 100 named: self euroCentName sign: '¦Ç¬¨¦É¬Ñ cent'
]

{ #category : #'temperature units - creating' }
UnitsTestResource >> createFahrenheit [ 

	^NotProportionalDerivedUnit 
		baseUnit: self kelvin 
		conversionBlock:  [:kelvin | (kelvin - 32) * (5/9)  +  (27315/100) ] 
		reciprocalConversionBlock: [ :fahrenheit | (fahrenheit - (27315/100)) * 9/5 + 32 ]
		named: self fahrenheitName 
		sign: 'F'
		
]

{ #category : #'meter units - creating' }
UnitsTestResource >> createHectometer [

	^ProportionalDerivedUnit 
		baseUnit: self meter 
		conversionFactor: 100 
		named: self hectometerName 
		sign: 'hm'
]

{ #category : #'temperature units - creating' }
UnitsTestResource >> createKelvin [

	^BaseUnit named: self kelvinName sign: 'K'
]

{ #category : #'meter units - creating' }
UnitsTestResource >> createKilometer [

	^ProportionalDerivedUnit 
		baseUnit: self meter 
		conversionFactor: 1000
		named: self kilometerName 
		sign: 'km'
]

{ #category : #'meter units - creating' }
UnitsTestResource >> createMeter [

	^BaseUnit named: self meterName sign: 'm'
]

{ #category : #'meter units - creating' }
UnitsTestResource >> createMillimeter [

	^ProportionalDerivedUnit 
		baseUnit: self meter 
		conversionFactor: 1/1000
		named: self millimeterName 
		sign: 'ml'
]

{ #category : #'time units - creating' }
UnitsTestResource >> createMinute [

	^ProportionalDerivedUnit baseUnit: self second conversionFactor: 60 named: self minuteName
]

{ #category : #'monetary units - creating' }
UnitsTestResource >> createPeso [

	^BaseUnit named: self pesoName sign: '$'
]

{ #category : #'monetary units - creating' }
UnitsTestResource >> createQuarter [

	^ProportionalDerivedUnit baseUnit: self dollar conversionFactor: 1/ 4 named: self quarterName sign: 'u$s quarter'
	
]

{ #category : #'time units - creating' }
UnitsTestResource >> createSecond [

	^BaseUnit named: self secondName
]

{ #category : #'meter units - accessing' }
UnitsTestResource >> decameter [

	^units at: self decameterName
]

{ #category : #'meter units - naming' }
UnitsTestResource >> decameterName [

	^'decameter'
]

{ #category : #'meter units - accessing' }
UnitsTestResource >> decimeter [

	^units at: self decimeterName
]

{ #category : #'meter units - naming' }
UnitsTestResource >> decimeterName [

	^'decimeter'
]

{ #category : #'monetary units - accessing' }
UnitsTestResource >> dollar [

	^units at: self dollarName
]

{ #category : #'monetary units - naming' }
UnitsTestResource >> dollarName [

	^'dollar'
]

{ #category : #'monetary units - accessing' }
UnitsTestResource >> euro [

	^units at: self euroName
]

{ #category : #'monetary units - accessing' }
UnitsTestResource >> euroCent [

	^units at: self euroCentName
]

{ #category : #'monetary units - naming' }
UnitsTestResource >> euroCentName [

	^'euro cent'
]

{ #category : #'monetary units - naming' }
UnitsTestResource >> euroName [

	^'euro'
]

{ #category : #'temperature units - accessing' }
UnitsTestResource >> fahrenheit [ 

	^units at: self fahrenheitName
]

{ #category : #'temperature units - naming' }
UnitsTestResource >> fahrenheitName [

	^'fahrenheit'
]

{ #category : #'meter units - accessing' }
UnitsTestResource >> hectometer [

	^units at: self hectometerName
]

{ #category : #'meter units - naming' }
UnitsTestResource >> hectometerName [

	^'hectometer'
]

{ #category : #'temperature units - accessing' }
UnitsTestResource >> kelvin [

	^units at: self kelvinName
]

{ #category : #'temperature units - naming' }
UnitsTestResource >> kelvinName [

	^'kelvin'
]

{ #category : #'meter units - accessing' }
UnitsTestResource >> kilometer [

	^units at: self kilometerName
]

{ #category : #'meter units - naming' }
UnitsTestResource >> kilometerName [

	^'kilometer'
]

{ #category : #'meter units - accessing' }
UnitsTestResource >> meter [

	^units at: self meterName
]

{ #category : #'meter units - naming' }
UnitsTestResource >> meterName [

	^'meter'
]

{ #category : #'meter units - accessing' }
UnitsTestResource >> millimeter [

	^units at: self millimeterName
]

{ #category : #'meter units - naming' }
UnitsTestResource >> millimeterName [

	^'millimeter'
]

{ #category : #'time units - accessing' }
UnitsTestResource >> minute [
	
	^units at: self minuteName
]

{ #category : #'time units - naming' }
UnitsTestResource >> minuteName [

	^'minuto'
]

{ #category : #'monetary units - accessing' }
UnitsTestResource >> peso [

	^units at: self pesoName
]

{ #category : #'monetary units - naming' }
UnitsTestResource >> pesoName [

	^'peso'
]

{ #category : #'monetary units - accessing' }
UnitsTestResource >> quarter [

	^units at: self quarterName
]

{ #category : #'monetary units - naming' }
UnitsTestResource >> quarterName [

	^'quarter'
]

{ #category : #'time units - accessing' }
UnitsTestResource >> second [
	
	^units at: self secondName
]

{ #category : #'time units - naming' }
UnitsTestResource >> secondName [

	^'segundo'
]

{ #category : #initialization }
UnitsTestResource >> setUp [

	units := Dictionary new.
	self
		addUnit: self createMeter;
		addUnit: self createMillimeter;		
		addUnit: self createCentimeter;
		addUnit: self createDecimeter;
		addUnit: self createDecameter;		
		addUnit: self createHectometer;		
		addUnit: self createKilometer;		
		addUnit: self createPeso;
		addUnit: self createDollar;
		addUnit: self createEuro;
		addUnit: self createCentavo;
		addUnit: self createQuarter;
		addUnit: self createEuroCent;
		addUnit: self createKelvin;
		addUnit: self createCelsius;
		addUnit: self createFahrenheit;
		addUnit: self createSecond;
		addUnit: self createMinute.

]

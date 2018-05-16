Class {
	#name : #MeasureTest,
	#superclass : #TestCase,
	#instVars : [
		'units'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #resources }
MeasureTest class >> resources [

	^Array with: UnitsTestResource
]

{ #category : #'accessing temperature units' }
MeasureTest >> celsius [

	^units celsius
]

{ #category : #'accessing distance units' }
MeasureTest >> centimeter [
	
	^units centimeter
]

{ #category : #converting }
MeasureTest >> convertToBaseUnit [
	
	^self
]

{ #category : #'bag creation' }
MeasureTest >> createBagWith: aMeasure [

	^aMeasure createBagWithMeasure: self
]

{ #category : #'accessing monetary units' }
MeasureTest >> dollar [

	^units dollar
]

{ #category : #'accessing monetary units' }
MeasureTest >> euro [

	^units euro
]

{ #category : #'accessing temperature units' }
MeasureTest >> fahrenheit [

	^units fahrenheit
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> fiveDollars [

	^Measure amount: 5 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> fivePesos [

	^Measure amount: 5 unit: self peso
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> fortyDollars [

	^Measure amount: 40 unit: self dollar
]

{ #category : #'accessing temperature units' }
MeasureTest >> kelvin [
	
	^units kelvin
]

{ #category : #'accessing distance units' }
MeasureTest >> kilometer [
	
	^units kilometer
]

{ #category : #'accessing distance units' }
MeasureTest >> meter [

	^units meter
]

{ #category : #'accessing distance units' }
MeasureTest >> metro [

	^units metro
]

{ #category : #'accessing distance units' }
MeasureTest >> millimeter [
	
	^units millimeter
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> minusTenDollars [

	^Measure amount: -10 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> minusTenPesos [
	
	^Measure amount: -10 unit: self peso
]

{ #category : #'time units' }
MeasureTest >> minute [

	^units minute
]

{ #category : #'accessing temperature measurements' }
MeasureTest >> oneCelsius [

	^Measure amount: 1 unit: self celsius
]

{ #category : #'accessing distance measurements' }
MeasureTest >> oneCentimeter [
	
	^Measure amount: 1 unit: self centimeter
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> oneDollar [
	
	^Measure amount: 1 unit: self dollar
]

{ #category : #'accessing temperature measurements' }
MeasureTest >> oneFahrenheit [

	^Measure amount: 1 unit: self fahrenheit
]

{ #category : #'accessing distance measurements' }
MeasureTest >> oneKilometer [
	
	^Measure amount: 1 unit: self kilometer
]

{ #category : #'accessing distance measurements' }
MeasureTest >> oneMeter [
	
	^Measure amount: 1 unit: self meter
]

{ #category : #'time measurements' }
MeasureTest >> oneMinute [
	
	^Measure amount: 1 unit: self minute
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> onePeso [

	^Measure amount: 1 unit: self peso
]

{ #category : #'time measurements' }
MeasureTest >> oneSecond [
	
	^Measure amount: 1 unit: self second
]

{ #category : #'accessing monetary units' }
MeasureTest >> peso [

	^units peso
]

{ #category : #testing }
MeasureTest >> sameDomainAs: aMeasure [ 
	
	^false
]

{ #category : #'time units' }
MeasureTest >> second [
	
	^units second
]

{ #category : #initialization }
MeasureTest >> setUp [

	units := UnitsTestResource current
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> tenDollars [

	^Measure amount: 10 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> tenEuros [

	^Measure amount: 10 unit: self euro
]

{ #category : #'accessing distance measurements' }
MeasureTest >> tenKilometers [
	
	^Measure amount: 10 unit: self kilometer
]

{ #category : #'accessing distance measurements' }
MeasureTest >> tenMeters [

	^Measure amount: 10 unit: self meter
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> tenPesos [
	
	^Measure amount: 10 unit: self peso
]

{ #category : #'test integer remainder' }
MeasureTest >> tesRemainderFractionByMeasure [

	self assert: (1/3) \\ self tenPesos = (1/3)
]

{ #category : #test }
MeasureTest >> testAbs [

	self assert: self onePeso abs = self onePeso.
	self assert: (self onePeso unit with: 0)  abs = (self onePeso unit with: 0).
	self assert: (self onePeso unit with: -1)  abs = (self onePeso unit with: 1)
]

{ #category : #'test add' }
MeasureTest >> testAddAssociativity [

	self assert: (self oneMeter + (self oneMeter + self oneKilometer)) amount = ((self oneMeter + self oneMeter) + self oneKilometer) amount.
	self assert: (self oneMeter + (self oneMeter + self oneKilometer)) unit = ((self oneMeter + self oneMeter) + self oneKilometer) unit
]

{ #category : #'test add' }
MeasureTest >> testAddBaseUnit [

	self assert: (self oneMeter + self oneMeter) amount = 2.
	self assert: (self oneMeter + self oneMeter) unit = self meter
]

{ #category : #'test add' }
MeasureTest >> testAddBaseUnitAndDerivedUnit [

	self assert: (self oneKilometer + self oneMeter) amount = 1001.
	self assert: (self oneKilometer + self oneMeter) unit = self meter.
	
	self assert: (self zeroCelsius + (Measure amount: 32 unit: self fahrenheit)) amount = (5463/10).
	self assert: (self zeroCelsius + (Measure amount: 32 unit: self fahrenheit)) unit = self kelvin

]

{ #category : #'test add' }
MeasureTest >> testAddCommutativity [

	self assert: (self oneMeter + self oneKilometer) amount = (self oneKilometer + self oneMeter) amount.
	self assert: (self oneMeter + self oneKilometer) unit = (self oneKilometer + self oneMeter) unit
]

{ #category : #'test add' }
MeasureTest >> testAddDerivedUnit [

	self assert: (self oneKilometer + self oneCentimeter) amount = (100001/100).
	self assert: (self oneKilometer + self oneCentimeter) unit = self meter
]

{ #category : #'test add' }
MeasureTest >> testAddDifferentBaseUnits [

	self should: [ (self tenPesos + self twentyDollars) amount ] raise: Exception.
	self should: [ (self tenPesos + self twentyDollars) unit ] raise: Exception.
	self assert: (self tenPesos + self twentyDollars) numberOfMeasures=2.

	self should: [ (self tenPesos + ( self twentyDollars + self tenEuros)) amount ] raise: Exception.
	self should: [ ((self tenPesos + self twentyDollars) + self tenEuros) amount ] raise: Exception.

]

{ #category : #'test add' }
MeasureTest >> testAddDifferentUnit [

	| a10pesosPlus20Dollars |

	a10pesosPlus20Dollars := self tenPesos + self twentyDollars.
	self assert: a10pesosPlus20Dollars = (self tenPesos + self twentyDollars) description: 'Equality'.
	self assert: a10pesosPlus20Dollars = (self twentyDollars + self tenPesos) description: 'Conmutativity'.
	self assert: a10pesosPlus20Dollars = (self tenPesos + (self tenDollars + self tenDollars)) description: 'Associativity'.
	self assert: (self tenPesos + (self twentyDollars + self tenEuros))=((self tenPesos + self twentyDollars) + self tenEuros) description: 'Associativity'.
	
	a10pesosPlus20Dollars + self tenPesos.
	self assert: a10pesosPlus20Dollars = (self tenPesos + self twentyDollars) description: 'Inmutability'.
	self assert: (self zeroPesos + self twentyDollars) = self twentyDollars description: 'Adding zero'.
	self assert: ((self tenPesos + self twentyDollars) + self zeroCentimeters) = (self tenPesos + self twentyDollars)  description: 'Adding zero, should be equal to bag without nothing member'.
	
	self assert: (self zeroPesos + self zeroDollars) = (self zeroDollars + self zeroPesos) description: 'Adding Zero'
]

{ #category : #'test add' }
MeasureTest >> testAddDividedMeasure [

	self assert: ((self tenMeters + (self tenMeters / self fivePesos)) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters + (self tenMeters / self fivePesos)) atSameBaseUnitAs: (self meter / self peso)) = (self tenMeters / self fivePesos)
]

{ #category : #'test add' }
MeasureTest >> testAddFloatWithMeasure [

	self assert: ((10.01 + self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10.01 + self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.01.	
]

{ #category : #'test add' }
MeasureTest >> testAddFractionWithMeasure [

	self assert: ((1/3 + self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((1/3 + self tenMeters) atSameBaseUnitAs: NullUnit new) = (1/3).	
]

{ #category : #'test infinity' }
MeasureTest >> testAddInfinity [

	self assert: self oneMeter + Infinity = Infinity.
	self assert: Infinity + self oneMeter = Infinity.
	self assert: self oneMeter negated + Infinity = Infinity.
	self assert: Infinity + self oneMeter negated = Infinity
]

{ #category : #'test add' }
MeasureTest >> testAddIntegerWithMeasure [

	self assert: ((10 + self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10 + self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.	
]

{ #category : #'test minus infinity' }
MeasureTest >> testAddMinusInfinity [

	self assert: self oneMeter + MinusInfinity = MinusInfinity.
	self assert: MinusInfinity + self oneMeter = MinusInfinity.
	self assert: self oneMeter negated + MinusInfinity = MinusInfinity.
	self assert: MinusInfinity + self oneMeter negated = MinusInfinity
]

{ #category : #'test add' }
MeasureTest >> testAddMultipliedMeasure [

	self assert: ((self tenMeters + (self tenMeters * self fivePesos)) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters + (self tenMeters * self fivePesos)) atSameBaseUnitAs: (self meter*self peso)) = (self tenMeters * self fivePesos)

]

{ #category : #'test add' }
MeasureTest >> testAddNumber [

	self assert: ((self tenMeters + 10) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters + 10) atSameBaseUnitAs: NullUnit new) = 10.	
]

{ #category : #'test add' }
MeasureTest >> testAddScaledDecimalWithMeasure [

	self assert: ((10.01s2 + self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((10.01s2 + self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.01s2.	
]

{ #category : #'test accessing' }
MeasureTest >> testAmount [

	self assert: self oneMeter amount = 1 description: 'Amount'.
	self assert: self tenMeters amount = 10 description: 'Amount'
]

{ #category : #test }
MeasureTest >> testAtBaseUnitIfNone [

	self assert: (self oneSecond atBaseUnit: self second ifNone: []) = self oneSecond.
	self assert: (self oneSecond atBaseUnit: self minute ifNone: ['error']) = 'error'
]

{ #category : #'test accessing' }
MeasureTest >> testBaseUnit [

	self assert: self oneMeter baseUnit = self meter.
	self assert: self oneKilometer baseUnit = self meter.
	self assert: self oneCentimeter baseUnit = self meter.
	
	
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testBetweenAnd [

	self assert: (self tenMeters between: self oneMeter and: (Measure amount: 11 unit: self meter)).
	self assert: (self tenMeters between: self oneMeter and: self tenMeters).
	self assert: (self tenMeters between: self tenMeters and: self tenMeters).
	self assert: (self tenMeters between: self oneCentimeter and: self oneKilometer).


]

{ #category : #'test magnitude protocol' }
MeasureTest >> testBetweenAndNotInclusive [

	self assert: (self tenMeters between: self oneMeter andNotInclusive: (Measure amount: 11 unit: self meter)).
	self assert: (self tenMeters between: self tenMeters andNotInclusive: (Measure amount: 11 unit: self meter)).
	self deny: (self tenMeters between: self oneMeter andNotInclusive: self tenMeters).


]

{ #category : #'test comparing' }
MeasureTest >> testCloseTo [

	self assert: (self oneMeter closeTo: 1000.000001 * self millimeter)
	
]

{ #category : #test }
MeasureTest >> testCompareGreaterThan [

	self assert: (self oneCelsius compareGreaterThan: 0).
	self deny: (self zeroCelsius compareGreaterThan: 0).
	self should: [self oneCelsius compareGreaterThan: 1] raise: CanNotConvertMeasureException.
	self should: [self oneCelsius compareGreaterThan: -1] raise: CanNotConvertMeasureException
]

{ #category : #'test accessing' }
MeasureTest >> testConvertAmountToBaseUnit [

	self assert: self oneMeter convertAmountToBaseUnit = 1.
	self assert: self oneKilometer convertAmountToBaseUnit = 1000.
	self assert: self oneCentimeter convertAmountToBaseUnit = (1/100)
]

{ #category : #'test converting' }
MeasureTest >> testConvertNothing [

	self assert: (self zeroMeters convertTo: self meter) = self zeroMeters.
	self assert: ((Measure amount: 0 unit: self centimeter) convertTo: self meter) = self zeroMeters		
]

{ #category : #'test converting' }
MeasureTest >> testConvertTo [

	self assert: (self oneMeter convertTo: self meter) = self oneMeter.
	self assert: (self oneKilometer convertTo: self meter) = (Measure amount: 1000 unit: self meter).
	self assert: (self oneCentimeter convertTo: self meter) = (Measure amount: (1/100) unit: self meter).

	self assert: (self oneMeter convertTo: self kilometer) = (Measure amount: (1/1000) unit: self kilometer).
	self assert: (self oneMeter convertTo: self centimeter) = (Measure amount: 100 unit: self centimeter).

	self assert: (self oneCentimeter convertTo: self kilometer) = (Measure amount: (1/100000) unit: self kilometer).
	self assert: (self oneKilometer convertTo: self centimeter) = (Measure amount: 100000 unit: self centimeter)
]

{ #category : #'test converting' }
MeasureTest >> testConvertToBaseUnit [

	self assert: self oneMeter convertToBaseUnit = self oneMeter.
	self assert: self oneKilometer convertToBaseUnit = (Measure amount: 1000 unit: self meter)
]

{ #category : #'test accessing' }
MeasureTest >> testDenominator [

	self assert: (self tenMeters ) denominator = 1.
	self assert: (self tenMeters * self tenMeters) denominator = 1
]

{ #category : #'test infinity' }
MeasureTest >> testDivideInfinity [

	self assert: self oneMeter / Infinity = 0.
	self
		should: [Infinity / self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and 1 meter'].
	self assert: self oneMeter negated / Infinity = 0.
	self
		should: [Infinity / self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and -1 meter']
]

{ #category : #'test minus infinity' }
MeasureTest >> testDivideMinusInfinity [

	self assert: self oneMeter / MinusInfinity = 0.
	self
		should: [MinusInfinity / self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and 1 meter'].
	self assert: self oneMeter negated / MinusInfinity = 0.
	self
		should: [MinusInfinity / self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and -1 meter']
]

{ #category : #'test division' }
MeasureTest >> testDivisionByDividedMeasure [

	self assert: (self oneKilometer / (self oneMeter/self onePeso)) = (Measure amount: 1000 unit: self peso).
	self assert: (self oneKilometer / (self onePeso/self oneMeter)) = ((self oneKilometer*self oneMeter)/self onePeso)
	

]

{ #category : #'test division' }
MeasureTest >> testDivisionByMeasureBaseUnitOverBaseUnit [

	self assert: (self tenMeters / self tenMeters) = 1.
	self assert: (self tenMeters / self tenMeters) amount= 1.
	self assert: (self tenMeters / self tenMeters) unit = NullUnit new.
	self assert: (self tenMeters / self oneMeter) = 10.
	self assert: (self tenMeters / self oneSecond) = (Measure amount: 10 unit: (self meter/self second)).
	self assert: (self tenMeters / self twoSecond) = (Measure amount: 5 unit: (self meter/self second)).
	self assert: (self tenMeters / self oneSecond) numerator = self tenMeters.
	self assert: (self tenMeters / self oneSecond) denominator = self oneSecond
]

{ #category : #'test division' }
MeasureTest >> testDivisionByMeasureBaseUnitOverDerivedUnit [

	self assert: (self oneMeter / self oneKilometer) = (1/1000).
	self assert: (self oneMeter / self oneCentimeter) = 100.
	self assert: (self oneMeter / self oneMinute) = (Measure amount: 1/60 unit: (self meter/self second)).

	

]

{ #category : #'test division' }
MeasureTest >> testDivisionByMeasureDerivedUnitOverBaseUnit [

	self assert: (self oneKilometer / self oneMeter) = 1000.
	self assert: (self oneKilometer / self tenMeters) = 100.
	self assert: (self oneKilometer / self oneKilometer) = 1.
	self assert: (self oneKilometer / self oneSecond) = (Measure amount: 1000 unit: (self meter/self second)).

	

]

{ #category : #'test division' }
MeasureTest >> testDivisionByNumber [

	self assert: (self zeroPesos / 1) amount = 0.
	self assert: (self tenPesos / 10) = self onePeso.


]

{ #category : #'test division' }
MeasureTest >> testDivisionByZero [

	self should: [ self tenPesos / 0 ] raise: Exception description: 'Divition by 0'.

]

{ #category : #'test division' }
MeasureTest >> testDivisionFloatByMeasure [

	self assert: (1.01 / self tenPesos) = ((NullUnit new / self peso) with: 1.01/10)


]

{ #category : #'test division' }
MeasureTest >> testDivisionFractionByMeasure [

	self assert: ((1/3) / self tenPesos) = ((NullUnit new / self peso) with: (1/3)/10)


]

{ #category : #'test division' }
MeasureTest >> testDivisionIntegerByMeasure [

	self assert: (1 / self tenPesos) = ((NullUnit new / self peso) with: 1/10)


]

{ #category : #'test division' }
MeasureTest >> testDivisionOfBaseUnit [

	self assert: (self tenMeters / 10) amount = 1 description: 'Divition'.
	self assert: (self tenMeters / 10) unit = self meter description: 'Divition'.
	

]

{ #category : #'test division' }
MeasureTest >> testDivisionOfDerivedUnit [

	self assert: (self oneKilometer / 10 ) amount = (1/10).
	self assert: (self oneKilometer / 10 ) unit = self kilometer.
	

]

{ #category : #'test division' }
MeasureTest >> testDivisionScaledDecimalByMeasure [

	self assert: (23.76s2 / self tenPesos) = ((NullUnit new / self peso) with: 23.76s2/10)


]

{ #category : #'test comparing' }
MeasureTest >> testEqual [

	self assert: self oneMeter = self thousandMillimeters description: 'Equal on same system'.
	self assert: self thousandMillimeters = self oneMeter description: 'Equal on same system'.
	
	self assert: self tenPesos = self tenPesos description: 'Equals'.
	self deny: self tenPesos = self twentyPesos description: 'Equals different amount'.
	
	self deny: self zeroCelsius = self zeroFahrenheit description: 'Equals on the same type of unit but not equal measures'.
	self assert: self zeroCelsius = (Measure amount: 32 unit: self fahrenheit)
	
]

{ #category : #'test comparing' }
MeasureTest >> testEqualDifferentBaseUnit [

	self deny: self tenPesos = self tenDollars
]

{ #category : #'test comparing' }
MeasureTest >> testEqualNothingWhenRepresentSameEntity [

	self
		assert: self zeroDollars = self zeroPesos
		description: 'Zeros of different units must be equivalent since they represent the same entities'
]

{ #category : #'test comparing' }
MeasureTest >> testEqualNumber [

	self deny: self oneMeter = 1.
	self deny: 1 = self oneMeter
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testGreaterThan [

	self assert: self tenMeters > self oneMeter.
	self assert: self oneKilometer > self oneMeter.
	self deny: self  oneCentimeter > self oneMeter.
	self deny: self oneMeter > self oneMeter.
	self deny: self thousandMillimeters > self oneMeter.
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testGreaterThanEquals [

	self assert: self tenMeters >= self oneMeter.
	self deny: self oneMeter >= self tenMeters.
	self assert: self tenMeters >= self tenMeters.
	self assert: self oneMeter >= self thousandMillimeters.


]

{ #category : #'test comparing' }
MeasureTest >> testHash [

	self assert: self oneMeter hash = self oneMeter hash.
	self assert: self oneMeter hash = self thousandMillimeters hash
	
	

]

{ #category : #test }
MeasureTest >> testIntegerDivideMeasureBag [

	self assert:
		(self fiveDollars moduloMeasureBag: self fiveDollars + self fivePesos) =
			(1 + (self onePeso / self oneDollar))
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidBetweenAnd [

	self
		should: [self tenMeters between: self oneMeter and: self onePeso]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException operationName = 'convertTo:'.
			self assert: anException targetUnit = self peso].

	self
		should: [self tenMeters between: self onePeso and: self oneMeter]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = self peso].

	self
		should: [self tenMeters between: 1 and: 2]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException |
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = NullUnit new]
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidBetweenAndNotInclusive [

	self 
		should: [ self tenMeters between: self oneMeter andNotInclusive: self onePeso ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = self peso ].

	self 
		should: [ self tenMeters between: self onePeso andNotInclusive: self oneMeter ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = self peso ].
			
	self 
		should: [ self tenMeters between: 1 andNotInclusive: 2 ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = NullUnit new ]
]

{ #category : #'test converting' }
MeasureTest >> testInvalidConvertTo [

	self assert: 
		([ self oneMeter convertTo: self peso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :anException |
				self assert: anException sourceMeasure = self oneMeter.
				self assert: anException targetUnit = self peso.
				self assert: anException isResumable.
				anException return: true ])
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidGreaterThan [

	self assert: (
		[ self oneMeter > self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self oneMeter.
				self assert: aSignal targetUnit = self peso.
				aSignal return: true ])
]

{ #category : #test }
MeasureTest >> testInvalidGreaterThanAgainstScalar [

	self assert: (
		[
			self oneMeter > 1.
			false]
				on: CanNotConvertMeasureException
				do: [:aSignal | aSignal return: true])
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidGreaterThanEquals [

	self assert: (
		[ self oneMeter >= self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self oneMeter.
				self assert: aSignal targetUnit = self peso.			
				aSignal return: true ]).

	self assert: (
		[ self oneMeter >= 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ]).
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidLessThan [

	self assert: (
		[ self oneMeter < self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self oneMeter.
				self assert: aSignal targetUnit = self peso.
				aSignal return: true ]).

	self assert: (
		[ self oneMeter < 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ]).
			

]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidLessThanEquals [

	self assert: (
		[ self oneMeter <= self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self oneMeter.
				self assert: aSignal targetUnit = self peso.			
				aSignal return: true ]).

	self assert: (
		[ self oneMeter <= 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ])
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidMax [

	self assert: (
		[ self tenMeters max: self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self tenMeters.
				self assert: aSignal targetUnit = self peso.
				aSignal return: true ]).

	self assert: (
		[ self tenMeters max: 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ])
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidMin [

	self assert: (
		[ self tenMeters min: self onePeso.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | 
				self assert: aSignal sourceMeasure = self tenMeters.
				self assert: aSignal targetUnit = self peso.
				aSignal return: true ]).

	self assert: (
		[ self tenMeters min: 1.
		false ]
			on: CanNotConvertMeasureException
			do: [ :aSignal | aSignal return: true ])
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidNotInclusiveBetweenAnd [

	self 
		should: [ self tenMeters notInclusiveBetween: self oneMeter and: self onePeso ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = self peso ].

	self 
		should: [ self tenMeters notInclusiveBetween: self onePeso and: self oneMeter ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = self peso ].
			
	self 
		should: [ self tenMeters notInclusiveBetween: 1 and: 2 ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = NullUnit new ]
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testInvalidNotInclusiveBetweenAndNotInclusive [

	self 
		should: [ self tenMeters notInclusiveBetween: self oneMeter andNotInclusive: self onePeso ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
			self assert: anException sourceMeasure = self tenMeters.
			self assert: anException targetUnit = self peso ].

	self 
		should: [ self tenMeters notInclusiveBetween: self onePeso andNotInclusive: self oneMeter ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = self peso ].
			
	self 
		should: [ self tenMeters notInclusiveBetween: 1 andNotInclusive: 2 ]
		raise: CanNotConvertMeasureException
		withExceptionDo: [ :anException | 
				self assert: anException sourceMeasure = self tenMeters.
				self assert: anException targetUnit = NullUnit new ]
]

{ #category : #test }
MeasureTest >> testIsFraction [

	self deny: (self meter with: 1) isFraction.
	self deny: (self centimeter with: 12) isFraction.
	self deny: ((self peso * self meter) with: 44) isFraction.
	self deny: ((self peso / self meter) with: 1234) isFraction.
	self deny: (self meter with: 1.05) isFraction.
	self deny: (self centimeter with: 1.05) isFraction.
	self deny: ((self peso * self meter) with: 1.05) isFraction.
	self deny: ((self peso / self meter) with: 1.05) isFraction


]

{ #category : #'test testing' }
MeasureTest >> testIsNothing [

	self assert: self zeroMeters isNothing.
	self assert: self zeroCentimeters isNothing.
	
	self assert: (Measure amount: 0 unit: self kelvin) isNothing.
	self assert: (Measure amount: (-5463/20) unit: self celsius) isNothing.
	
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testLessThan [

	self assert: self oneMeter < self tenMeters.
	self assert: self oneMeter < self oneKilometer.
	self deny: self oneMeter < self oneCentimeter.
	self deny: self oneMeter < self oneMeter.
	self deny: self oneMeter < self thousandMillimeters.
	self deny: self oneMeter < 0
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testLessThanEquals [

	self assert: self oneMeter <= self tenMeters.
	self deny: self tenMeters <= self oneMeter.
	self assert: self oneMeter <= self oneMeter.
	self assert: self oneMeter <= self thousandMillimeters.

]

{ #category : #'test magnitude protocol' }
MeasureTest >> testMax [

	self assert: (self tenMeters max: self oneMeter) = self tenMeters.
	self assert: (self oneMeter max: self tenMeters) = self tenMeters.
	self assert: (self tenMeters max: self oneKilometer) = self oneKilometer.
	self assert: (self oneKilometer max: self oneMeter) = self oneKilometer.
	self assert: (self oneCentimeter max: self oneKilometer) = self oneKilometer.
	self assert: (self oneKilometer max: self oneCentimeter) = self oneKilometer.
	

]

{ #category : #'test accessing' }
MeasureTest >> testMeasures [

	self
		assert: self oneMeter measures size = 1 description: 'Must be included only the own measure';
		assert: (self oneMeter measures includes: self oneMeter) description: 'Must be included the own measure'
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testMin [

	self assert: (self tenMeters min: self oneMeter) = self oneMeter.
	self assert: (self oneMeter min: self tenMeters) = self oneMeter.
	self assert: (self tenMeters min: self oneKilometer) = self tenMeters.
	self assert: (self oneKilometer min: self oneMeter) = self oneMeter.
	self assert: (self oneCentimeter min: self oneKilometer) = self oneCentimeter.
	self assert: (self oneKilometer min: self oneCentimeter) = self oneCentimeter.
	

]

{ #category : #'test integer division' }
MeasureTest >> testModuloByMeasure [

	self assert: (self tenMeters // self tenMeters) = 1.
	self assert: (self oneMeter // self tenMeters) = 0.
	self assert:
		(self tenMeters // self oneSecond) = (Measure amount: 10 unit: (self meter / self second)).
	self assert:
		(self tenMeters // self twoSecond) = (Measure amount: 5 unit: (self meter / self second))
]

{ #category : #'test integer division' }
MeasureTest >> testModuloByZero [

	self should: [ self tenPesos // 0 ] raise: Exception.

]

{ #category : #'test integer division' }
MeasureTest >> testModuloFloatByMeasure [

	self assert: (10.01 // self tenPesos) = (1 / self onePeso)

]

{ #category : #'test integer division' }
MeasureTest >> testModuloFractionByMeasure [

	self assert: (1/3) // self tenPesos = (0 / self onePeso)

]

{ #category : #'test infinity' }
MeasureTest >> testModuloInfinity [

	self assert: self oneMeter // Infinity = 0.
	self
		should: [Infinity // self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and 1 meter'].
	self assert: self oneMeter negated // Infinity = 0.
	self
		should: [Infinity // self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Infinity and -1 meter']
]

{ #category : #'test integer division' }
MeasureTest >> testModuloIntegerByMeasure [

	self assert: 1 // self tenPesos = (0 / self onePeso)


]

{ #category : #'test minus infinity' }
MeasureTest >> testModuloMinusInfinity [

	self assert: self oneMeter // MinusInfinity = 0.
	self
		should: [MinusInfinity // self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and 1 meter'].
	self assert: self oneMeter negated // MinusInfinity = 0.
	self
		should: [MinusInfinity // self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Modulo operation is indeterminate between Minus Infinity and -1 meter']
]

{ #category : #'test integer division' }
MeasureTest >> testModuloOfBaseUnit [

	self assert: (self tenMeters // 10) amount = 1.
	self assert: (self tenMeters // 10) unit = self meter.
	
	self assert: (self tenMeters // 3) amount = 3.

]

{ #category : #'test integer division' }
MeasureTest >> testModuloOfDerivedUnit [

	self assert: (self tenKilometers // 10 ) amount = 1.
	self assert: (self tenKilometers // 10 ) unit = self kilometer.
	
	self assert: (self tenKilometers // 3 ) amount = 3.

]

{ #category : #'test integer division' }
MeasureTest >> testModuloScaledDecimalByMeasure [

	self assert: (23.76s2 // self tenPesos) = (2 / self onePeso)

]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplicationOfBaseUnit [

	self assert: (self tenMeters * 2) amount = 20.
	self assert: (self tenMeters * 2) unit = self meter
	
	
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplicationOfDerivedUnit [

	self assert: (self oneKilometer * 2) amount = 2.
	self assert: (self oneKilometer * 2) unit = self kilometer
	
	
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyByDividedMeasure [

	self assert: (self onePeso*(self tenPesos/self oneMeter)) amount = 10.
	self assert: (self onePeso*(self tenPesos/self oneMeter)) unit = (self peso*self peso/self meter).

	self assert: (self onePeso*(self tenMeters/self onePeso)) = self tenMeters
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyByMeasure [

	self assert: (self onePeso*self tenPesos) amount = 10.
	self assert: (self onePeso*self tenPesos) unit = (self peso*self peso).

	
	
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyByMeasureAssociativity [

	self assert: ((self onePeso * self tenPesos) * self tenPesos) = (self onePeso * (self tenPesos * self tenPesos))	
	
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyByMultipliedMeasure [

	self assert: (self onePeso * self tenPesos * self tenPesos) amount = 100.
	self assert: (self onePeso * self tenPesos * self tenPesos) unit = (self peso * self peso * self peso)	
	
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyByNumber [

	self assert: self onePeso * 10 = self tenPesos.	
	self assert: self onePeso * 0 = self zeroPesos.	
	self assert: self onePeso * 0 = 0.
	self assert: self onePeso * 0 = self zeroDollars
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyFloatByMeasure [

	self assert: (1.01 * self tenPesos) = ((NullUnit new * self peso) with: 1.01*10)


]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyFractionByMeasure [

	self assert: ((1/3) * self tenPesos) = ((NullUnit new * self peso) with: (1/3)*10)


]

{ #category : #'test infinity' }
MeasureTest >> testMultiplyInfinity [

	self assert: self oneMeter * Infinity = Infinity.
	self assert: Infinity * self oneMeter = Infinity.
	self assert: self oneMeter negated * Infinity = Infinity.
	self assert: Infinity * self oneMeter negated = Infinity
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyIntegerByMeasure [

	self assert: (3 * self tenPesos) = ((NullUnit new * self peso) with: 3*10)


]

{ #category : #'test minus infinity' }
MeasureTest >> testMultiplyMinusInfinity [

	self assert: self oneMeter * MinusInfinity = MinusInfinity.
	self assert: MinusInfinity * self oneMeter = MinusInfinity.
	self assert: self oneMeter negated * MinusInfinity = MinusInfinity.
	self assert: MinusInfinity * self oneMeter negated = MinusInfinity
]

{ #category : #'test multiplication' }
MeasureTest >> testMultiplyScaledDecimalByMeasure [

	self assert: (23.76s2 * self tenPesos) = ((NullUnit new * self peso) with: 23.76s2*10)


]

{ #category : #'test subtract' }
MeasureTest >> testNegated [

	self assert: self tenPesos negated negated = self tenPesos description: 'Measure Negated'.
	self assert: self minusTenPesos = self tenPesos negated description: 'Measure negated'.
	self assert: self zeroPesos negated = self zeroPesos description: 'Measure negated'
]

{ #category : #test }
MeasureTest >> testNegative [

	self assert: (self onePeso - self tenPesos) negative.
	self deny: (self onePeso - self tenPesos) negated negative
]

{ #category : #'test comparing' }
MeasureTest >> testNotEqual [

	self deny: self oneMeter = 'hello'.
	self deny: 'hello' = self oneMeter.
	self deny: self oneMeter = Object new.
	self deny: Object new = self oneMeter
]

{ #category : #'test magnitude protocol' }
MeasureTest >> testNotInclusiveBetweenAnd [

	self assert: (self tenMeters notInclusiveBetween: self oneMeter and: (Measure amount: 11 unit: self meter)).
	self assert: (self tenMeters notInclusiveBetween: self oneMeter and: self tenMeters).
	self deny: (self tenMeters notInclusiveBetween: self tenMeters and: (Measure amount: 11 unit: self meter)).


]

{ #category : #'test magnitude protocol' }
MeasureTest >> testNotInclusiveBetweenAndNotInclusive [

	self assert: (self tenMeters notInclusiveBetween: self oneMeter andNotInclusive: (Measure amount: 11 unit: self meter)).
	self deny: (self tenMeters notInclusiveBetween: self tenMeters andNotInclusive: (Measure amount: 11 unit: self meter)).
	self deny: (self tenMeters notInclusiveBetween: self oneMeter andNotInclusive: self tenMeters).


]

{ #category : #'test accessing' }
MeasureTest >> testNumerator [

	self assert: (self tenMeters ) numerator = self tenMeters.
	self assert: (self tenMeters * self tenMeters ) numerator = (self tenMeters * self tenMeters)

	

	

]

{ #category : #test }
MeasureTest >> testPositive [

	self assert: self tenPesos positive.
	self deny: self tenPesos negated positive.
]

{ #category : #'test printing' }
MeasureTest >> testPrintingForMany [

	self assert: self tenPesos printString = '10 pesos' description: 'Printing for many with correct creation'.
	self assert: self tenDollars printString = '10 dollars' description: 'Printing for many with invalid creation'	
]

{ #category : #'test printing' }
MeasureTest >> testPrintingForOne [

	self assert: self onePeso printString = '1 peso' description: 'Printing for one with correct creation'.
	self assert: self oneDollar printString = '1 dollar' description: 'Printing for one with invalid creation'
	
	
]

{ #category : #test }
MeasureTest >> testRemFrom [

	self
		should: [self oneCelsius remFrom: 0]
		raise: InvalidBinaryOperationException
		withExceptionDo: [ :anException |
			self
				assert: anException description notNil;
				assert: anException operationName = 'rest';
				assert: anException leftOperand = 0;
				assert: anException rightOperand = self oneCelsius]
]

{ #category : #'test integer remainder' }
MeasureTest >> testRemainderByMeasure [

	self assert: (self tenMeters \\ self tenMeters) = (self meter with: 10\\10).
	self assert: (self oneMeter \\ self tenMeters) = (self meter with: 1\\10).
	self assert: (self tenMeters \\ self oneSecond) = (self meter with: 10\\1).
	self assert: (self tenMeters \\ self threeSeconds) = (self meter with: 10\\3).

	

]

{ #category : #'test integer remainder' }
MeasureTest >> testRemainderByZero [

	self should: [ self tenPesos \\ 0 ] raise: Exception.

]

{ #category : #'test integer remainder' }
MeasureTest >> testRemainderFloatByMeasure [

	self assert: (10.5 \\ self tenPesos) = 0.5

]

{ #category : #'test infinity' }
MeasureTest >> testRemainderInfinity [

	self
		should: [self oneMeter \\ Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity'].
	self
		should: [Infinity \\ self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and 1 meter'].
	self
		should: [self oneMeter negated \\ Infinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Infinity'].
	self
		should: [Infinity \\ self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Infinity and -1 meter']
]

{ #category : #'test integer remainder' }
MeasureTest >> testRemainderIntegerByMeasure [

	self assert: 1 \\ self tenPesos = 1


]

{ #category : #'test integer remainder' }
MeasureTest >> testRemainderMeasureBagByMeasure [

	self should: [(self tenPesos + self tenDollars) \\ self tenPesos ] raise: InvalidOperationException


]

{ #category : #'test minus infinity' }
MeasureTest >> testRemainderMinusInfinity [

	self
		should: [self oneMeter \\ MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity'].
	self
		should: [MinusInfinity \\ self oneMeter]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and 1 meter'].
	self
		should: [self oneMeter negated \\ MinusInfinity]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Multiplication operation is indeterminate between 0 and Minus Infinity'].
	self
		should: [MinusInfinity \\ self oneMeter negated]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Remainder operation is indeterminate between Minus Infinity and -1 meter']
]

{ #category : #'test integer remainder' }
MeasureTest >> testRemainderOfBaseUnit [

	self assert: (self tenMeters \\ 10) amount = 0.
	self assert: (self tenMeters \\ 10) unit = self meter.
	
	self assert: (self tenMeters \\ 3) amount = 1.

]

{ #category : #'test integer remainder' }
MeasureTest >> testRemainderOfDerivedUnit [

	self assert: (self tenKilometers \\ 9 ) amount = 1.
	self assert: (self tenKilometers \\ 9 ) unit = self kilometer.
	

]

{ #category : #'test integer remainder' }
MeasureTest >> testRemainderScaledDecimalByMeasure [

	self assert: (23.5s2 \\ self tenPesos) = 3.5s2


]

{ #category : #test }
MeasureTest >> testRoundTo [

	self assert: ((Measure amount: 1 unit: self celsius) roundTo: 1) = (self celsius with: 1).
	self assert: ((Measure amount: 1 unit: self celsius) roundTo: 0.1) = (self celsius with: 1).
	self assert: ((Measure amount: 1.4 unit: self celsius) roundTo: 1) = (self celsius with: 1).
	self assert: ((Measure amount: 1.5 unit: self celsius) roundTo: 1) = (self celsius with: 2).
	self assert: ((Measure amount: 1.09 unit: self celsius) roundTo: 1) = (self celsius with: 1).
	self assert: ((Measure amount: -1 unit: self celsius) roundTo: 1) = (self celsius with: -1).
	self assert: ((Measure amount: -1.1 unit: self celsius) roundTo: 1) = (self celsius with: -1)
]

{ #category : #'test testing' }
MeasureTest >> testSameDomainAs [

	self assert: (self oneMeter sameDomainAs: self oneMeter).
	self assert: (self oneMeter sameDomainAs: self oneKilometer).
	self assert: (self oneKilometer sameDomainAs: self oneMeter).
	self deny: (self oneMeter sameDomainAs: self onePeso).
	self deny: (self onePeso sameDomainAs: self oneMeter).
]

{ #category : #'test add' }
MeasureTest >> testSimplificationsAddingWithZero [

	self
		assert: (self oneMeter + 0) = self oneMeter;
		assert: (self oneMeter + 0) unit = self oneMeter unit
]

{ #category : #'test division' }
MeasureTest >> testSimplificationsDividingFromZero [

	self assert: (0 / self oneMeter) = 0
]

{ #category : #'test subtract' }
MeasureTest >> testSubtractAssociativity [

	self assert: (self tenMeters - self oneMeter - self oneMeter) amount = ((self tenMeters - self oneMeter) - self oneMeter) amount.
	self assert: ((self tenMeters - self oneMeter) - self oneMeter) amount = (self tenMeters - (self oneMeter + self oneMeter)) amount

	
]

{ #category : #'test subtract' }
MeasureTest >> testSubtractBaseUnit [

	self assert: (self tenMeters - self oneMeter) amount = 9.
	self assert: (self tenMeters - self oneMeter) unit = self meter
	
]

{ #category : #'test subtract' }
MeasureTest >> testSubtractDerivedUnit [

	self assert: (self oneKilometer - self oneMeter) amount = 999.
	self assert: (self oneKilometer - self oneMeter) unit = self meter.

	

	
]

{ #category : #'test subtract' }
MeasureTest >> testSubtractDividedMeasure [

	self assert: ((self tenMeters - (self tenMeters / self fivePesos)) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters - (self tenMeters / self fivePesos)) atSameBaseUnitAs: (self meter / self peso)) = (self tenMeters negated / self fivePesos)

]

{ #category : #'test subtract' }
MeasureTest >> testSubtractFloatWithMeasure [

	self assert: ((10.01 - self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((10.01 - self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.01.	
	

]

{ #category : #'test subtract' }
MeasureTest >> testSubtractFractionWithMeasure [

	self assert: ((1/3 - self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((1/3 - self tenMeters) atSameBaseUnitAs: NullUnit new) = (1/3).	
]

{ #category : #'test infinity' }
MeasureTest >> testSubtractInfinity [

	self assert: self oneMeter - Infinity = MinusInfinity.
	self assert: Infinity - self oneMeter = Infinity.
	self assert: self oneMeter negated - Infinity = MinusInfinity.
	self assert: Infinity - self oneMeter negated = Infinity
]

{ #category : #'test subtract' }
MeasureTest >> testSubtractIntegerWithMeasure [

	self assert: ((10 - self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((10 - self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.	
]

{ #category : #'test minus infinity' }
MeasureTest >> testSubtractMinusInfinity [

	self assert: self oneMeter - MinusInfinity = Infinity.
	self assert: MinusInfinity - self oneMeter = MinusInfinity.
	self assert: self oneMeter negated - MinusInfinity = Infinity.
	self assert: MinusInfinity - self oneMeter negated = MinusInfinity
]

{ #category : #'test subtract' }
MeasureTest >> testSubtractMultipliedMeasure [

	self assert: ((self tenMeters - (self tenMeters * self fivePesos)) atSameBaseUnitAs: self meter) = self tenMeters.
	self assert: ((self tenMeters - (self tenMeters * self fivePesos)) atSameBaseUnitAs: (self meter * self peso)) = (self tenMeters negated * self fivePesos)
]

{ #category : #'test subtract' }
MeasureTest >> testSubtractScaledDecimalWithMeasure [

	self assert: ((10.01s2 - self tenMeters) atSameBaseUnitAs: self meter) = self tenMeters negated.
	self assert: ((10.01s2 - self tenMeters) atSameBaseUnitAs: NullUnit new) = 10.01s2
]

{ #category : #'test interval related protocol' }
MeasureTest >> testTo [

	self assert: (self oneMeter to: self tenMeters) from = self oneMeter.
	self assert: (self oneMeter to: self tenMeters) to = self tenMeters.
	self assert: (self oneMeter to: self tenMeters) by = self oneMeter.	

	self assert: (self tenMeters to: self oneKilometer) by = self oneMeter.
	self assert: (self oneCentimeter to: self oneKilometer) by = self oneCentimeter
]

{ #category : #'test interval related protocol' }
MeasureTest >> testToAt [

	| coll |

	coll := self tenMeters to: (self tenMeters * 2).
	1 to: coll size do: [ :index | self assert: (coll at: index) amount = (9 + index) ]
]

{ #category : #'test interval related protocol' }
MeasureTest >> testToAtByNegative [

	| coll |
	
	coll := (self tenMeters * 2) to: self tenMeters by: self oneMeter negated.
	
	1 to: coll size do: [ :index | self assert: (coll at: index) amount = (21 - index) ]	
]

{ #category : #'test interval related protocol' }
MeasureTest >> testToBy [

	self assert: (self oneMeter to: self tenMeters by: self oneCentimeter ) from = self oneMeter.
	self assert: (self oneMeter to: self tenMeters by: self oneCentimeter ) to = self tenMeters.
	self assert: (self oneMeter to: self tenMeters by: self oneCentimeter ) by = self oneCentimeter
]

{ #category : #'test interval related protocol' }
MeasureTest >> testToByDo [

	| value |
	
	value := 1.
	(self oneMeter to: self tenMeters by: self oneMeter) do: [ :aMeasure |
		self assert: value = aMeasure amount.
		value := value + 1 ]

]

{ #category : #'test interval related protocol' }
MeasureTest >> testToCollect [

	| coll |
	
	coll := (self oneMeter to: self tenMeters) collect: [ :aMeasure | aMeasure amount ].
	coll inject: 1 into: [ :value :amount | self assert: value = amount. value + 1 ]
]

{ #category : #'test interval related protocol' }
MeasureTest >> testToFirst [


	self assert: (self oneMeter to: self tenMeters) first = self oneMeter.
	self assert: (self tenMeters to: self oneMeter by: self oneMeter negated) first = self tenMeters
]

{ #category : #'test interval related protocol' }
MeasureTest >> testToLast [


	self assert: (self oneMeter to: self tenMeters) last = self tenMeters.
	self assert: (self tenMeters to: self oneMeter by: self oneMeter negated) last = self oneMeter
]

{ #category : #'test interval related protocol' }
MeasureTest >> testToSize [

	self assert: (self oneCentimeter to: self oneKilometer) size = (100*1000)
	
]

{ #category : #'test truncated' }
MeasureTest >> testTruncated [

	self assert: (self meter with: 1.05) truncated = (self meter with: 1).
	self assert: (self centimeter with: 1.05) truncated = (self centimeter with: 1).
	self assert: ((self peso * self meter ) with: 1.05) truncated = ((self peso * self meter) with: 1).
	self assert: ((self peso / self meter ) with: 1.05) truncated = ((self peso / self meter) with: 1)	
]

{ #category : #'test accessing' }
MeasureTest >> testUnit [

	self assert: self onePeso unit = self peso.
	self assert: self oneMeter unit = self meter
]

{ #category : #test }
MeasureTest >> testUnitNameOf [

	self
		assert: (self oneDollar unitNameOf: self dollar) = self dollar nameForOne;
		assert: (self tenDollars unitNameOf: self dollar) = self dollar nameForMany;
		assert: (self zeroDollars unitNameOf: self dollar) = self dollar nameForMany;
		assert: (self oneDollar negated unitNameOf: self dollar) = self dollar nameForOne
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> thirtyPesos [

	^Measure amount: 30 unit: self peso
]

{ #category : #'accessing distance measurements' }
MeasureTest >> thousandMillimeters [
	
	^Measure amount: 1000 unit: self millimeter
]

{ #category : #'time measurements' }
MeasureTest >> threeSeconds [

	^Measure amount: 3 unit: self second
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> twentyDollars [

	^Measure amount: 20 unit: self dollar
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> twentyPesos [
	
	^Measure amount: 20 unit: self peso
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> twoDollars [

	^Measure amount: 2 unit: self dollar
]

{ #category : #'time measurements' }
MeasureTest >> twoSecond [
	
	^Measure amount: 2 unit: self second
]

{ #category : #'accessing temperature measurements' }
MeasureTest >> zeroCelsius [

	^Measure amount: 0 unit: self celsius
]

{ #category : #'accessing distance measurements' }
MeasureTest >> zeroCentimeters [

	^Measure amount: 0 unit: self centimeter
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> zeroDollars [
	
	^Measure amount: 0 unit: self dollar
]

{ #category : #'accessing temperature measurements' }
MeasureTest >> zeroFahrenheit [

	^Measure amount: 0 unit: self fahrenheit
]

{ #category : #'accessing distance measurements' }
MeasureTest >> zeroMeters [

	^Measure amount: 0 unit: self meter
]

{ #category : #'accessing monetary measurements' }
MeasureTest >> zeroPesos [

	^Measure amount: 0 unit: self peso
]

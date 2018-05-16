Class {
	#name : #MultipliedUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'meter',
		'second',
		'meterBySecond'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #initialization }
MultipliedUnitTest >> setUp [

	meter := BaseUnit named: 'meter' sign: 'm'.
	second := BaseUnit named: 'second' sign: 's'.
	meterBySecond := meter * second
]

{ #category : #'test accessing' }
MultipliedUnitTest >> testBaseUnit [

	self assert: (meterBySecond baseUnit) = meterBySecond
]

{ #category : #'test converting' }
MultipliedUnitTest >> testConvertAmountToBaseUnit [

	self assert: (meterBySecond convertAmountToBaseUnit: 0) = 0.
	self assert: (meterBySecond convertAmountToBaseUnit: 10) = 10
]

{ #category : #'test converting' }
MultipliedUnitTest >> testConvertToBaseUnit [

	| measure |
	
	measure := Measure amount: 10 unit: meterBySecond.
	self assert: (meterBySecond convertToBaseUnit: measure) == measure.
	
	

]

{ #category : #'test accessing' }
MultipliedUnitTest >> testDenominator [

	self assert: meterBySecond denominator = NullUnit new
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testDivideByDividedUnit [

	|  kelvin liter |
	
	kelvin := BaseUnit named: 'kelvin'.	
	liter := BaseUnit named: 'liter'.	
	
	self assert: (meterBySecond / (meter / second)) = (second * second).
	self assert: (meterBySecond / (second / meter)) = (meter * meter).
	self assert: (meterBySecond / (kelvin / liter)) numerator = (meter * second * liter).
	self assert: (meterBySecond / (kelvin / liter)) denominator = kelvin
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testDivideByInfinity [

	self assert: meterBySecond / Infinity = (meterBySecond with: 0).
	self
		should: [Infinity / meterBySecond]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and meter.second'].
	self assert: (meterBySecond / Infinity) numerator = (meterBySecond with: 0).
	self assert: (meterBySecond / Infinity) denominator = 1
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testDivideByMinusInfinity [

	self assert: meterBySecond / MinusInfinity = (meterBySecond with: 0).
	self
		should: [MinusInfinity / meterBySecond]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and meter.second'].
	self assert: (meterBySecond / MinusInfinity) numerator = (meterBySecond with: 0).
	self assert: (meterBySecond / MinusInfinity) denominator = 1
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testDivideByNumber [

	self assert: (meterBySecond / 5) = (meterBySecond with: 1/5).
	self assert: (meterBySecond / 5) numerator = (meterBySecond with: 1).
	self assert: (meterBySecond / 5) denominator = 5.
	
	self assert: (meterBySecond / 5.5) = (meterBySecond with: 1/5.5).
	self assert: (meterBySecond / 5.5) numerator = (meterBySecond with: 1/5.5).
	self assert: (meterBySecond / 5.5) denominator = 1
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testDivideBySimpleUnit [

	| kelvin |
	
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: (meterBySecond / second) = meter.
	self assert: (meterBySecond / meter) = second.
	self assert: (meterBySecond / kelvin) numerator = meterBySecond.
	self assert: (meterBySecond / kelvin) denominator = kelvin
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testDividedByMultipliedUnit [

	|  kelvin liter |
	
	kelvin := BaseUnit named: 'kelvin'.	
	liter := BaseUnit named: 'liter'.	
	
	self assert: (meterBySecond / meterBySecond) = NullUnit new.
	self assert: (meterBySecond / (kelvin * liter)) numerator = meterBySecond.
	self assert: (meterBySecond / (kelvin * liter)) denominator = (kelvin * liter)
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testDividedByNullUnit [

	self assert: (meterBySecond / NullUnit new) = meterBySecond.

]

{ #category : #'test comparing' }
MultipliedUnitTest >> testEqualDividedUnit [

	self deny: meterBySecond = (meter / second)
]

{ #category : #'test comparing' }
MultipliedUnitTest >> testEqualMultipliedUnit [

	| kelvin liter |
	
	kelvin := BaseUnit named: 'kelvin'.
	liter :=  BaseUnit named: 'liter'.
	
	self assert: meterBySecond = meterBySecond.
	self assert: meterBySecond = (second * meter).

	self deny: meterBySecond = (meter * kelvin).
	self deny: meterBySecond = (meter * second * kelvin).
	self deny: meterBySecond = (kelvin * liter)
]

{ #category : #'test comparing' }
MultipliedUnitTest >> testEqualNullUnit [

	self deny: meterBySecond = NullUnit new
]

{ #category : #'test comparing' }
MultipliedUnitTest >> testEqualSimpleUnit [

	| kelvin |
	
	kelvin := BaseUnit named: 'kelvin'.
	self deny: meterBySecond = kelvin
]

{ #category : #'test measurement creation' }
MultipliedUnitTest >> testMeasureCreation [

	self assert: (meterBySecond with: 10) = (Measure amount: 10 unit: meterBySecond)
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByDividedUnit [

	|  kelvin liter |
	
	kelvin := BaseUnit named: 'kelvin'.	
	liter := BaseUnit named: 'liter'.	
	
	self assert: (meterBySecond * (meter / second)) = (meter * meter).
	self assert: (meterBySecond * (second / meter)) = (second * second).
	self assert: (meterBySecond * (kelvin / liter)) numerator = (meter * second * kelvin).
	self assert: (meterBySecond * (kelvin / liter)) denominator = liter
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByInfinity [

	self assert: meterBySecond * Infinity = (meterBySecond with: Infinity).
	self assert: Infinity * meterBySecond = (meterBySecond with: Infinity).
	self assert: (meterBySecond * Infinity) numerator = (meterBySecond with: Infinity).
	self assert: (meterBySecond * Infinity) denominator = 1
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByMinusInfinity [

	self assert: meterBySecond * MinusInfinity = (meterBySecond with: MinusInfinity).
	self assert: MinusInfinity * meterBySecond = (meterBySecond with: MinusInfinity).
	self assert: (meterBySecond * MinusInfinity) numerator = (meterBySecond with: MinusInfinity).
	self assert: (meterBySecond * MinusInfinity) denominator = 1
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByMultipliedUnit [

	self assert: (meterBySecond * meterBySecond) factorsSize = 4.
	self assert: ((meterBySecond * meterBySecond) factors at: 1) = meter.
	self assert: ((meterBySecond * meterBySecond) factors at: 2) = second.
	self assert: ((meterBySecond * meterBySecond) factors at: 3) = meter.
	self assert: ((meterBySecond * meterBySecond) factors at: 4) = second
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByNullUnit [

	self assert: (meterBySecond * NullUnit new) = meterBySecond.

]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyByNumber [

	self assert: (meterBySecond * 5) = (meterBySecond with: 5).
	self assert: (meterBySecond * 5) numerator = (meterBySecond with: 5).
	self assert: (meterBySecond * 5) denominator = 1.
	
	self assert: (meterBySecond * 5.5) = (meterBySecond with: 5.5).
	self assert: (meterBySecond * 5.5) numerator = (meterBySecond with: 5.5).
	self assert: (meterBySecond * 5.5) denominator = 1
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testMultiplyBySimpleUnit [

	self assert: (meterBySecond * second) factorsSize = 3.
	self assert: ((meterBySecond * second) factors at: 1) = meter.
	self assert: ((meterBySecond * second) factors at: 2) = second.
	self assert: ((meterBySecond * second) factors at: 3) = second
]

{ #category : #'test accessing' }
MultipliedUnitTest >> testName [

	self assert: meterBySecond name = 'meter.second'
]

{ #category : #'test accessing' }
MultipliedUnitTest >> testNameForMany [

	self assert: meterBySecond nameForMany = 'meters.seconds'
]

{ #category : #'test accessing' }
MultipliedUnitTest >> testNameForOne [

	self assert: meterBySecond name = 'meter.second'
]

{ #category : #'test accessing' }
MultipliedUnitTest >> testNothingAmount [

	self assert: meterBySecond nothingAmount = 0.

]

{ #category : #'test accessing' }
MultipliedUnitTest >> testNullMeasure [

	self assert: meterBySecond nullMeasure amount = 0.
	self assert: meterBySecond nullMeasure unit = meterBySecond.

]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testNumberDividedByUnit [

	self assert: (5 / meterBySecond) = (5 / (meterBySecond with: 1)).
	self assert: (5 / meterBySecond) numerator = 5.
	self assert: (5 / meterBySecond) denominator = (meterBySecond with: 1).
	
	self assert: (5.5 / meterBySecond) = (5.5 / (meterBySecond with: 1)).
	self assert: (5.5 / meterBySecond) numerator = 5.5.
	self assert: (5.5 / meterBySecond) denominator = (meterBySecond with: 1)
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testNumberDividedByUnitTwice [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: (5 / kelvin / meterBySecond) = (5 / (kelvin * meterBySecond with: 1)).
	self assert: (5 / kelvin / meterBySecond) numerator = 5.
	self assert: (5 / kelvin / meterBySecond) denominator = (kelvin * meterBySecond with: 1).
	
	self assert: (5.5 / kelvin / meterBySecond) = (5.5 / (kelvin * meterBySecond with: 1)).
	self assert: (5.5 / kelvin / meterBySecond) numerator = 5.5.
	self assert: (5.5 / kelvin / meterBySecond) denominator = (kelvin * meterBySecond with: 1)
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testNumberMultipliedByUnit [

	self assert: (5 * meterBySecond) = (meterBySecond with: 5).
	self assert: (5 * meterBySecond) numerator = (meterBySecond with: 5).
	self assert: (5 * meterBySecond) denominator = 1.
	
	self assert: (5.5 * meterBySecond) = (meterBySecond with: 5.5).
	self assert: (5.5 * meterBySecond) numerator = (meterBySecond with: 5.5).
	self assert: (5.5 * meterBySecond) denominator = 1
]

{ #category : #'test arithmetic operations' }
MultipliedUnitTest >> testNumberMultipliedByUnitTwice [

	| kelvin |
	kelvin := BaseUnit named: 'kelvin'.

	self assert: (5 * kelvin * meterBySecond) = (kelvin * meterBySecond with: 5).
	self assert: (5 * kelvin * meterBySecond) numerator = (kelvin * meterBySecond with: 5).
	self assert: (5 * kelvin * meterBySecond) denominator = 1.
	
	self assert: (5.5 * kelvin * meterBySecond) = (kelvin * meterBySecond with: 5.5).
	self assert: (5.5 * kelvin * meterBySecond) numerator = (kelvin * meterBySecond with: 5.5).
	self assert: (5.5 * kelvin * meterBySecond) denominator = 1
]

{ #category : #'test accessing' }
MultipliedUnitTest >> testNumerator [

	self assert: meterBySecond numerator = meterBySecond
]

{ #category : #'test accessing' }
MultipliedUnitTest >> testReciprocal [

	self assert: meterBySecond reciprocal = (NullUnit new / meterBySecond)
]

{ #category : #'test querying' }
MultipliedUnitTest >> testSameDomainAsDividedUnit [

	self deny: (meterBySecond sameDomainAs: (meter / second))	
	
]

{ #category : #'test querying' }
MultipliedUnitTest >> testSameDomainAsMultipliedUnit [

	| liter |

	liter := BaseUnit named: 'liter'.
	
	self assert: (meterBySecond sameDomainAs: meterBySecond).
	self deny: (meterBySecond sameDomainAs: (meter * liter)).
	self deny: (meterBySecond sameDomainAs: (liter * liter))
	
	
]

{ #category : #'test querying' }
MultipliedUnitTest >> testSameDomainAsNullUnit [

	self deny: (meterBySecond sameDomainAs: NullUnit new)
	
	
]

{ #category : #'test querying' }
MultipliedUnitTest >> testSameDomainAsSameSimpleUnit [

	| unit |
	
	unit := BaseUnit named: 'peso'.
	self deny: (meterBySecond sameDomainAs: unit).
	
	
	

]

{ #category : #'test accessing' }
MultipliedUnitTest >> testSign [

	self assert: meterBySecond sign = 'm.s'
]

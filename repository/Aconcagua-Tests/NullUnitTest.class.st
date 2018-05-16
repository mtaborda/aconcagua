Class {
	#name : #NullUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'nullUnit'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #initialization }
NullUnitTest >> setUp [

	nullUnit := NullUnit new
]

{ #category : #'test accessing' }
NullUnitTest >> testBaseUnit [

	self assert: (nullUnit baseUnit) = nullUnit

]

{ #category : #'test converting' }
NullUnitTest >> testConvertAmountToBaseUnit [

	self assert: (nullUnit convertAmountToBaseUnit: 0) = 0.
	self assert: (nullUnit convertAmountToBaseUnit: 10) = 0
]

{ #category : #'test converting' }
NullUnitTest >> testConvertToBaseUnit [

	self assert: (nullUnit convertToBaseUnit: 0) == 0
]

{ #category : #'test accessing' }
NullUnitTest >> testDenominator [

	self assert: nullUnit denominator = nullUnit
]

{ #category : #'test arithmetic operations' }
NullUnitTest >> testDivideByDividedUnit [

	| meter hour |
	
	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self assert: (nullUnit / (meter / hour)) numerator = hour.
	self assert: (nullUnit / (meter / hour)) denominator = meter
]

{ #category : #'test arithmetic operations' }
NullUnitTest >> testDivideByMultipliedUnit [

	| meter |
	
	meter := BaseUnit named: 'meter'.
	self assert: (nullUnit / (meter * meter)) numerator = nullUnit.
	self assert: (nullUnit / (meter * meter)) denominator = (meter*meter)
]

{ #category : #'test arithmetic operations' }
NullUnitTest >> testDivideByNullUnit [

	self assert: (nullUnit / nullUnit) = nullUnit
]

{ #category : #'test arithmetic operations' }
NullUnitTest >> testDivideBySimpleUnit [

	| meter |
	
	meter := BaseUnit named: 'meter'.
	self assert: (nullUnit / meter) numerator = nullUnit.
	self assert: (nullUnit / meter) denominator = meter
]

{ #category : #'test comparing' }
NullUnitTest >> testEqualBaseUnit [

	| meter |

	meter := BaseUnit named: 'meter'.
	self deny: nullUnit = meter
]

{ #category : #'test comparing' }
NullUnitTest >> testEqualDerivedUnit [

	| meter centimeter |

	meter := BaseUnit named: 'meter'.
	centimeter := ProportionalDerivedUnit baseUnit: meter conversionFactor: 1/100 named: 'centimeter'.
	
	self deny: nullUnit = centimeter
]

{ #category : #'test comparing' }
NullUnitTest >> testEqualDividedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self deny: nullUnit = (meter / hour)
]

{ #category : #'test comparing' }
NullUnitTest >> testEqualMultipliedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self deny: nullUnit = (meter * hour)
]

{ #category : #'test comparing' }
NullUnitTest >> testEqualNullUnit [

	self assert: nullUnit = nullUnit.
	self assert: NullUnit new = NullUnit new
]

{ #category : #'test measurement creation' }
NullUnitTest >> testMeasureCreation [

	self assert: (nullUnit with: 10) = 10
]

{ #category : #'test arithmetic operations' }
NullUnitTest >> testMultiplyByDividedUnit [

	| meter second |
	
	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	
	self assert: (nullUnit * (meter / second )) numerator = meter.
	self assert: (nullUnit * (meter / second )) denominator = second
]

{ #category : #'test arithmetic operations' }
NullUnitTest >> testMultiplyByMultipliedUnit [

	| second kelvin |

	second := BaseUnit named: 'second'.
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: (nullUnit * (second * kelvin)) factorsSize = 2.
	self assert: ((nullUnit * (second * kelvin)) factors includes: second).
	self assert: ((nullUnit * (second * kelvin)) factors includes: kelvin)
]

{ #category : #'test arithmetic operations' }
NullUnitTest >> testMultiplyByNullUnit [

	self assert: (nullUnit * nullUnit) = nullUnit
]

{ #category : #'test arithmetic operations' }
NullUnitTest >> testMultiplyBySimpleUnit [

	| meter |
	
	meter := BaseUnit named: 'meter'.
	
	self assert: (nullUnit * meter) = meter
]

{ #category : #'test accessing' }
NullUnitTest >> testName [

	self assert: nullUnit name = ''
]

{ #category : #'test accessing' }
NullUnitTest >> testNameForMany [

	self assert: nullUnit nameForMany = ''
]

{ #category : #'test accessing' }
NullUnitTest >> testNameForOne [

	self assert: nullUnit nameForOne = ''
]

{ #category : #'test accessing' }
NullUnitTest >> testNumerator [

	self assert: nullUnit numerator = nullUnit
]

{ #category : #'test accessing' }
NullUnitTest >> testReciprocal [

	self assert: nullUnit reciprocal = nullUnit
]

{ #category : #'test querying' }
NullUnitTest >> testSameDomainAsBaseUnit [

	| metro |
	
	metro := BaseUnit named: 'metro'.
	self deny: (nullUnit sameDomainAs: metro)
]

{ #category : #'test querying' }
NullUnitTest >> testSameDomainAsDerivedUnit [

	| meter centimeter |

	meter := BaseUnit named: 'meter'.
	centimeter := ProportionalDerivedUnit baseUnit: meter conversionFactor: 1/100 named: 'centimeter'.
	
	self deny: (nullUnit sameDomainAs: centimeter)
]

{ #category : #'test querying' }
NullUnitTest >> testSameDomainAsDividedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	
	self deny: (nullUnit sameDomainAs: (meter / hour))
]

{ #category : #'test querying' }
NullUnitTest >> testSameDomainAsMultipliedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	
	self deny: (nullUnit sameDomainAs: (meter * hour))
]

{ #category : #'test querying' }
NullUnitTest >> testSameDomainAsNullUnit [

	self assert: (nullUnit sameDomainAs: nullUnit)
	
	
]

{ #category : #'test accessing' }
NullUnitTest >> testSign [

	self assert: nullUnit sign = NullUnit defaultSign
]

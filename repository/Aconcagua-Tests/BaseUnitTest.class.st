Class {
	#name : #BaseUnitTest,
	#superclass : #TestCase,
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #'test accessing' }
BaseUnitTest >> testBaseUnit [

	| unit |
	
	unit := BaseUnit named: 'peso'.
	self assert: (unit baseUnit) = unit
]

{ #category : #'test converting' }
BaseUnitTest >> testConvertAmountToBaseUnit [

	| unit |
	
	unit := BaseUnit named: 'peso'.
	self assert: (unit convertAmountToBaseUnit: 0) = 0.
	self assert: (unit convertAmountToBaseUnit: 10) = 10
]

{ #category : #'test converting' }
BaseUnitTest >> testConvertToBaseUnit [

	| unit measure |
	
	unit := BaseUnit named: 'peso'.
	measure := Measure amount: 10 unit: unit.
	self assert: (unit convertToBaseUnit: measure) == measure
]

{ #category : #'test accessing' }
BaseUnitTest >> testDenominator [

	| unit |

	unit := BaseUnit nameForOne: 'peso' nameForMany: 'pepe'.

	self assert: unit denominator = NullUnit new
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByDifferentBaseUnit [

	| numerator denominator |
	
	numerator := BaseUnit named: 'meter'.
	denominator := BaseUnit named: 'second'.
	self assert: (numerator / denominator) numerator = numerator.
	self assert: (numerator / denominator) denominator = denominator
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByDifferentDomainDerivedUnit [

	| numerator denominator hour |
	
	numerator := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	denominator := ProportionalDerivedUnit baseUnit: hour conversionFactor: 1/60 named: 'minutes'.
	
	self assert: (numerator / denominator) numerator = numerator.
	self assert: (numerator / denominator) denominator = denominator
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByDivideUnitSameBaseUnitNumerator [

	| numerator denominator hour |
	
	numerator := BaseUnit named: 'meter'.
	denominator := BaseUnit named: 'hour'.
	
	self assert: (numerator / (numerator / denominator)) = denominator
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByDivideUnitSameDomainDerivedUnitNumerator [

	| meter hour centimeter |
	
	meter := BaseUnit named: 'meter'.
	centimeter := ProportionalDerivedUnit baseUnit: meter conversionFactor: 1/100 named: 'centimeter'.
	hour := BaseUnit named: 'hour'.
	
	self assert: (meter / (centimeter / hour)) numerator = (meter * hour).
	self assert: (meter / (centimeter / hour)) denominator = centimeter
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByInfinity [

	| kelvin |

	kelvin := BaseUnit named: 'kelvin'.
	self assert: kelvin / Infinity = (kelvin with: 1 / Infinity).
	self assert: (kelvin / Infinity) numerator = 0.
	self assert: (kelvin / Infinity) denominator = 1.
	self
		should: [Infinity / kelvin]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Infinity and kelvin']
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByMinusInfinity [

	| kelvin |

	kelvin := BaseUnit named: 'kelvin'.
	self assert: kelvin / MinusInfinity = (kelvin with: 1 / MinusInfinity).
	self assert: (kelvin / MinusInfinity) numerator = 0.
	self assert: (kelvin / MinusInfinity) denominator = 1.
	self
		should: [MinusInfinity / kelvin]
		raise: IndeterminateOperationException
		withExceptionDo: [:anException |
			self assert:
				anException description =
					'The Division operation is indeterminate between Minus Infinity and kelvin']
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByMultipliedUnit [

	| numerator denominator hour |
	
	numerator := BaseUnit named: 'meter'.
	denominator := BaseUnit named: 'hour'.
	
	self assert: (numerator / (numerator * denominator)) numerator = NullUnit new.
	self assert: (numerator / (numerator * denominator)) denominator = denominator.

	self assert: (numerator / (denominator * denominator)) numerator = numerator.
	self assert: (numerator / (denominator * denominator)) denominator = (denominator * denominator)

]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByNullUnit [

	| meter |
	
	meter := BaseUnit named: 'meter'.
	self assert: meter / NullUnit new = meter
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideByNumber [

	| kelvin |
	
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: kelvin / 5 = (kelvin with: 1/5).
	self assert: (kelvin / 5) numerator = (kelvin with: 1).
	self assert: (kelvin / 5) denominator = 5.
	
	self assert: kelvin / 5.5 = (kelvin with: 1/5.5).
	self assert: (kelvin / 5.5) numerator = (kelvin with: 1/5.5) numerator.
	self assert: (kelvin / 5.5) denominator = (kelvin with: 1/5.5) denominator
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideBySameBaseUnit [

	| numerator |
	
	numerator := BaseUnit named: 'peso'.
	self assert: numerator / numerator = NullUnit new
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testDivideBySameDomainDerivedUnit [

	| numerator denominator |
	
	numerator := BaseUnit named: 'meter'.
	denominator := ProportionalDerivedUnit baseUnit: numerator conversionFactor: 1/100 named: 'centimeter'.
	
	self assert: (numerator / denominator) numerator = numerator.
	self assert: (numerator / denominator) denominator = denominator.
	
]

{ #category : #'test comparing' }
BaseUnitTest >> testEqualDerivedSameBaseUnit [

	| meter centimeter |

	meter := BaseUnit named: 'meter'.
	centimeter := ProportionalDerivedUnit baseUnit: meter conversionFactor: 1/100 named: 'centimeter'.
	
	self deny: meter = centimeter
]

{ #category : #'test comparing' }
BaseUnitTest >> testEqualDifferentBaseUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self deny: meter = hour
]

{ #category : #'test comparing' }
BaseUnitTest >> testEqualDividedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self deny: meter = (meter / hour)
]

{ #category : #'test comparing' }
BaseUnitTest >> testEqualMultipliedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	self deny: meter = (meter * hour)
]

{ #category : #'test comparing' }
BaseUnitTest >> testEqualNullUnit [

	| meter |

	meter := BaseUnit named: 'meter'.
	self deny: meter = NullUnit new
]

{ #category : #'test comparing' }
BaseUnitTest >> testEqualSameBaseUnit [

	| meter |

	meter := BaseUnit named: 'meter'.
	self assert: meter = meter
]

{ #category : #'test measurement creation' }
BaseUnitTest >> testMeasureCreation [

	| meter |
	
	meter := BaseUnit named: 'meter'.
	self assert: (meter with: 10) = (Measure amount: 10 unit: meter)
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testMultiplyByDividedUnit [

	| meter second kelvin |
	
	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: (meter * (second / kelvin)) numerator = (meter * second).
	self assert: (meter * (second / kelvin)) denominator = kelvin
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testMultiplyByInfinity [

	| kelvin |

	kelvin := BaseUnit named: 'kelvin'.
	self assert: kelvin * Infinity = (kelvin with: Infinity).
	self assert: Infinity * kelvin = (kelvin with: Infinity).
	self assert: (kelvin * Infinity) numerator = (kelvin with: Infinity).
	self assert: (kelvin * Infinity) denominator = 1
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testMultiplyByMinusInfinity [

	| kelvin |

	kelvin := BaseUnit named: 'kelvin'.
	self assert: kelvin * MinusInfinity = (kelvin with: MinusInfinity).
	self assert: MinusInfinity * kelvin = (kelvin with: MinusInfinity).
	self assert: (kelvin * MinusInfinity) numerator = (kelvin with: MinusInfinity).
	self assert: (kelvin * MinusInfinity) denominator = 1
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testMultiplyByMultipliedUnit [

	| meter second kelvin |
	
	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: (meter * (second * kelvin)) factorsSize = 3.
	self assert: ((meter * (second * kelvin)) factors includes: meter).
	self assert: ((meter * (second * kelvin)) factors includes: second).
	self assert: ((meter * (second * kelvin)) factors includes: kelvin)
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testMultiplyByNullUnit [

	| meter |
	
	meter := BaseUnit named: 'meter'.

	self assert: (meter * NullUnit new) = meter.

]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testMultiplyByNumber [

	| kelvin |
	
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: kelvin * 5 = (kelvin with: 5).
	
	self assert: (kelvin * 5) numerator = (kelvin with: 5).
	self assert: (kelvin * 1) denominator = 1.
	
	self assert: kelvin * 5.5 = (kelvin with: 5.5).
	self assert: (kelvin * 5.5) numerator = (kelvin with: 5.5) numerator.
	self assert: (kelvin * 5.5) denominator = (kelvin with: 5.5) denominator
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testMultiplyBySimpleUnit [

	| meter second|
	
	meter := BaseUnit named: 'meter'.
	second := BaseUnit named: 'second'.
	
	self assert: (meter * second) factorsSize = 2.
	self assert: ((meter * second) factors includes: meter).
	self assert: ((meter * second) factors includes: second)
]

{ #category : #'test accessing' }
BaseUnitTest >> testName [

	self assert: (BaseUnit named: 'peso') name = 'peso'
]

{ #category : #'test accessing' }
BaseUnitTest >> testNameFor [

	| unit |

	unit := BaseUnit nameForOne: 'peso' nameForMany: 'pepe'.

	self
		assert: (unit nameFor: 0) = unit nameForMany;
		assert: (unit nameFor: 1) = unit nameForOne;
		assert: (unit nameFor: 2) = unit nameForMany;
		assert: (unit nameFor: 1.87) = unit nameForMany;
		assert: (unit nameFor: 0.11) = unit nameForMany
]

{ #category : #'test accessing' }
BaseUnitTest >> testNameForMany [

	self assert: (BaseUnit named: 'peso') nameForMany = 'pesos'.
	self assert: (BaseUnit named: 'peso' sign: '$') nameForMany = 'pesos'.
	self assert: (BaseUnit nameForOne: 'peso' nameForMany: 'pepe') nameForMany = 'pepe'.	
	self assert: (BaseUnit nameForOne: 'peso' nameForMany: 'pepe' sign: '$') nameForMany = 'pepe'.	
]

{ #category : #'test accessing' }
BaseUnitTest >> testNameForOne [

	| unit |
	
	unit := BaseUnit named: 'peso'.
	self assert: unit name = unit nameForOne.
]

{ #category : #'test accessing' }
BaseUnitTest >> testNameForUndefinedAmount [

	| baseUnit |

	baseUnit := BaseUnit nameForOne: 'peso' nameForMany: 'pesos'.
	self assert: baseUnit nameForUndefinedAmount = baseUnit nameForMany
]

{ #category : #'test accessing' }
BaseUnitTest >> testNothingAmount [

	self assert: (BaseUnit named: 'peso') nothingAmount = 0.

]

{ #category : #'test accessing' }
BaseUnitTest >> testNullMeasure [

	| unit |
	
	unit := BaseUnit named: 'peso'.
	self assert: unit nullMeasure amount = 0.
	self assert: unit nullMeasure unit = unit.

]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testNumberDividedByUnit [

	| kelvin |
	
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: (5 / kelvin) = (Measure amount: 5 unit: NullUnit new / kelvin).
	self assert: (5 / (kelvin with: 1)) = (Measure amount: 5 unit: NullUnit new / kelvin).
	self assert: (5 / kelvin) numerator = 5.
	self assert: (5 / kelvin) denominator = (kelvin with: 1).
	self assert: (5 / (kelvin with: 1)) numerator = 5.
	self assert: (5 / (kelvin with: 1)) denominator = (kelvin with: 1).
	
	self assert: (5.5 / kelvin) = (5.5 / (kelvin with: 1)).
	self assert: (5.5 / kelvin) numerator = 5.5.
	self assert: (5.5 / kelvin) denominator = (kelvin with: 1)
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testNumberDividedByUnitTwice [

	| kelvin meter |
	
	kelvin := BaseUnit named: 'kelvin'.
	meter := BaseUnit named: 'meter'.
	
	self assert: (5 / kelvin / meter) = (Measure amount: 5 unit: NullUnit new / (kelvin * meter)).
	self assert: (5 / kelvin / meter) numerator = 5.
	self assert: (5 / kelvin / meter) denominator = (kelvin * meter with: 1).
	
	self assert: (5.5 / kelvin / meter) = (5.5 / (kelvin * meter with: 1)).
	self assert: (5.5 / kelvin / meter ) numerator = 5.5.
	self assert: (5.5 / kelvin / meter) denominator = (kelvin * meter with: 1)
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testNumberMultipliedByUnit [

	| kelvin |
	
	kelvin := BaseUnit named: 'kelvin'.
	
	self assert: (5 * kelvin) = (kelvin with: 5).
	self assert: (5 * kelvin) numerator = (kelvin with: 5).
	self assert: (5 * kelvin) denominator = 1.
	self assert: (5 * (kelvin with: 1)) numerator = (kelvin with: 5).
	self assert: (5 * (kelvin with: 1)) denominator = 1.
	
	self assert: 5.5 * kelvin = (kelvin with: 5.5).
	self assert: (5.5 * kelvin) numerator = (kelvin with: 5.5) numerator.
	self assert: (5.5 * kelvin) denominator = (kelvin with: 5.5) denominator
]

{ #category : #'test arithmetic operations' }
BaseUnitTest >> testNumberMultipliedByUnitTwice [

	| kelvin meter |
	
	kelvin := BaseUnit named: 'kelvin'.
	meter := BaseUnit named: 'meter'.
	
	self assert: 5 * kelvin * meter = (kelvin * meter with: 5).
	self assert: (5 * kelvin * meter) numerator = (kelvin * meter with: 5).
	self assert: (5 * kelvin * meter) denominator = 1.
		
	self assert: 5.5 * kelvin * meter = (kelvin * meter with: 5.5).
	self assert: (5.5 * kelvin * meter) numerator = (kelvin * meter with: 5.5) numerator.
	self assert: (5.5 * kelvin * meter) denominator = (kelvin * meter with: 5.5) denominator
]

{ #category : #'test accessing' }
BaseUnitTest >> testNumerator [

	| unit |

	unit := BaseUnit nameForOne: 'peso' nameForMany: 'pepe'.

	self assert: unit numerator = unit
]

{ #category : #'test accessing' }
BaseUnitTest >> testReciprocal [

	| peso |
	peso := BaseUnit named: 'peso'.
	self assert: peso reciprocal = (NullUnit new / peso)
]

{ #category : #'test querying' }
BaseUnitTest >> testSameDomainAsDerivedUnit [

	| meter centimeter |

	meter := BaseUnit named: 'meter'.
	centimeter := ProportionalDerivedUnit baseUnit: meter conversionFactor: 1/100 named: 'centimeter'.
	
	self assert: (meter sameDomainAs: centimeter).	
	
	

]

{ #category : #'test querying' }
BaseUnitTest >> testSameDomainAsDerivedUnitOfOtherDomain [

	| meter hour minute|

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	minute := ProportionalDerivedUnit baseUnit: hour conversionFactor: 1/60 named: 'minute'.
	
	self deny: (meter sameDomainAs: minute).	
	
	
]

{ #category : #'test querying' }
BaseUnitTest >> testSameDomainAsDifferentBaseUnit [

	| unit metro |
	
	unit := BaseUnit named: 'peso'.
	metro := BaseUnit named: 'metro'.
	self deny: (unit sameDomainAs: metro)
	
	

]

{ #category : #'test querying' }
BaseUnitTest >> testSameDomainAsDividedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	
	self deny: (meter sameDomainAs: (meter / hour))
	
	
]

{ #category : #'test querying' }
BaseUnitTest >> testSameDomainAsMultipliedUnit [

	| meter hour |

	meter := BaseUnit named: 'meter'.
	hour := BaseUnit named: 'hour'.
	
	self deny: (meter sameDomainAs: (meter * hour))
	
	
]

{ #category : #'test querying' }
BaseUnitTest >> testSameDomainAsNullUnit [

	| meter |

	meter := BaseUnit named: 'meter'.
	self deny: (meter sameDomainAs: NullUnit new)
	
	
]

{ #category : #'test querying' }
BaseUnitTest >> testSameDomainAsSameBaseUnit [

	| unit |
	
	unit := BaseUnit named: 'peso'.
	self assert: (unit sameDomainAs: unit).
	
	
	

]

{ #category : #'test accessing' }
BaseUnitTest >> testSign [

	self assert: (BaseUnit named: 'peso') sign=BaseUnit defaultSign.
	self assert: (BaseUnit named: 'peso' sign: '$') sign = '$'.
	self assert: (BaseUnit nameForOne: 'peso' nameForMany: 'pepe' sign: '$') sign = '$'
]

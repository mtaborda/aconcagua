Class {
	#name : #SimpleUnit,
	#superclass : #UnitBehavior,
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #'mathematic operations' }
SimpleUnit >> divFrom: aNumber [

	^Measure amount: aNumber unit: NullUnit new / self
]

{ #category : #'mathematic operations' }
SimpleUnit >> divideByUnit: aUnit [

	^aUnit divideSimpleUnit: self
]

{ #category : #'mathematic operations - private' }
SimpleUnit >> divideDividedUnit: aDividedUnit [

	^DividedUnit simpleUnit: self dividedUnit: aDividedUnit
]

{ #category : #'mathematic operations - private' }
SimpleUnit >> divideMultipliedUnit: aMultipliedUnit [

	^DividedUnit simpleUnit: self multipliedUnit: aMultipliedUnit
]

{ #category : #'mathematic operations - private' }
SimpleUnit >> divideNullUnit: aNullUnit [ 

	^DividedUnit nullUnit: aNullUnit simpleUnit: self
]

{ #category : #'mathematic operations - private' }
SimpleUnit >> divideSimpleUnit: aUnit [

	^DividedUnit simpleUnit: self simpleUnit: aUnit

]

{ #category : #'mathematic operations' }
SimpleUnit >> multiplyByUnit: aUnit [

	^aUnit multiplySimpleUnit: self
]

{ #category : #'mathematic operations - private' }
SimpleUnit >> multiplyDividedUnit: aDividedUnit [

	^MultipliedUnit dividedUnit: aDividedUnit simpleUnit: self
]

{ #category : #'mathematic operations - private' }
SimpleUnit >> multiplyMultipliedUnit: aMultipliedUnit [

	^MultipliedUnit multipliedUnit: aMultipliedUnit simpleUnit: self
]

{ #category : #'mathematic operations - private' }
SimpleUnit >> multiplySimpleUnit: aUnit [

	^MultipliedUnit simpleUnit: self simpleUnit: aUnit
]

{ #category : #'measurement creation' }
SimpleUnit >> with: aNumber [

	^Measure amount: aNumber unit: self
]

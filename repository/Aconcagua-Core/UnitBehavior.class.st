Class {
	#name : #UnitBehavior,
	#superclass : #Object,
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #accessing }
UnitBehavior class >> defaultSign [

	^'NO SIGN'

]

{ #category : #accessing }
UnitBehavior class >> nameForManyEndString [

	^'s'


]

{ #category : #accessing }
UnitBehavior class >> nameForManyFrom: aString [

	^aString , self nameForManyEndString.


]

{ #category : #'mathematic operations' }
UnitBehavior >> * aNumberOrUnit [

	^aNumberOrUnit multiplyByUnit: self
]

{ #category : #'mathematic operations' }
UnitBehavior >> / aNumberOrUnit [

	^aNumberOrUnit divideByUnit: self
]

{ #category : #'mathematic operations' }
UnitBehavior >> adaptToNumber: aNumber andSend: aSelector [ 
	^ (NumberToArithmeticObjectAdapter number: aNumber) 
		perform: aSelector
		with: self
]

{ #category : #accessing }
UnitBehavior >> baseUnit [

	^self subclassResponsibility
]

{ #category : #converting }
UnitBehavior >> convertAmountToBaseUnit: aNumber [

	self subclassResponsibility
]

{ #category : #'converting - private' }
UnitBehavior >> convertToBaseUnit: aMeasure [ 
	
	self subclassResponsibility
]

{ #category : #accessing }
UnitBehavior >> denominator [

	^NullUnit new
]

{ #category : #accessing }
UnitBehavior >> denominatorOf: aNumber [

	^self denominator with: aNumber denominator
	

]

{ #category : #'mathematic operations' }
UnitBehavior >> divideByUnit: aNumberOrUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> divideDividedUnit: aDividedUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> divideInfinity: anInfinity [

	^((NullUnit new / self) * anInfinity unit) with: anInfinity amount
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> divideMeasure: aMeasure [

	^((NullUnit new / self) * aMeasure unit) with: aMeasure amount
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> divideMinusInfinity: aMinusInfinity [

	^((NullUnit new / self) * aMinusInfinity unit) with: aMinusInfinity amount
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> divideMultipliedUnit: aMultipliedUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> divideNullUnit: aNullUnit [ 

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> divideSimpleUnit: aUnit [

	self subclassResponsibility
]

{ #category : #accessing }
UnitBehavior >> doNotImplementHash [ 
	
	"Do not implement hash because its behavior is the same as object
	See representSameEntityAs:"
]

{ #category : #testing }
UnitBehavior >> isZero [

	^self isNothing
]

{ #category : #'mathematic operations' }
UnitBehavior >> multiplyByUnit: aNumberOrUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> multiplyDividedUnit: aDividedUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> multiplyInfinity: anInfinity [

	^(anInfinity unit * self) with: anInfinity amount
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> multiplyMeasure: aMeasure [

	^(aMeasure unit * self) with: aMeasure amount
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> multiplyMinusInfinity: aMinusInfinity [

	^(aMinusInfinity unit * self) with: aMinusInfinity amount
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> multiplyMultipliedUnit: aMultipliedUnit [

	self subclassResponsibility
]

{ #category : #'mathematic operations - private' }
UnitBehavior >> multiplySimpleUnit: aUnit [

	self subclassResponsibility
]

{ #category : #accessing }
UnitBehavior >> name [

	^self nameForOne
]

{ #category : #accessing }
UnitBehavior >> nameFor: aNumber [
	"It returns the name that must be used to identify an amount <aNumber> of receiver"

	^aNumber unitNameOf: self
]

{ #category : #accessing }
UnitBehavior >> nameForMany [

	self subclassResponsibility
]

{ #category : #accessing }
UnitBehavior >> nameForOne [

	self subclassResponsibility
]

{ #category : #accessing }
UnitBehavior >> nameForUndefinedAmount [

	^self nameForMany
]

{ #category : #accessing }
UnitBehavior >> nothingAmount [

	self subclassResponsibility
]

{ #category : #accessing }
UnitBehavior >> nullMeasure [

	^Measure amount: self baseUnit nothingAmount unit: self baseUnit
]

{ #category : #accessing }
UnitBehavior >> numerator [

	^self
]

{ #category : #accessing }
UnitBehavior >> numeratorOf: aNumber [

	^self numerator with: aNumber numerator
]

{ #category : #printing }
UnitBehavior >> printOn: aStream [

	aStream nextPutAll: self name asString
]

{ #category : #accessing }
UnitBehavior >> reciprocal [

	^self denominator / self numerator
]

{ #category : #testing }
UnitBehavior >> sameDomainAs: aUnit [

	^self baseUnit=aUnit baseUnit

]

{ #category : #accessing }
UnitBehavior >> sign [

	self subclassResponsibility
]

{ #category : #'measurement creation' }
UnitBehavior >> with: aNumber [

	self subclassResponsibility
]

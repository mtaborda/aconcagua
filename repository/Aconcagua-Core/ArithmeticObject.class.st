Class {
	#name : #ArithmeticObject,
	#superclass : #Object,
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #'arithmetic operations' }
ArithmeticObject >> * aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations' }
ArithmeticObject >> + aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations' }
ArithmeticObject >> - aMeasure [

	^self + aMeasure negated
]

{ #category : #'arithmetic operations' }
ArithmeticObject >> / aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations' }
ArithmeticObject >> // aMeasure [

	self subclassResponsibility
]

{ #category : #'magnitude protocol' }
ArithmeticObject >> < aMagnitude [

	self subclassResponsibility
]

{ #category : #'magnitude protocol' }
ArithmeticObject >> <= aMagnitude [

	self subclassResponsibility
]

{ #category : #'magnitude protocol' }
ArithmeticObject >> > aMagnitude [

	self subclassResponsibility
]

{ #category : #'magnitude protocol' }
ArithmeticObject >> >= aMagnitude [

	self subclassResponsibility
]

{ #category : #'arithmetic operations' }
ArithmeticObject >> \\ aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> adaptToNumber: aNumber andSend: aSelector [ 
	^ (NumberToArithmeticObjectAdapter number: aNumber) 
		perform: aSelector
		with: self
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> adaptToScaledDecimal: anScaledDecimal andSend: aSelector [

	^self adaptToNumber: anScaledDecimal andSend: aSelector
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> addInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> addMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> addMeasureBag: aMeasureBag [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> addMinusInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #accessing }
ArithmeticObject >> amount [
	
	self subclassResponsibility
]

{ #category : #accessing }
ArithmeticObject >> atBaseUnit: aBaseUnit ifNone: aBlock [
	
	self subclassResponsibility
]

{ #category : #accessing }
ArithmeticObject >> baseUnit [

	self subclassResponsibility
]

{ #category : #'magnitude protocol' }
ArithmeticObject >> between: min and: max [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> coerce: aNumber [ 
	^ NumberToArithmeticObjectAdapter number: aNumber
]

{ #category : #'magnitude protocol - private' }
ArithmeticObject >> compareGreaterThan: aNumber [

	self subclassResponsibility
]

{ #category : #converting }
ArithmeticObject >> convertAmountToBaseUnit [

	self subclassResponsibility
]

{ #category : #converting }
ArithmeticObject >> convertTo: aUnit [ 

	self subclassResponsibility
]

{ #category : #'converting - private' }
ArithmeticObject >> convertTo: aTargetUnit using: aMeasureConverter [

	self subclassResponsibility.
]

{ #category : #converting }
ArithmeticObject >> convertToBaseUnit [

	self subclassResponsibility
]

{ #category : #'bag creation - private' }
ArithmeticObject >> createBagWith: aMeasure [

	self subclassResponsibility
]

{ #category : #'bag creation - private' }
ArithmeticObject >> createBagWithMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #'bag creation - private' }
ArithmeticObject >> createBagWithNumber: aMeasure [

	self subclassResponsibility
]

{ #category : #accessing }
ArithmeticObject >> denominator [

	^self unit denominatorOf: self amount
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> divFrom: aNumber [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> divideInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> divideMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> divideMeasureBag: aMeasureBag [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> divideMinusInfinity: aMinusInfinity [

	self subclassResponsibility
]

{ #category : #comparing }
ArithmeticObject >> equalsMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #comparing }
ArithmeticObject >> equalsMeasureBag: aMeasureBag [

	self subclassResponsibility
]

{ #category : #formatting }
ArithmeticObject >> formatOn: aStream using: aFormatter [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> generality [

	^100
]

{ #category : #'magnitude protocol - private' }
ArithmeticObject >> greaterThanMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #testing }
ArithmeticObject >> isFixed [

	self subclassResponsibility
]

{ #category : #testing }
ArithmeticObject >> isFraction [

	^false
]

{ #category : #testing }
ArithmeticObject >> isMeasureBag [

	self subclassResponsibility
]

{ #category : #testing }
ArithmeticObject >> isNothing [

	self subclassResponsibility
]

{ #category : #testing }
ArithmeticObject >> isNumber [

	^false
]

{ #category : #testing }
ArithmeticObject >> isZero [

	^self isNothing
]

{ #category : #'magnitude protocol - private' }
ArithmeticObject >> lessThanMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #'magnitude protocol' }
ArithmeticObject >> max: aMagnitude [

	self subclassResponsibility
]

{ #category : #accessing }
ArithmeticObject >> measures [
	
	self subclassResponsibility
]

{ #category : #'magnitude protocol' }
ArithmeticObject >> min: aMagnitude [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> moduloInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> moduloMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> moduloMeasureBag: aMeasureBag [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> moduloMinusInfinity: aMinusInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> multiplyInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> multiplyMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> multiplyMeasureBag: aMeasureBag [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> multiplyMinusInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations' }
ArithmeticObject >> negated [

	self subclassResponsibility
]

{ #category : #testing }
ArithmeticObject >> negative [

	self subclassResponsibility
]

{ #category : #accessing }
ArithmeticObject >> numerator [

	^self unit numeratorOf: self amount
]

{ #category : #testing }
ArithmeticObject >> positive [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> quoFrom: aNumber [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> quotientFrom: aNumber [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> remFrom: aNumber [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> remainderFrom: aNumber [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> remainderInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> remainderMeasure: aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> remainderMeasureBag: aMeasureBag [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> remainderMinusInfinity: aMinusInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations' }
ArithmeticObject >> roundTo: aNumber [

	self subclassResponsibility
]

{ #category : #testing }
ArithmeticObject >> sameDomainAs: aMeasure [

	self subclassResponsibility
]

{ #category : #testing }
ArithmeticObject >> sameUnitAs: aMeasure [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> subtractFrom: aNumber [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> subtractInfinity: anInfinity [

	self subclassResponsibility
]

{ #category : #'arithmetic operations - private' }
ArithmeticObject >> subtractMinusInfinity: aMinusInfinity [

	self subclassResponsibility
]

{ #category : #'interval protocol' }
ArithmeticObject >> to: stop [

	self subclassResponsibility
]

{ #category : #'interval protocol' }
ArithmeticObject >> to: stop by: step [

 	self subclassResponsibility
]

{ #category : #'arithmetic operations' }
ArithmeticObject >> truncated [

	self subclassResponsibility
]

{ #category : #accessing }
ArithmeticObject >> unit [
	
	self subclassResponsibility
]

{ #category : #accessing }
ArithmeticObject >> unitNameOf: aUnit [

	self subclassResponsibility
]

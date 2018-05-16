Class {
	#name : #CompoundUnit,
	#superclass : #UnitBehavior,
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #accessing }
CompoundUnit >> baseUnit [

	^self
]

{ #category : #converting }
CompoundUnit >> convertAmountToBaseUnit: aNumber [

	^aNumber
]

{ #category : #'converting - private' }
CompoundUnit >> convertFromBaseUnit: aMeasure [ 

	^aMeasure
]

{ #category : #'converting - private' }
CompoundUnit >> convertToBaseUnit: aMeasure [ 

	^aMeasure
]

{ #category : #accessing }
CompoundUnit >> hash [

	self subclassResponsibility
]

{ #category : #accessing }
CompoundUnit >> nothingAmount [

	^0
]

{ #category : #'measurement creation' }
CompoundUnit >> with: aNumber [

	^Measure amount: aNumber unit: self
]

Class {
	#name : #MeasureBehavior,
	#superclass : #ArithmeticObject,
	#category : 'Aconcagua-Core-MeasureModel'
}

{ #category : #accessing }
MeasureBehavior >> hash [ 
	
	self subclassResponsibility
]

{ #category : #testing }
MeasureBehavior >> isZero [

	^self isNothing
]

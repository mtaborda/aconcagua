Class {
	#name : #IntervalStrategy,
	#superclass : #Object,
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #enumerating }
IntervalStrategy >> advanceFrom: from by: by [
	"The reason of this method over #advanceFrom:steps:by: is only to improve performance"

	self subclassResponsibility
]

{ #category : #enumerating }
IntervalStrategy >> advanceFrom: from steps: steps by: by [

	self subclassResponsibility
]

{ #category : #querying }
IntervalStrategy >> isValidIntervalFrom: aStart to: aStop by: aStep [

	^(self stepsFrom: aStart to: aStop by: aStep) >= 0
]

{ #category : #enumerating }
IntervalStrategy >> stepsFrom: from to: to by: by [

	self subclassResponsibility
]

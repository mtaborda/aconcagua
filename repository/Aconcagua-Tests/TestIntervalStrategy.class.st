Class {
	#name : #TestIntervalStrategy,
	#superclass : #IntervalStrategy,
	#category : 'Aconcagua-Tests-ArithmeticModel'
}

{ #category : #enumerating }
TestIntervalStrategy >> advanceFrom: from by: by [

	^TestIntervalAwareMagnitude with: from number + by number
]

{ #category : #enumerating }
TestIntervalStrategy >> advanceFrom: from steps: steps by: by [

	^TestIntervalAwareMagnitude with: from number + (steps * by number)
]

{ #category : #enumerating }
TestIntervalStrategy >> stepsFrom: from to: to by: by [

	^to number - from number / by number
]

Class {
	#name : #ArithmeticObjectIntervalStrategy,
	#superclass : #IntervalStrategy,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #initialization }
ArithmeticObjectIntervalStrategy class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
ArithmeticObjectIntervalStrategy class >> initializeUniqueInstance [

	uniqueInstance := self basicNew
]

{ #category : #'instance creation' }
ArithmeticObjectIntervalStrategy class >> new [

	^uniqueInstance
]

{ #category : #enumerating }
ArithmeticObjectIntervalStrategy >> advanceFrom: from by: by [

	^from + by
]

{ #category : #enumerating }
ArithmeticObjectIntervalStrategy >> advanceFrom: from steps: steps by: by [

	^from + (steps * by)
]

{ #category : #testing }
ArithmeticObjectIntervalStrategy >> isValidIntervalFrom: aStart to: aStop by: aStep [

	^(aStep = 0) not and: [ | steps |
		steps := self stepsFrom: aStart to: aStop by: aStep.
		steps isMeasureBag not and: [ steps >= 0 ]]
]

{ #category : #enumerating }
ArithmeticObjectIntervalStrategy >> stepsFrom: from to: to by: by [

	^to - from / by
]

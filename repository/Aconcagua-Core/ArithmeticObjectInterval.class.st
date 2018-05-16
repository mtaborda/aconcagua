Class {
	#name : #ArithmeticObjectInterval,
	#superclass : #SequenceableCollection,
	#instVars : [
		'from',
		'to',
		'by',
		'size',
		'intervalStrategy'
	],
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #'instance creation' }
ArithmeticObjectInterval class >> defaultIntervalStrategy [

	^ArithmeticObjectIntervalStrategy new

]

{ #category : #'instance creation' }
ArithmeticObjectInterval class >> from: start to: stop by: step [

	^self from: start to: stop by: step intervalStrategy: self defaultIntervalStrategy

]

{ #category : #'instance creation' }
ArithmeticObjectInterval class >> from: start to: stop by: step intervalStrategy: anIntervalStrategy [

	(anIntervalStrategy isValidIntervalFrom: start to: stop by: step) 
		ifFalse: [ InvalidIntervalException signalFrom: start to: stop by: step ].
		
	^self new initializeFrom: start to: stop by: step intervalStrategy: anIntervalStrategy

]

{ #category : #comparing }
ArithmeticObjectInterval >> = aCollection [

	^self == aCollection 
		or: [ self class = aCollection class 
				and: [ from = aCollection from 
				and: [by = aCollection by
				and: [to = aCollection to]]]]
]

{ #category : #'adding/removing' }
ArithmeticObjectInterval >> add: newObject [

	self shouldNotImplement
]

{ #category : #accessing }
ArithmeticObjectInterval >> at: anIndex [

	(anIndex < 1 or: [ anIndex > self size ]) ifTrue: [ IndexOutOfRangeException signalIndex: anIndex collection: self ].

	^intervalStrategy advanceFrom: from steps: anIndex - 1 by: by.


]

{ #category : #'adding/removing' }
ArithmeticObjectInterval >> at: anInteger put: anObject [

	self shouldNotImplement
]

{ #category : #accessing }
ArithmeticObjectInterval >> by [

	^by
]

{ #category : #copying }
ArithmeticObjectInterval >> copyAndGrowBy: anInteger [

	| newSequenceableCollection |
	
	newSequenceableCollection := self species new: size + anInteger.
	self doWithIndex: [ :anObject :anIndex | newSequenceableCollection at: anIndex put: anObject ].
	^newSequenceableCollection
]

{ #category : #copying }
ArithmeticObjectInterval >> deepCopy [

	^self shallowCopy
]

{ #category : #enumerating }
ArithmeticObjectInterval >> do: aBlock [

	| element |

	"I have to doit this way because I should not go one element after the last one...
	For example, with TimeOfDay it generates an invalid time wich raise an excpetion
	The interval always have one element"	
	element := from.
	aBlock value: from.
	size-1 timesRepeat: [ 
		element := intervalStrategy advanceFrom: element by: by.
		aBlock value: element ].
]

{ #category : #enumerating }
ArithmeticObjectInterval >> doWithIndex: aBlock [

	| index |
	
	index := 1.
	self do: [ :anObject |
		aBlock value: anObject value: index.
		index := index + 1 ].

]

{ #category : #accessing }
ArithmeticObjectInterval >> from [

	^from
]

{ #category : #comparing }
ArithmeticObjectInterval >> hash [

	^from hash bitXor: (to hash bitXor: by hash)
]

{ #category : #querying }
ArithmeticObjectInterval >> includes: anObject [

	| incrementsToObject |

	incrementsToObject := intervalStrategy stepsFrom: from to: anObject by: by.
	^0 <= incrementsToObject and: [incrementsToObject < size and: [incrementsToObject isInteger]]
]

{ #category : #initialization }
ArithmeticObjectInterval >> initializeFrom: aStart to: aStop by: aStep intervalStrategy: anIntervalStrategy [

	from := aStart.
	to := aStop.
	by := aStep.
	intervalStrategy := anIntervalStrategy.
	
	self initializeSize.
]

{ #category : #initialization }
ArithmeticObjectInterval >> initializeSize [

	size := (intervalStrategy stepsFrom: from to: to by: by) truncated + 1

]

{ #category : #printing }
ArithmeticObjectInterval >> printOn: aStream [

	aStream nextPutAll: 'Interval from: '.
	self from printOn: aStream.
	aStream nextPutAll: ' to: '.
	self to printOn: aStream.
	aStream nextPutAll: ' by: '.
	self by printOn: aStream
]

{ #category : #enumerating }
ArithmeticObjectInterval >> reject: aBlock [

	| index answer |

	index := 0.
	answer := self species new: size.
	self do: [ :anObject |
		(aBlock value: anObject) ifFalse: [
			index := index + 1.
			answer at: index put: anObject ] ].
		
	^answer copyFrom: 1 to: index
]

{ #category : #'adding/removing' }
ArithmeticObjectInterval >> remove: oldObject ifAbsent: anExceptionBlock [

	self shouldNotImplement
]

{ #category : #enumerating }
ArithmeticObjectInterval >> reverse [

	| answer index |
	
	answer := self species new: size.
	index := 1.

	self reverseDo: [ :anObject |
		answer at: index put: anObject.
		index := index + 1 ].

	^answer
]

{ #category : #enumerating }
ArithmeticObjectInterval >> reverseDo: aBlock [

	| steps |
	steps := size - 1.
	size timesRepeat: [ 
		aBlock value: (intervalStrategy advanceFrom: from steps: steps by: by).
		steps := steps - 1. ].
]

{ #category : #enumerating }
ArithmeticObjectInterval >> select: aBlock [

	| index answer |

	index := 0.
	answer := self species new: size.
	self do: [ :anObject |
		(aBlock value: anObject) ifTrue: [
			index := index + 1.
			answer at: index put: anObject ] ].
		
	^answer copyFrom: 1 to: index
]

{ #category : #copying }
ArithmeticObjectInterval >> shallowCopy [

	^self class from: from to: to by: by
]

{ #category : #accessing }
ArithmeticObjectInterval >> size [

	^size	
]

{ #category : #accessing }
ArithmeticObjectInterval >> species [

	^Array
]

{ #category : #storing }
ArithmeticObjectInterval >> storeOn: aStream [

	"Append to the argument aStream a sequence of characters that is a
	 Smalltalk expression whose evaluation creates an object similar to
	 the receiver.

	 Fail if aStream is not a kind of Stream."

	aStream
		nextPut: $( ;
		nextPutAll: self class name;
		nextPutAll: ' from: ' .
	from storeOn: aStream.
	aStream nextPutAll: ' to: ' .
	to storeOn: aStream.
	aStream nextPutAll: ' by: ' .
	by storeOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
ArithmeticObjectInterval >> to [

	^to
]

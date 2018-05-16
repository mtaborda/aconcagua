Class {
	#name : #ArithmeticObjectIntervalTest,
	#superclass : #TestCase,
	#category : 'Aconcagua-Tests-ArithmeticModel'
}

{ #category : #'test accessing' }
ArithmeticObjectIntervalTest >> testAccessing [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	
	self assert: interval from=1.
	self assert: interval to=10.
	self assert: interval by=2.
	
]

{ #category : #test }
ArithmeticObjectIntervalTest >> testAdd [

	self 
		should: [ (ArithmeticObjectInterval from: 1 to: 10 by: 1) add: 1]
		raise: Exception
]

{ #category : #'test accessing' }
ArithmeticObjectIntervalTest >> testAt [

	| interval |

	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.

	self assert: (interval first) = 1.
	self assert: (interval at: 2) = 3.
	self assert: (interval at: 3) = 5.
	self assert: (interval at: 4) = 7.
	self assert: (interval at: 5) = 9.
	self should: [interval at: 11] raise: IndexOutOfRangeException
]

{ #category : #'test comparing' }
ArithmeticObjectIntervalTest >> testComparing [

	| interval1 interval2 |
	
	interval1 := ArithmeticObjectInterval from: 1 to: 5 by: 2.
	interval2 := ArithmeticObjectInterval from: 1 to: 5 by: 2.
	self assert: interval1=interval2.

	interval2 := ArithmeticObjectInterval from: 1 to: 5 by: 1.
	self deny: interval1=interval2.
	
]

{ #category : #test }
ArithmeticObjectIntervalTest >> testCopyAndGrowBy [

	| original copy |
	
	original := ArithmeticObjectInterval from: 1 to: 10 by: 1.
	copy := original copyAndGrowBy: 10.
	
	self assert: copy size=20.
	1 to: 10 do: [ :aNumber | self assert: (copy at: aNumber) = aNumber ].
	11 to: 20 do: [ :aNumber | self assert: (copy at: aNumber) isNil ]

]

{ #category : #test }
ArithmeticObjectIntervalTest >> testDeepCopy [

	| original copy |
	
	original := ArithmeticObjectInterval from: 1 to: 10 by: 1.
	copy := original deepCopy.
	
	self assert: original = copy.
	self deny: original == copy.
]

{ #category : #'test enumerating' }
ArithmeticObjectIntervalTest >> testDo [

	| interval number |
	
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	number := 1.
	interval do: [ :aNumber |
		self assert: aNumber= number.
		number := number + 2 ].

	self assert: number=11.

]

{ #category : #'test accessing' }
ArithmeticObjectIntervalTest >> testFirst [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	
	self assert: interval first=1.

]

{ #category : #'test accessing' }
ArithmeticObjectIntervalTest >> testHash [

	self assert: (ArithmeticObjectInterval from: 1 to: 5 by: 2) hash=(ArithmeticObjectInterval from: 1 to: 5 by: 2) hash

]

{ #category : #'test querying' }
ArithmeticObjectIntervalTest >> testIncludes [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 5 by: 2.

	self assert: (interval includes: 1).
	self assert: (interval includes: 3).
	self assert: (interval includes: 5).
	self deny: (interval includes: 0).
	self deny: (interval includes: 6).
	self deny: (interval includes: 7).
	self deny: (interval includes: 2).
	self deny: (interval includes: 4).


]

{ #category : #'test accessing' }
ArithmeticObjectIntervalTest >> testInvalidAt [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	
	self 
		should: [ interval at: 0 ]
		raise: IndexOutOfRangeException
		withExceptionDo: [ :anException |
			self assert: anException description notNil.
			self assert: anException index = 0.
			self assert: anException collection = interval ].

	self should: [ interval at: interval size + 1 ] raise: IndexOutOfRangeException
]

{ #category : #'test instance creation' }
ArithmeticObjectIntervalTest >> testInvalidCreation [

	self 
		should: [ ArithmeticObjectInterval from: 1 to: -1 by: 2]
		raise: InvalidIntervalException
		withExceptionDo: [ :anException |
			self assert: anException description notNil.
			self assert: anException from=1.
			self assert: anException to = -1.
			self assert: anException by = 2 ].
	
	self should: [ ArithmeticObjectInterval from: -1 to: 1 by: -2] raise: InvalidIntervalException.
	self should: [ ArithmeticObjectInterval from: 1  to: 2 by: -1] raise: InvalidIntervalException.
	self should: [ ArithmeticObjectInterval from: -1 to: -2 by: 1] raise: InvalidIntervalException.
	self should: [ ArithmeticObjectInterval from: 1 to: 2 by: 0] raise: InvalidIntervalException
]

{ #category : #'test accessing' }
ArithmeticObjectIntervalTest >> testLast [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	
	self assert: interval last=9.

]

{ #category : #test }
ArithmeticObjectIntervalTest >> testPrintOn [

	self assert: (ArithmeticObjectInterval from: 1 to: 10 by: 1) printString = 'Interval from: 1 to: 10 by: 1'
]

{ #category : #'test enumerating' }
ArithmeticObjectIntervalTest >> testReject [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	self assert: (interval reject: [:a | a > 5])=(Array with: 1 with: 3 with: 5).

]

{ #category : #test }
ArithmeticObjectIntervalTest >> testRemoveIfAbsent [

	self 
		should: [ (ArithmeticObjectInterval from: 1 to: 10 by: 1) remove: 1 ifAbsent: []]
		raise: Exception

]

{ #category : #'test enumerating' }
ArithmeticObjectIntervalTest >> testReverse [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 5 by: 2.
	self assert: interval reverse=(Array with: 5 with: 3 with: 1).

]

{ #category : #'test enumerating' }
ArithmeticObjectIntervalTest >> testReverseDo [

	| interval number |
	
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	number := 9.
	interval reverseDo: [ :aNumber |
		self assert: aNumber= number.
		number := number - 2 ].

	self assert: number = -1
]

{ #category : #'test enumerating' }
ArithmeticObjectIntervalTest >> testSelect [

	| interval |
	
	interval := ArithmeticObjectInterval from: 1 to: 10 by: 2.
	self assert: (interval select: [:a | a < 5])=(Array with: 1 with: 3).

]

{ #category : #test }
ArithmeticObjectIntervalTest >> testShallowCopy [

	| original copy |
	
	original := ArithmeticObjectInterval from: 1 to: 10 by: 1.
	copy := original shallowCopy.
	
	self assert: original = copy.
	self deny: original == copy.
]

{ #category : #'test accessing' }
ArithmeticObjectIntervalTest >> testSize [

	self assert: (ArithmeticObjectInterval from: 1 to: 10 by: 2) size=5.
	self assert: (ArithmeticObjectInterval from: 1 to: 10 by: 11) size=1.
	self assert: (ArithmeticObjectInterval from: 1 to: 1 by: 1) size=1.
	self assert: (ArithmeticObjectInterval from: 1 to: 1 by: 2) size=1.
	self assert: (ArithmeticObjectInterval from: -1 to: -10 by: -2) size=5.
	self assert: (ArithmeticObjectInterval from: -10 to: 10 by: 1) size=21.
	self assert: (ArithmeticObjectInterval from: -10 to: -5 by: 1) size=6.
	
]

{ #category : #test }
ArithmeticObjectIntervalTest >> testStoreOn [

	| stream |
	stream := WriteStream on: String new.
	(ArithmeticObjectInterval 
		from: 1
		to: 10
		by: 1) storeOn: stream.
	self assert: stream contents = '(ArithmeticObjectInterval from: 1 to: 10 by: 1)'
]

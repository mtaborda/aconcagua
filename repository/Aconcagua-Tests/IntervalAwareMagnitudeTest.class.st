Class {
	#name : #IntervalAwareMagnitudeTest,
	#superclass : #TestCase,
	#category : 'Aconcagua-Tests-ArithmeticModel'
}

{ #category : #test }
IntervalAwareMagnitudeTest >> testBetweenAndNotInclusive [

	self assert: ((TestIntervalAwareMagnitude with: 1) between: (TestIntervalAwareMagnitude with: 0) andNotInclusive: (TestIntervalAwareMagnitude with: 2)).
	self assert: ((TestIntervalAwareMagnitude with: 1) between: (TestIntervalAwareMagnitude with: 1) andNotInclusive: (TestIntervalAwareMagnitude with: 2)).
	self deny: ((TestIntervalAwareMagnitude with: 1) between: (TestIntervalAwareMagnitude with: 0) andNotInclusive: (TestIntervalAwareMagnitude with: 1))
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testHash [

	self assert: (TestIntervalAwareMagnitude with: 10) hash = (TestIntervalAwareMagnitude with: 10) hash
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testMax [

	self assert: ((TestIntervalAwareMagnitude with: 10) max: (TestIntervalAwareMagnitude with: 11)) = (TestIntervalAwareMagnitude with: 11).
	self assert: ((TestIntervalAwareMagnitude with: 10) max: (TestIntervalAwareMagnitude with: 9)) = (TestIntervalAwareMagnitude with: 10).
	self assert: ((TestIntervalAwareMagnitude with: 10) max: (TestIntervalAwareMagnitude with: 10)) = (TestIntervalAwareMagnitude with: 10)
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testMin [

	self assert: ((TestIntervalAwareMagnitude with: 10) min: (TestIntervalAwareMagnitude with: 11)) = (TestIntervalAwareMagnitude with: 10).
	self assert: ((TestIntervalAwareMagnitude with: 10) min: (TestIntervalAwareMagnitude with: 9)) = (TestIntervalAwareMagnitude with: 9).
	self assert: ((TestIntervalAwareMagnitude with: 10) min: (TestIntervalAwareMagnitude with: 10)) = (TestIntervalAwareMagnitude with: 10)
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testNotInclusiveBetweenAnd [

	self assert: ((TestIntervalAwareMagnitude with: 1) notInclusiveBetween: (TestIntervalAwareMagnitude with: 0) and: (TestIntervalAwareMagnitude with: 1)).
	self assert: ((TestIntervalAwareMagnitude with: 1) notInclusiveBetween: (TestIntervalAwareMagnitude with: 0) and: (TestIntervalAwareMagnitude with: 2)).
	self deny: ((TestIntervalAwareMagnitude with: 1) notInclusiveBetween: (TestIntervalAwareMagnitude with: 1) and: (TestIntervalAwareMagnitude with: 1))
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testNotInclusiveBetweenAndNotInclusive [

	self assert: ((TestIntervalAwareMagnitude with: 1) notInclusiveBetween: (TestIntervalAwareMagnitude with: 0) andNotInclusive: (TestIntervalAwareMagnitude with: 2)).
	self deny: ((TestIntervalAwareMagnitude with: 1) notInclusiveBetween: (TestIntervalAwareMagnitude with: 1) andNotInclusive: (TestIntervalAwareMagnitude with: 2)).
	self deny: ((TestIntervalAwareMagnitude with: 1) notInclusiveBetween: (TestIntervalAwareMagnitude with: 0) andNotInclusive: (TestIntervalAwareMagnitude with: 1))
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testTo [

	| interval |
	
	interval := (TestIntervalAwareMagnitude with: 10) to: (TestIntervalAwareMagnitude with: 20).

	self assert: interval from = (TestIntervalAwareMagnitude with: 10).
	self assert: interval to = (TestIntervalAwareMagnitude with: 20).
	self assert: interval by = (TestIntervalAwareMagnitude with: 1)
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testToBy [

	| interval |
	
	interval := (TestIntervalAwareMagnitude with: 10) to: (TestIntervalAwareMagnitude with: 20) by: (TestIntervalAwareMagnitude with: 5).

	self assert: interval from = (TestIntervalAwareMagnitude with: 10).
	self assert: interval to = (TestIntervalAwareMagnitude with: 20).
	self assert: interval by = (TestIntervalAwareMagnitude with: 5)
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testToByDo [

	| number |
	
	number := 10.	
	((TestIntervalAwareMagnitude with: 10) 
		to: (TestIntervalAwareMagnitude with: 20) 
		by: (TestIntervalAwareMagnitude with: 2))
		do: [ :aTestMagnitude |
			self assert: aTestMagnitude number = number.
			number := number + 2 ].
	
	self assert: number = 22
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testToNegativeBy [

	| interval number |
	
	interval := (TestIntervalAwareMagnitude with: 20) to: (TestIntervalAwareMagnitude with: 10) by: (TestIntervalAwareMagnitude with: -3).
	number := 20.
	interval do: [ :each |
		self assert: each number = number.
		number := number - 3 ].
	
	self assert: number = 8
]

{ #category : #test }
IntervalAwareMagnitudeTest >> testToReverse [

	| coll number |
	
	coll := ((TestIntervalAwareMagnitude with: 10) 
		to: (TestIntervalAwareMagnitude with: 20) 
		by: (TestIntervalAwareMagnitude with: 3)) reverse.
	number := 19.
	coll do: [ :each |
		self assert: each number = number.
		number := number - 3 ].
	
	self assert: number = 7
]

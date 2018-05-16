Class {
	#name : #InvalidIntervalException,
	#superclass : #Error,
	#instVars : [
		'from',
		'to',
		'by'
	],
	#category : 'Aconcagua-Core-ArithmeticModel'
}

{ #category : #'instance creation' }
InvalidIntervalException class >> from: aFrom to: aTo by: aBy [

	^self new initializeFrom: aFrom to: aTo by: aBy
]

{ #category : #signaling }
InvalidIntervalException class >> signalFrom: aFrom to: aTo by: aBy [

	(self from: aFrom to: aTo by: aBy) signal
]

{ #category : #accessing }
InvalidIntervalException >> by [

	^by
]

{ #category : #accessing }
InvalidIntervalException >> description [

	^'An interval cannot be created from <1p> to <2p> with an increase of <3p>'
		expandMacrosWith: from
		with: to
		with: by
]

{ #category : #accessing }
InvalidIntervalException >> from [

	^from
]

{ #category : #initialization }
InvalidIntervalException >> initializeFrom: aFrom to: aTo by: aBy [

	from := aFrom.
	to := aTo.
	by := aBy.
]

{ #category : #accessing }
InvalidIntervalException >> to [

	^to
]

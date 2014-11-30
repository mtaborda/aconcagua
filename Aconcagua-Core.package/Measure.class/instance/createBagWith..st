bag creation - private
createBagWith: aMeasure

	^self isNothing
		ifTrue: [aMeasure]
		ifFalse: [aMeasure createBagWithMeasure: self]
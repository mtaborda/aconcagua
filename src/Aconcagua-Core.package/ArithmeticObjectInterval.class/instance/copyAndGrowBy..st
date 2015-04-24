copying
copyAndGrowBy: anInteger

	| newSequenceableCollection |
	
	newSequenceableCollection := self species new: size + anInteger.
	self doWithIndex: [ :anObject :anIndex | newSequenceableCollection at: anIndex put: anObject ].
	^newSequenceableCollection
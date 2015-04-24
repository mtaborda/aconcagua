enumerating
doWithIndex: aBlock

	| index |
	
	index := 1.
	self do: [ :anObject |
		aBlock value: anObject value: index.
		index := index + 1 ].

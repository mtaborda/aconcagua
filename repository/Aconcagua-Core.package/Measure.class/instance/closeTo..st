comparing
closeTo: aMeasure 
	"If the unit is the same one, verifies only the amount.
	If no, if it is of the same domain it turns the amount and it compares.
	If no, it returns false."

	^unit = aMeasure unit 
		ifTrue: [amount closeTo: aMeasure amount]
		ifFalse: 
			[(self sameDomainAs: aMeasure) 
				ifTrue: [self convertAmountToBaseUnit closeTo: aMeasure convertAmountToBaseUnit]
				ifFalse: [self isNothing and: [aMeasure isNothing]]]
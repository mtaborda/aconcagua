converting - private
convertToBaseUnit: aMeasure 
	
	^Measure 
		amount: (self convertAmountToBaseUnit: aMeasure amount)
		unit: self baseUnit
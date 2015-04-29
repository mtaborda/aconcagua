arithmetic operations - private
addMeasure: aMeasure 
	"I delegate the responsibility to MeasureBag since this it verifies if the measures are of the same domain.
	When causing that bag has this responsibility, the code that checks this this in a single place and is not created bag
	for measures of the same domain."

	^MeasureBag with: aMeasure with: self
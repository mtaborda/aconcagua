converting - private
convertMeasureBag: aSourceMeasureBag to: aTargetUnit

	| targetMeasure |
	targetMeasure := aSourceMeasureBag measures 
				inject: 0
				into: 
					[:convertedMeasure :measureToConvert | 
					convertedMeasure 
						+ (self convert: measureToConvert to: aTargetUnit)].
	^targetMeasure
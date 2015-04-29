arithmetic operations - private
multiplyMeasureBag: aMeasureBag

	^measures inject: 0 into: [:resultMeasure :aMeasureInBag | resultMeasure + (aMeasureBag * aMeasureInBag)]
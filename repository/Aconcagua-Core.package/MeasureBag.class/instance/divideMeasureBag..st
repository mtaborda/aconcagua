arithmetic operations - private
divideMeasureBag: aMeasureBag

	^measures inject: 0 into: [:resultMeasure :aMeasureInBag | resultMeasure + (aMeasureBag / aMeasureInBag)]
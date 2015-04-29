test measurement creation
testMeasureCreation

	self assert: (meterBySecond with: 10) = (Measure amount: 10 unit: meterBySecond)
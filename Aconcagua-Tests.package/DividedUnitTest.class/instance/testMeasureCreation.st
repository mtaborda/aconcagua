test measurement creation
testMeasureCreation

	self assert: (meterOverSecond with: 10) = (Measure amount: 10 unit: meterOverSecond)
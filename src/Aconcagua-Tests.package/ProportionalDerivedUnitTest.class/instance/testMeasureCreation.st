test measurement creation
testMeasureCreation

	self assert: (centavo with: 10) = (Measure amount: 10 unit: centavo)
test integer division
testModuloByMeasure

	self assert: (self tenMeters // self tenMeters) = 1.
	self assert: (self oneMeter // self tenMeters) = 0.
	self assert:
		(self tenMeters // self oneSecond) = (Measure amount: 10 unit: (self meter / self second)).
	self assert:
		(self tenMeters // self twoSecond) = (Measure amount: 5 unit: (self meter / self second))
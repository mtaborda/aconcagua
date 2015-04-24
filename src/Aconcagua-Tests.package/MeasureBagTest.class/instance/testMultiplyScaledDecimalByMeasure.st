test multiplication
testMultiplyScaledDecimalByMeasure

	self assert: (23.76s2 * (self tenPesos + self tenMeters )) =  ((23.76s2 *self tenPesos) + (23.76s2 *self tenMeters)) 


test multiplication
testMultiplyScaledDecimalByMeasure

	self assert: (23.76s2 * self tenPesos) = ((NullUnit new * self peso) with: 23.76s2*10)


test integer division
testModuloScaledDecimalByMeasure

	self should: [ 23.76s2 // ( self tenPesos + self tenMeters ) ] raise: InvalidOperationException


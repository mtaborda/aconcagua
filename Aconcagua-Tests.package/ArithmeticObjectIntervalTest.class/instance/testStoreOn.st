test
testStoreOn

	| stream |
	stream := WriteStream on: String new.
	(ArithmeticObjectInterval 
		from: 1
		to: 10
		by: 1) storeOn: stream.
	self assert: stream contents = '(ArithmeticObjectInterval from: 1 to: 10 by: 1)'
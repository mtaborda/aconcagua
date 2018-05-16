Class {
	#name : #NumberMeasureProtocolTest,
	#superclass : #TestCase,
	#category : 'Aconcagua-Tests-MeasureModel'
}

{ #category : #'test accessing' }
NumberMeasureProtocolTest >> testAmount [

	self assert: 1 amount = 1
]

{ #category : #'test accessing' }
NumberMeasureProtocolTest >> testBaseUnit [

	self assert: 1 baseUnit = NullUnit new
]

{ #category : #test }
NumberMeasureProtocolTest >> testConvertTo [

	self assert: (1 convertTo: NullUnit new) = 1.
	self assert: (1 convertTo: 1 baseUnit) = 1.
	self
		should: [(1 convertTo: (BaseUnit named: 'The base is'))]
		raise: CanNotConvertMeasureException
]

{ #category : #'test converting' }
NumberMeasureProtocolTest >> testConvertToBaseUnit [

	self assert: 1 convertToBaseUnit = 1
]

{ #category : #'test querying' }
NumberMeasureProtocolTest >> testIsNothing [

	self assert: 0 isNothing.
	self deny: 1 isNothing.
]

{ #category : #'test accessing' }
NumberMeasureProtocolTest >> testUnit [

	self assert: 1 unit = NullUnit new
]

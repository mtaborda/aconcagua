Class {
	#name : #ArithmeticObjectIntervalStrategyTest,
	#superclass : #TestCase,
	#category : #'Aconcagua-Tests-ArithmeticModel'
}

{ #category : #test }
ArithmeticObjectIntervalStrategyTest >> testSingleton [

	self assert: ArithmeticObjectIntervalStrategy new == ArithmeticObjectIntervalStrategy new
]

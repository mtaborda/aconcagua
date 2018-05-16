Class {
	#name : #EvaluationTest,
	#superclass : #TestCase,
	#instVars : [
		'formulaOfTenPesos',
		'formulaOfTwentyPesos',
		'messageName',
		'peso',
		'dollar'
	],
	#category : #'Aconcagua-Tests-MeasureModel'
}

{ #category : #'test support' }
EvaluationTest >> assertAllTestShouldPassFor: aMessageName [

	self shouldPass: self genericTestsMessageNames for: aMessageName
]

{ #category : #accessing }
EvaluationTest >> genericTestsMessageNames [

	^(self class selectors select: [:aSelector | 'performWith*' match: aSelector])
		asOrderedCollection
]

{ #category : #accessing }
EvaluationTest >> messageName: aMessageName [

	messageName := aMessageName

	
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFloatWithFormula [

	self assert: (1.01 perform: messageName with: formulaOfTenPesos) value =
		(1.01 value perform: messageName with: formulaOfTenPesos value)
	
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFormulaWithFloat [

	self assert: (formulaOfTenPesos perform: messageName with: 1.01) value = 
		(formulaOfTenPesos value perform: messageName with: 1.01 value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFormulaWithFraction [

	self assert: (formulaOfTenPesos perform: messageName with: (1/3)) value = 
		(formulaOfTenPesos value perform: messageName with: (1/3) value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFormulaWithInteger [

	self assert: (formulaOfTenPesos perform: messageName with: 1) value = 
		(formulaOfTenPesos value perform: messageName with: 1 value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFormulaWithMeasure [

	self assert: (formulaOfTenPesos perform: messageName with: self twentyPesos) value = 
		(formulaOfTenPesos value perform: messageName with: self twentyPesos value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFormulaWithMeasureBag [

	self assert: (formulaOfTenPesos perform: messageName with: (self tenDollars + self tenPesos)) value = 
		(formulaOfTenPesos value perform: messageName with: (self tenDollars + self tenPesos) value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFormulaWithScaledDecimal [

	self assert: (formulaOfTenPesos perform: messageName with: 1.02s2) value = 
		(formulaOfTenPesos value perform: messageName with: 1.02s2 value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFormulas [

	self assert: (formulaOfTenPesos perform: messageName with: formulaOfTwentyPesos) value = 
		(formulaOfTenPesos value perform: messageName with: formulaOfTwentyPesos value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithFractionWithFormula [

	self assert: (1/3 perform: messageName with: formulaOfTenPesos) value = 
		((1/3) value perform: messageName with: formulaOfTenPesos value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithIntegerWithFormula [

	self assert: (1 perform: messageName with: formulaOfTenPesos) value = 
		(1 value perform: messageName with: formulaOfTenPesos value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithMeasureBagWithFormula [

	self assert: ((self tenDollars + self tenPesos) perform: messageName with: formulaOfTenPesos) value = 
		((self tenDollars + self tenPesos) value perform: messageName with:formulaOfTenPesos value )
]

{ #category : #'generic tests' }
EvaluationTest >> performWithMeasureWithFormula [

	self assert: (self twentyPesos perform: messageName with: formulaOfTenPesos) value = 
		(self twentyPesos value perform: messageName with: formulaOfTenPesos value)
]

{ #category : #'generic tests' }
EvaluationTest >> performWithScaledDecimalWithFormula [

	self assert: (27.02s2 perform: messageName with: formulaOfTenPesos) value = 
		(27.02s2 value perform: messageName with: formulaOfTenPesos value)
]

{ #category : #initialization }
EvaluationTest >> setUp [
	
	peso := BaseUnit named: 'Peso'.
	dollar := BaseUnit named: 'Dollar'.
	formulaOfTenPesos := DummyEvaluation of: self tenPesos.
	formulaOfTwentyPesos := DummyEvaluation of: self twentyPesos
]

{ #category : #'test support' }
EvaluationTest >> shouldFail: aTestsToFail for: aMessageName [

	messageName := aMessageName.
	aTestsToFail do: [:aTest |
		self 
			should: [self perform: aTest]
			raise: InvalidOperationException
			withExceptionDo: [ :anException | 
				self assert: anException description notNil.
				self assert: anException operationName notNil.
				(anException isKindOf: InvalidUnaryOperationException) 
					ifTrue: [self assert: anException operand notNil].
				(anException isKindOf: InvalidBinaryOperationException) 
					ifTrue: [
						self assert: anException leftOperand notNil.
						self assert: anException rightOperand notNil]]]
]

{ #category : #'test support' }
EvaluationTest >> shouldFail: testsToFail shouldPassRestFor: aMessageName [

	| testToPass |
	
	testToPass := self genericTestsMessageNames.
	testToPass removeAll: testsToFail.
	self shouldPass: testToPass for: aMessageName.
	self shouldFail: testsToFail for: aMessageName
]

{ #category : #'test support' }
EvaluationTest >> shouldPass: testsToPass for: aMessageName [

	messageName := aMessageName.
	testsToPass do: [ :aTestMessageName | self perform: aTestMessageName ]
]

{ #category : #accessing }
EvaluationTest >> tenDollars [
	
	^dollar with: 10
]

{ #category : #accessing }
EvaluationTest >> tenPesos [

	^peso with: 10
]

{ #category : #testing }
EvaluationTest >> testAdd [

	self assertAllTestShouldPassFor: #+
]

{ #category : #testing }
EvaluationTest >> testDivide [

	self assertAllTestShouldPassFor: #/
]

{ #category : #testing }
EvaluationTest >> testIsMeasureBag [

	self deny: formulaOfTenPesos isMeasureBag.
	self assert: (DummyEvaluation of: (peso with: 1) + (dollar with: 1)) isMeasureBag
]

{ #category : #testing }
EvaluationTest >> testModulo [

	| testsToFail |

	testsToFail := #(performWithFormulaWithMeasureBag).
	self shouldFail: testsToFail shouldPassRestFor: #//
]

{ #category : #testing }
EvaluationTest >> testMultiply [

	self assertAllTestShouldPassFor: #*
]

{ #category : #testing }
EvaluationTest >> testNegated [

	self assert: formulaOfTenPesos negated value = formulaOfTenPesos value negated.
	self assert: formulaOfTenPesos negated negated value = formulaOfTenPesos value
]

{ #category : #testing }
EvaluationTest >> testRemainder [

	| testsToFail |
	
	testsToFail := #(
		#performWithFormulaWithMeasureBag
		#performWithMeasureBagWithFormula		
		).	
	self shouldFail: testsToFail shouldPassRestFor: #\\
]

{ #category : #testing }
EvaluationTest >> testSubtract [

	self assertAllTestShouldPassFor: #-
]

{ #category : #testing }
EvaluationTest >> testTruncated [

	| formula |
	
	formula := DummyEvaluation of: (peso with: 1.3).
	self assert: formula truncated = (peso with: 1)
]

{ #category : #accessing }
EvaluationTest >> twentyPesos [

	^peso with: 20
]

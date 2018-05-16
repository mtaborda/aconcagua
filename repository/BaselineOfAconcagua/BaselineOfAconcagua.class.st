"
This class is used to load Aconcagua from github repository
"
Class {
	#name : #BaselineOfAconcagua,
	#superclass : #BaselineOf,
	#instVars : [
		'repositories'
	],
	#category : 'BaselineOfAconcagua'
}

{ #category : #baselines }
BaselineOfAconcagua >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.

			spec blessing: #baseline.

			spec
				package: 'Aconcagua-Core' with: [ spec requires: 'Mole' ];
				package: 'Aconcagua-Tests' with: [ spec requires: 'Aconcagua-Core' ].
			
			spec
				group: 'Deployment' with: #('Aconcagua-Core');
				group: 'Development' with: #('Aconcagua-Tests');
				group: 'default' with: #('Deployment') ].

	spec for: #'pharo4.x' do: [ spec repository: (repositories at: #pharo40) ].
	spec for: #'pharo5.x' do: [ spec repository: (repositories at: #pharo50) ].
	spec for: #'pharo6.x' do: [ spec repository: (repositories at: #pharo60) ].
	spec for: #'pharo6.1' do: [ spec repository: (repositories at: #pharo61) ].
]

{ #category : #'initialize - release' }
BaselineOfAconcagua >> initialize [

	super initialize.
	self initializeRepositories
]

{ #category : #'initialize - release' }
BaselineOfAconcagua >> initializeRepositories [

	repositories := Dictionary new.
	repositories at: #pharo40 put: #'github://mtaborda/aconcagua:v4.1.0/repository'.
	repositories at: #pharo50 put: #'github://mtaborda/aconcagua:v5.0.0/repository'.
	repositories at: #pharo60 put: #'github://ba-st/Aconcagua:v6.0.0/repository'.
	repositories at: #pharo61 put: #'github://ba-st/Aconcagua:development/repository'

]

{ #category : #baselines }
BaselineOfAconcagua >> setUpDependencies: spec [

	spec
		baseline: 'Mole'
		with: [ spec
				repository: 'github://ba-st/Mole:v1/source';
				loads: #('Deployment') ]
]

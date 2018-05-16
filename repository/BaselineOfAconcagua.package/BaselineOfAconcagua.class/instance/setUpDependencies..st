baselines
setUpDependencies: spec

	spec
		baseline: 'Mole'
		with: [ spec
				repository: 'github://ba-st/Mole:v1/source';
				loads: #('Deployment') ]
baselines
baseline400: spec
	<version: '4.0.0-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: '- Aconcagua final for 4.x images'.
			spec repository: 'github://mtaborda/aconcagua:master/src'.
			spec
				package: 'Aconcagua-Core';
				package: 'Aconcagua-Tests' with: [ spec requires: 'Aconcagua-Core' ].
			spec
				group: 'default' with: #('Core' 'Tests');
				group: 'Core' with: #('Aconcagua-Core');
				group: 'Tests' with: #('Aconcagua-Tests') ]
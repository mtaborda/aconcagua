baselines
baseline310: spec
	<version: '3.1.0-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: '- Aconcagua published to SmalltalkHub'.
			spec repository: 'http://smalltalkhub.com/mc/maxi/Aconcagua/main'.
			spec
				package: 'Aconcagua-Core';
				package: 'Aconcagua-Tests' with: [ spec requires: 'Aconcagua-Core' ].
			spec
				group: 'default' with: #('Core' 'Tests');
				group: 'Core' with: #('Aconcagua-Core');
				group: 'Tests' with: #('Aconcagua-Tests') ]
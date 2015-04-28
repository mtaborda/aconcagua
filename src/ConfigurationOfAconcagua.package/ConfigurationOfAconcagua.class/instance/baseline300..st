baselines
baseline300: spec
	<version: '3.0.0-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: '- Aconcagua published to SmalltalkHub'.
			spec repository: 'http://smalltalkhub.com/mc/maxi/Aconcagua/main'.
			spec
				package: 'Aconcagua-ArithmeticModel-Core';
				package: 'Aconcagua-ArithmeticModel-Tests' with: [ spec requires: 'Aconcagua-ArithmeticModel-Core' ];
				package: 'Aconcagua-GraphModel-Core';
				package: 'Aconcagua-GraphModel-Tests' with: [ spec requires: 'Aconcagua-GraphModel-Core' ];
				package: 'Aconcagua-MeasureModel-Core';
				package: 'Aconcagua-MeasureModel-Tests' with: [ spec requires: 'Aconcagua-MeasureModel-Core' ].
			spec
				group: 'default' with: #('Core' 'Tests');
				group: 'Core' with: #('Aconcagua-ArithmeticModel-Core' 'Aconcagua-GraphModel-Core' 'Aconcagua-MeasureModel-Core');
				group: 'Tests'
					with: #('Aconcagua-ArithmeticModel-Tests' 'Aconcagua-GraphModel-Tests' 'Aconcagua-MeasureModel-Tests') ]
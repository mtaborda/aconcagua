baselines
baseline: spec
	<baseline>
	
	spec for: #common do: [ 
		spec
			package: 'Aconcagua-Core';
			package: 'Aconcagua-Tests' with: [ spec requires: 'Aconcagua-Core' ].
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Aconcagua-Core');
			group: 'Tests' with: #('Aconcagua-Tests') ]
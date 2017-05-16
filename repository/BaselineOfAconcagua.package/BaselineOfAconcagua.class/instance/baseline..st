baselines
baseline: spec
	<baseline>
	
	spec for: #common do: [ 
		spec blessing: #baseline.
		spec
			package: 'Aconcagua-Core';
			package: 'Aconcagua-Tests' with: [ spec requires: 'Aconcagua-Core' ].
		spec
			group: 'default' with: #('Core' 'Tests');
			group: 'Core' with: #('Aconcagua-Core');
			group: 'Tests' with: #('Aconcagua-Tests') ].
	
	spec for: #'pharo4.x' do: [
		spec repository: (repositories at: #pharo40) ].
	
	spec for: #'pharo5.x' do: [
		spec repository: (repositories at: #pharo50) ].
	
	spec for: #'pharo6.x' do: [
		spec repository: (repositories at: #pharo60) ]

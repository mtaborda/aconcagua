baselines
baseline: spec

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

	spec for: #'pharo6.x' do: [ spec repository: (repositories at: #pharo60) ]
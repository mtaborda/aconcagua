versions
version400: spec
	<version: '4.0.0' imports: #('4.0.0-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #release.
			spec description: '4.0.0 final'.
			spec author: 'MaximilianoTaborda'.
			spec
				package: 'Aconcagua-Core';
				package: 'Aconcagua-Tests' ]
versions
version311: spec
	<version: '3.1.1' imports: #('3.1.1-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #release.
			spec description: '3.1.1 final'.
			spec author: 'MaximilianoTaborda'.
			spec
				package: 'Aconcagua-Core' with: 'Aconcagua-Core-MaximilianoTaborda.3.1.1';
				package: 'Aconcagua-Tests' with: 'Aconcagua-Tests-MaximilianoTaborda.3.1.1' ]
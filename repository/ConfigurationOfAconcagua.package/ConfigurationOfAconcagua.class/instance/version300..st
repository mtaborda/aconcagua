versions
version300: spec
	<version: '3.0.0' imports: #('3.0.0-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #release.
			spec description: '3.0.0 final'.
			spec author: 'MaximilianoTaborda'.
			spec
				package: 'Aconcagua-ArithmeticModel-Core' with: 'Aconcagua-ArithmeticModel-Core-MaximilianoTaborda.3.0.0';
				package: 'Aconcagua-ArithmeticModel-Tests' with: 'Aconcagua-ArithmeticModel-Tests-MaximilianoTaborda.3.0.0';
				package: 'Aconcagua-GraphModel-Core' with: 'Aconcagua-GraphModel-Core-MaximilianoTaborda.3.0.0';
				package: 'Aconcagua-GraphModel-Tests' with: 'Aconcagua-GraphModel-Tests-MaximilianoTaborda.3.0.0';
				package: 'Aconcagua-MeasureModel-Core' with: 'Aconcagua-MeasureModel-Core-MaximilianoTaborda.3.0.0';
				package: 'Aconcagua-MeasureModel-Tests' with: 'Aconcagua-MeasureModel-Tests-MaximilianoTaborda.3.0.2' ]
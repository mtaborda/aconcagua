versions
version400: spec
	<version: '4.0.0'>
	spec
		for: #common
		do: [ 
			spec blessing: #release.
			spec description: '- Aconcagua final for 4.x images'.
			spec author: 'MaximilianoTaborda'.
			spec
				baseline: 'Aconcagua' with: [ spec repository: 'github://mtaborda/aconcagua:master/src' ];
				import: 'Aconcagua' ]
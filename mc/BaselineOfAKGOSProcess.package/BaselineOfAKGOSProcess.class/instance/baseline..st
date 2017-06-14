baseline
baseline: spec
	<baseline>

	spec for: #common do: [ 
		spec blessing: #baseline.
		
		spec
			group: 'Core' with: #(#'AKG-OSProcess');
			group: 'all' with: #(#Core);
			group: 'default' with: #(#all).
		]
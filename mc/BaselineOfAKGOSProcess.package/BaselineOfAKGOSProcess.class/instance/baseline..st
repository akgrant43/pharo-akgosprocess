baseline
baseline: spec
	<baseline>

	"Note that neither OSProcess nor OSSubprocess are listed as dependencies.
	It is up to the user to load the appropriate package (both can't be loaded at the same time)"
	spec for: #common do: [ 
		spec blessing: #baseline.
		
		spec
			package: #'AKG-OSProcess';
			group: 'Core' with: #(#'AKG-OSProcess');
			group: 'all' with: #(#Core);
			group: 'default' with: #(#all).
		]
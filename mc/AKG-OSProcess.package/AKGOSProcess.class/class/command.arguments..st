instance creation
command: cmd arguments: args

	^(Smalltalk includesKey: #OSProcess) ifTrue: [
		self new
			command: cmd;
			arguments: args ]
		ifFalse: [
			AKGUnixSubprocess new
				command: cmd;
				arguments: args ].
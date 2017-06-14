accessing
commandString

	^String streamContents: [ :stream |
		stream << command.
		arguments do: [ :arg |
			stream nextPut: Character space.
			stream << arg ].
		]
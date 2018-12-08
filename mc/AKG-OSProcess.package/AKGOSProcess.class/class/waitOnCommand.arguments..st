as yet unclassified
waitOnCommand: command arguments: arguments
	"Run the supplied command / arguments.
	If the process fails, signal with SubprocessError"

	| proc |
	
	proc := self command: command arguments: arguments.
	proc runAndWait.
	proc isSuccess ifFalse: 
		[ SubprocessError signal: proc ].
	^proc